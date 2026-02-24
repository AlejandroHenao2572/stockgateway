error id: file:///C:/Users/aleja/OneDrive/Desktop/stockgateway/stockgateway/src/client/concurrentClient.java:java/net/http/HttpResponse#BodyHandlers#
file:///C:/Users/aleja/OneDrive/Desktop/stockgateway/stockgateway/src/client/concurrentClient.java
empty definition using pc, found symbol in pc: java/net/http/HttpResponse#BodyHandlers#
empty definition using semanticdb
empty definition using fallback
non-local guesses:

offset: 651
uri: file:///C:/Users/aleja/OneDrive/Desktop/stockgateway/stockgateway/src/client/concurrentClient.java
text:
```scala
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;

public class APIServiceClient {
    private static HttpClient client = HttpClient.newBuilder().connectTimeout(Duration.ofSeconds(10)).build();

    public String getInfo(){
        String url = "http://localhost:8080/api/info";
        HttpRequest request = HttpRequest.newBuilder().uri(URI.create(url)).build();

        try {
            HttpResponse<String> response = client.send(request,HttpResponse.Bo@@dyHandlers.ofString());
            return response.body();
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args){
        for (int i = 0; i<100; i++){
            Thread thread = new Thread(() -> {
                APIServiceClient client = new APIServiceClient();
                System.out.println(client.getInfo());
            });

            thread.start();
        }
    }
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: java/net/http/HttpResponse#BodyHandlers#