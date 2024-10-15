FROM alpine:latest

RUN adduser -D -g '' limiteduser

RUN apk add --no-cache gcc libc-dev bash

RUN mkdir /app && chown limiteduser:limiteduser /app

WORKDIR /app

COPY listen_and_save.sh .
COPY c_executor.sh .

RUN chmod +x listen_and_save.sh c_executor.sh

USER limiteduser

CMD ["sh", "-c", "./listen_and_save.sh && ./c_executor.sh"]

