error id: file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockService.java:java/lang/String#isBlank().
file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockService.java
empty definition using pc, found symbol in pc: java/lang/String#isBlank().
empty definition using semanticdb
empty definition using fallback
non-local guesses:

offset: 1453
uri: file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockService.java
text:
```scala
package com.stockgateway;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

/**
 * Servicio mínimo que construye la URL de AlphaVantage y realiza la petición HTTP directamente.
 * Devuelve el JSON crudo (String) que responde AlphaVantage o null en caso de error.
 *
 * Nota: ya no existe componente "provider"; toda la llamada se hace aquí.
 */
@Service
public class StockService {

    private final RestTemplate rest = new RestTemplate();

    @Value("${alphavantage.base-url}")
    private String baseUrl;

    @Value("${alphavantage.api-key}")
    private String apiKey;

    @Value("${alphavantage.default-outputsize:compact}")
    private String defaultOutputSize;

    /**
     * Construye la función según 'type' y hace GET directo a AlphaVantage.
     *
     * @param symbol           Símbolo (ej. "MSFT")
     * @param type             intraday|daily|weekly|monthly (default: daily)
     * @param intradayInterval intervalo para intraday (1min,5min,15min,30min,60min)
     * @param outputsize       optional: compact|full
     * @return JSON crudo como String o null si falla la petición
     */
    public String fetch(String symbol, String type, String intradayInterval, String outputsize) {
        if (symbol == null || symbol.isBlank@@()) return null;

        String function = switch ((type == null ? "daily" : type.toLowerCase())) {
            case "intraday" -> "TIME_SERIES_INTRADAY";
            case "weekly"   -> "TIME_SERIES_WEEKLY";
            case "monthly"  -> "TIME_SERIES_MONTHLY";
            default         -> "TIME_SERIES_DAILY";
        };

        if ("TIME_SERIES_INTRADAY".equals(function) && (intradayInterval == null || intradayInterval.isBlank())) {
            intradayInterval = "5min";
        }

        String outSize = (outputsize == null || outputsize.isBlank()) ? defaultOutputSize : outputsize;

        try {
            UriComponentsBuilder b = UriComponentsBuilder.fromUriString(baseUrl)
                    .queryParam("function", function)
                    .queryParam("symbol", symbol.toUpperCase())
                    .queryParam("apikey", apiKey)
                    .queryParam("outputsize", outSize);

            if ("TIME_SERIES_INTRADAY".equals(function)) {
                b.queryParam("interval", intradayInterval);
            }

            String url = b.build().toUriString();
            return rest.getForObject(url, String.class);
        } catch (Exception ex) {
            return null;
        }
    }
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: java/lang/String#isBlank().