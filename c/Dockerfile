FROM alpine:latest

RUN apk add --no-cache gcc libc-dev bash

WORKDIR /app

COPY listen_and_save.sh .
COPY c_executor.sh .

RUN chmod +x listen_and_save.sh c_executor.sh

CMD ["sh", "-c", "./listen_and_save.sh && ./c_executor.sh"]

