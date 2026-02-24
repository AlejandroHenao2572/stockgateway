# Docker: build and run

Build the image (from project root):

```bash
docker build -t stockgateway:latest .
```

Run the container (maps port 8080):

```bash
docker run --rm -p 8080:8080 stockgateway:latest
```

Notes:
- The Dockerfile uses a multi-stage build: Maven + JDK 21 to build, Temurin JRE 21 to run.
- If you prefer to build locally with Maven and then create an image from the produced jar, run `mvn clean package` and then build the image.
