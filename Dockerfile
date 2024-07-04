# Stage 1: Build ollama service
FROM ollama/ollama:latest

RUN apt-get -y update && apt-get -y install ca-certificates curl && apt-get -y clean && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://d.juicefs.com/install | sh -

COPY setup.sh ./
RUN chmod +x ./setup.sh

ENTRYPOINT ["/setup.sh"]
