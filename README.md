# Arduino exemplos

## Configurando o `Arduino IDEA`

- No menu `File>Preferences`, adicione a url abaixo, em Addition Boards Manager URLs

```http request
http://arduino.esp8266.com/stable/package_esp8266com_index.json
```

![arduino_pref.png](images%2Farduino_pref.png)

Após informa a url, clique em ok, feche e abra novamente o `Arduino IDEA`

- No menu `Tools`, selecione o módulo `Generic ESP8285 Module`

![arduino_module_select.png](images%2Farduino_module_select.png)

- Com o módulo conectado via USB, selecione o mesmo em `Port`

> Caso esteja usando o Ubuntu e o USB não esteja aparecendo no `Arduino IDEA`, execute o comando `sudo chmod a+rw /dev/ttyUSB0` e depois tente novamente

![arduino_usb_select.png](images%2Farduino_usb_select.png)


