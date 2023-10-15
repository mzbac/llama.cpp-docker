FROM ubuntu:latest AS build

RUN apt-get update && \
    apt-get install -y git build-essential wget cmake

RUN git clone https://github.com/ggerganov/llama.cpp.git

WORKDIR llama.cpp

RUN mkdir build && cd build && \
    cmake -DLLAMA_AVX2_ONLY=ON .. && \
    cmake --build . --config Release

FROM ubuntu:latest AS runtime

RUN apt-get update && \
    apt-get install -y wget

COPY --from=build /llama.cpp/build /llama.cpp

COPY entrypoint.sh /llama.cpp/entrypoint.sh

WORKDIR /llama.cpp

RUN chmod +x /llama.cpp/entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["./entrypoint.sh"]
