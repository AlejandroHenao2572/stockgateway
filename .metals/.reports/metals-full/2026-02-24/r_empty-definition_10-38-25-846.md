error id: file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockController.java:com/stockgateway/StockService#
file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockController.java
empty definition using pc, found symbol in pc: com/stockgateway/StockService#
empty definition using semanticdb
empty definition using fallback
non-local guesses:

offset: 102
uri: file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockController.java
text:
```scala
package com.stockgateway;

import com.fasterxml.jackson.databind.JsonNode;
import com.stockgateway.@@StockService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/stocks")
public class StockController {

    private final StockService stockService;

    public StockController(StockService stockService){
        this.stockService = stockService;
    }

    /**
     * GET /api/stocks?symbol=MSFT&type=intraday&intradayInterval=5min
     * type: intraday | daily | weekly | monthly (default: daily)
     */
    @GetMapping
    public ResponseEntity<JsonNode> getStock(
            @RequestParam String symbol,
            @RequestParam(defaultValue = "daily") String type,
            @RequestParam(required = false) String intradayInterval,
            @RequestParam(required = false) String outputsize
    ) {
        JsonNode result = stockService.fetch(symbol, type, intradayInterval, outputsize);
        return ResponseEntity.ok(result);
    }
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: com/stockgateway/StockService#