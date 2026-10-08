# aqui creo los grupos de seguridad con minimo privilegio, uno por cada nodo.
# tengo que hacer:
# - manager: ssh y dashboard (443) solo desde mi ip, y 1514/1515 solo desde la victima.
# - victima: web (80) desde el atacante y desde mi ip, y ssh desde mi ip.
# - atacante: solo ssh desde mi ip.
# - abrir la salida justo para descargar paquetes, imagenes y modelos.
