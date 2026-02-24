error id: file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockController.java:_empty_/StockService#getInfo#
file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockController.java
empty definition using pc, found symbol in pc: _empty_/StockService#getInfo#
empty definition using semanticdb
empty definition using fallback
non-local guesses:

offset: 687
uri: file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockController.java
text:
```scala
package com.stockgateway;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class StockController {

    private final StockService stockService;

    public StockController(StockService stockService){
        this.stockService = stockService;
    }

    @GetMapping("/stocks")
    public ResponseEntity<String> getStock(){
        return(ResponseEntity.ok(stockService.getI@@nfo()));
    }
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: _empty_/StockService#getInfo#