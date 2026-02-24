package com.stockgateway;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class StockController {

    private final StockService stockService;

    public StockController(StockService stockService){
        this.stockService = stockService;
    }

    @GetMapping("/stocks")
    public ResponseEntity<String> getStock(){
        return(ResponseEntity.ok(stockService.getStock()));
    }
}