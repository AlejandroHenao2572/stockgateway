error id: file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockService.java:java/lang/String#equals().
file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockService.java
empty definition using pc, found symbol in pc: java/lang/String#equals().
empty definition using semanticdb
empty definition using fallback
non-local guesses:

offset: 1093
uri: file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockService.java
text:
```scala
package com.example.stockgateway.service;

import com.example.stockgateway.provider.AlphaVantageClient;
import org.springframework.stereotype.Service;

/**
 * Servicio mínimo: sólo construye la función según 'type' y devuelve
 * el JSON crudo (String) que entrega el proveedor.
 */
@Service
public class StockService {

    private final AlphaVantageClient avClient;

    public StockService(AlphaVantageClient avClient) {
        this.avClient = avClient;
    }

    /**
     * Retorna el JSON crudo desde AlphaVantage (String) o null en error.
     */
    public String fetchRaw(String symbol, String type, String intradayInterval, String outputsize) {
        if (symbol == null || symbol.isBlank()) return null;

        String function = switch ((type == null ? "daily" : type.toLowerCase())) {
            case "intraday" -> "TIME_SERIES_INTRADAY";
            case "weekly"   -> "TIME_SERIES_WEEKLY";
            case "monthly"  -> "TIME_SERIES_MONTHLY";
            default         -> "TIME_SERIES_DAILY";
        };

        if ("TIME_SERIES_INTRADAY".e@@quals(function) && (intradayInterval == null || intradayInterval.isBlank())) {
            intradayInterval = "5min";
        }

        return avClient.call(function, symbol.toUpperCase(),
                "TIME_SERIES_INTRADAY".equals(function) ? intradayInterval : null,
                outputsize);
    }
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: java/lang/String#equals().