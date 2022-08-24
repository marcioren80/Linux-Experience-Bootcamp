# Criando um Servidor Web com Linux

## O que é um servidor WEB?

Para entender o que é um servidor web, vamos ver um pouco de como a internet funciona.
Ao acessar um site, utilizamos o protocolo http, que acessa a página que está armazenada em algum lugar remoto que é o servidor web onde ficam os arquivos das páginas dos sites.

Quando digitamos um site no navegador, por exemplo <https://web.dio.me/home>, um servidor DNS que conhece o IP deste servidor, direciona a requisição para o servidor onde o site se encontra hospedado.

<br>

## Instalando o apache2

<br>
Instalação do apache2

> apt install apache2

<br>
Verificar se está em execução:

> systemctl status apache2

<br>
Pasta principal onde fica o index.html

> /var/www/html

<br>
Faz o backup

> mv index.html index.html.bkp <br>

<br> 
E cria um arquivo novo: <br>

>     <!DOCTYPE html> <br>
>     <html lang="pt-br"> <br>
>     <head> <br>
>         <meta charset="UTF-8"> <br>
>         <meta http-equiv="X-UA-Compatible" content="IE=edge"> <br>
>         <meta name="viewport" content="width=device-width, initial-scale=1.0"> <br>
>         <title>Document</title> <br>
>     </head> <br>
>     <body> <br>
>         <h1>Este é um exemplo de site no servidor web.</h1> <br>
>     </body> <br>
>     </html> <br>
