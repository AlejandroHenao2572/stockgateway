error id: file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockService.java:java/net/http/HttpRequest#newBuilder(+2).
file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockService.java
empty definition using pc, found symbol in pc: java/net/http/HttpRequest#newBuilder(+2).
empty definition using semanticdb
empty definition using fallback
non-local guesses:

offset: 615
uri: file:///C:/Users/aleja/Downloads/stockgateway/stockgateway/src/main/java/com/stockgateway/StockService.java
text:
```scala
package com.stockgateway;

import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;

@Service
public class StockService {
    private static HttpClient client = HttpClient.newBuilder().connectTimeout(Duration.ofSeconds(10)).build();

    public String getStock(){
        String url = "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=IBM&apikey=demoV9ES2852XZ6343L7";

        HttpRequest request = HttpRequest.ne@@wBuilder().uri(URI.create(url)).build();

        try {
            HttpResponse<String> response = client.send(request,HttpResponse.BodyHandlers.ofString());
            return response.body();
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: java/net/http/HttpRequest#newBuilder(+2).