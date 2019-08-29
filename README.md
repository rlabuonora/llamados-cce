Llamados Cce
================
Una app para administrar llamados de consultores


## Deploy a Heroku

-1. Correr specs
0. Loguearse a heroku
1. Create app en heroku
2. set environment variables
$ heroku config:set ADMIN_NAME=example@transformauruguay.gub.uy
$ heroku config set ADMIN_PASSWORD=changeme
3. run migrations
$ heroku run rake:db migrate
4. seed
$ heroku run rake:db seed
4. open app


## Cuentas

dev: example@transformauruguay.gub.uy
     changeme
