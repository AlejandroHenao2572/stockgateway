error id: file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockService.java:java/util/Map#
file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockService.java
empty definition using pc, found symbol in pc: java/util/Map#
empty definition using semanticdb
empty definition using fallback
non-local guesses:

offset: 2989
uri: file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockService.java
text:
```scala
package com.stockgateway;

import com.example.stockgateway.cache.SimpleCache;
import com.example.stockgateway.provider.AlphaVantageClient;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.Map;
import java.util.regex.Pattern;

@Service
public class StockService {

    private final AlphaVantageClient avClient;
    private final SimpleCache cache;
    private final ObjectMapper mapper = new ObjectMapper();
    private final Pattern timeSeriesPattern = Pattern.compile("time series", Pattern.CASE_INSENSITIVE);

    public StockService(AlphaVantageClient avClient, SimpleCache cache) {
        this.avClient = avClient;
        this.cache = cache;
    }

    /**
     * Orquesta llamada a AlphaVantage, aplica cache simple y normaliza respuesta
     * para incluir siempre "timeSeries" si se detecta la sección de series temporales.
     */
    public JsonNode fetch(String symbol, String type, String intradayInterval, String outputsize) {
        if (symbol == null || symbol.isBlank()) return null;

        String function;
        switch (type.toLowerCase()) {
            case "intraday":
                function = "TIME_SERIES_INTRADAY";
                if (intradayInterval == null || intradayInterval.isBlank()) intradayInterval = "5min";
                break;
            case "weekly":
                function = "TIME_SERIES_WEEKLY";
                intradayInterval = null;
                break;
            case "monthly":
                function = "TIME_SERIES_MONTHLY";
                intradayInterval = null;
                break;
            default:
                function = "TIME_SERIES_DAILY";
                intradayInterval = null;
        }

        String cacheKey = function + "|" + symbol.toUpperCase() + "|" + (intradayInterval == null ? "-" : intradayInterval) + "|" + (outputsize == null ? "-" : outputsize);

        // Revisar cache
        String cached = cache.get(cacheKey);
        if (cached != null) {
            try {
                return mapper.readTree(cached);
            } catch (Exception e) {
                // si falla el parseo del cached, seguimos a pedir al proveedor
            }
        }

        // Llamar proveedor
        String raw = avClient.call(function, symbol.toUpperCase(), intradayInterval, outputsize);
        if (raw == null) return null;

        try {
            JsonNode root = mapper.readTree(raw);
            ObjectNode normalized = mapper.createObjectNode();
            if (root.isObject()) normalized.setAll((ObjectNode) root);
            // Buscar propiedad que contenga "Time Series" y copiarla bajo "timeSeries"
            for (Iterator<Map.Entry<String, JsonNode>> it = root.fields(); it.hasNext(); ) {
                @@Map.Entry<String, JsonNode> e = it.next();
                if (timeSeriesPattern.matcher(e.getKey()).find()) {
                    normalized.set("timeSeries", e.getValue());
                    break;
                }
            }
            String toCache = mapper.writeValueAsString(normalized);
            cache.put(cacheKey, toCache);
            return normalized;
        } catch (Exception e) {
            // en caso de fallo de parseo, devolver objeto con raw
            try {
                ObjectNode node = mapper.createObjectNode();
                node.put("raw", raw);
                cache.put(cacheKey, mapper.writeValueAsString(node));
                return node;
            } catch (Exception ex) {
                return null;
            }
        }
    }
}

```


#### Short summary: 

empty definition using pc, found symbol in pc: java/util/Map#