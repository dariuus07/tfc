# aqui monto la red de la fase 1, que es la base de todo lo demas.
# tengo que crear:
# - la vpc aislada con el dns habilitado.
# - la subred publica y el internet gateway.
# - la tabla de rutas con la salida a internet (0.0.0.0/0) y asociarla a la subred.
# - bloquear el grupo de seguridad por defecto de la vpc para que quede sin reglas.
