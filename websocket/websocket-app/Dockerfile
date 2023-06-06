FROM cirrusci/flutter:latest as builder

RUN apt-get update
RUN apt-get install -y make
RUN apt-get clean

RUN mkdir /app/

COPY . /app/
WORKDIR /app/

RUN rm -rf build
RUN make web-build targetBuild=prod

FROM nginx:1.21.0-alpine as production

COPY --from=builder /app/build/web/ /usr/share/nginx/html/

# Add your nginx.conf
COPY web/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
