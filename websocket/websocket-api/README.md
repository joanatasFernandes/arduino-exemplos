# Websocket API

## Setup

- Update submodules

````shell
make update
````

- Testing

````shell
make test
````

- Running

````shell
make run
````

```shell
curl --request POST \
  --url https://app-workspace.com/arduino-websocket/api/authorization \
  --header 'accept: application/json' \
  --header 'content-type: application/json' \
  --data '{"username":"arduino@websocket.com", "password": "123456"}'
```


