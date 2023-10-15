# llama.cpp-docker
This project builds a Docker image for llama.cpp server with only AVX2 enabled, which is more compatible with x86 CPUs.

## Usage
### Pull the Docker image from the GitHub Container Registry using the following command:

```
docker pull ghcr.io/mzbac/mzbac/llama.cpp-docker:latest
```

### Running the Container with Models Volume

```
docker run -it --rm -p 3000:8080 -v /path/on/host/to/models:/llama.cpp/models ghcr.io/mzbac/mzbac/llama.cpp-docker:latest

```
### Inspecting the container image

```
docker run -it --rm --entrypoint /bin/sh -p 3000:8080 -v ./models:/llama.cpp/models ghcr.io/mzbac/mzbac/llama.cpp-docker:latest
``````