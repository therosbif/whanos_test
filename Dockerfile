FROM whanos-c as builder

COPY . /app
WORKDIR /app

RUN make

FROM gcc:11.2

WORKDIR /app
COPY --from=builder /app/compiled-app ./compiled-app 

CMD ["./compiled-app"]
