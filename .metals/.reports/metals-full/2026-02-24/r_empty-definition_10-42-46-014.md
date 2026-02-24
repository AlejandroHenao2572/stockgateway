error id: file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockController.java:_empty_/ObjectMapper#
file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockController.java
empty definition using pc, found symbol in pc: _empty_/ObjectMapper#
empty definition using semanticdb
empty definition using fallback
non-local guesses:

offset: 645
uri: file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockController.java
text:
```scala
package com.stockgateway;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/stocks")
public class StockController {

    private final StockService stockService;

    public StockController(StockService stockService){
        this.stockService = stockService;
    }

    @GetMapping
    public ResponseEntity<JsonNode> getStock() throws Exception {
        String result = stockService.fetch();
        ObjectMapper mapper = new ObjectMa@@pper();
        JsonNode jsonNode = mapper.readTree(result);
        return ResponseEntity.ok(jsonNode);
    }
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: _empty_/ObjectMapper#