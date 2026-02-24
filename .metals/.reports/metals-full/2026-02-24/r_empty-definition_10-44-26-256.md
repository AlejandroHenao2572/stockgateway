error id: file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockService.java:_empty_/RestTemplate#getForObject#
file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockService.java
empty definition using pc, found symbol in pc: _empty_/RestTemplate#getForObject#
empty definition using semanticdb
empty definition using fallback
non-local guesses:

offset: 482
uri: file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockService.java
text:
```scala
package com.stockgateway;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class StockService {

    private final RestTemplate rest = new RestTemplate();

    public String fetch() {
        String url = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&month=2009-01&outputsize=full&apikey=V9ES2852XZ6343L7";
        try {
            return rest.getForObject@@(url, String.class);
        } catch (Exception ex) {
            return null;
        }
    }
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: _empty_/RestTemplate#getForObject#