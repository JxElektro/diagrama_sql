# diagrama_sql

https://dbdiagram.io/d/633e2826f0018a1c5fa37a7b

![database](https://user-images.githubusercontent.com/107572992/194345789-7c2ee5ad-24df-4769-adf1-64e1c034eb99.png)

Un diagrama de un hotel que permite llevar el control de la cuenta de los huespedes, el estado de la habitacion y que camarera la hizo, tambien basado en la fecha de entrada y salida calcular el saldo a pagar.


Relaciones creadas

Guest.public ID < * a 1> Guest.private ID =  muchos huespedes pueden tener solo 1 informacion privada

Guest.public ID < * a * > Room.public ID = muchos huespedes pueden tener muchas habitaciones

Guest.public account < 1 a 1 > Room.public total price = de uno a uno porque cada cuenta es independiente 

Room.public ID < 1 a 1 > Room.private =  muchas habitaciones pueden tener solo 1 informacion privada

Room.public ID < * a * > Room_date.public = muchas habitaciones pueden tener muchas fechas

Room.public Total_price < 1 a 1 > todal_days = porque la cantidad de dias puede variar pero no el account

Room.public Total_price < 1 a * > price_days = porque el precio puede variar pero no el account

date.public chk_in < 1 a 1 > Room_date.public = el check in es solo un dia pero los dias totales pueden variar

date.public chk_our < * a * > Room_date.public = el check out puede variar lo que puede afectar la cantidad totales de dias

room.private id < * a 1 > room.public = porque muchas habitaciones pueden tener solo 1 info privada

room.private cleaning_by < 1 a 1 > = porque cada habitacion fue hecha por 1 camarera

room.private cleaning_status < 1 a 1 > = porque cada habitacion puede ser hecha una sola vez
.
