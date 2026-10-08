# Detección de amenazas en AWS con Wazuh y recomendaciones asistidas por IA local

Este es mi proyecto intermodular del ciclo de Administración de Sistemas Informáticos
en Red (ASIR). La idea es montar con Terraform, sobre AWS, un sistema que detecte
ataques contra los servidores de una pyme y que, cuando pase algo grave, me avise
explicándomelo en lenguaje normal y proponiendo qué hacer.

Parto de un problema concreto: herramientas como Wazuh detectan ataques, pero sus
alertas son muy técnicas y una pyme normalmente no tiene un analista de seguridad para
interpretarlas. En vez de mandar esos datos a un servicio externo o a una IA en la nube,
aquí la explicación la genera un modelo de lenguaje que corre en el propio servidor (con
Ollama), así la información no sale de la empresa. El aviso llega al móvil del
administrador por Telegram.

Todo se despliega con Terraform para poder repetirlo en otra cuenta de AWS cambiando solo
unas variables, y con la seguridad cuidada desde el principio: mínimo privilegio, cifrado
y las credenciales fuera del código.

## Estado

El proyecto está empezando. Lo construyo por fases y de momento solo está planteada la
estructura de ficheros; el código de cada parte lo voy escribiendo yo según avanzo. Cada
fichero lleva dentro un comentario con lo que tengo que poner ahí.

## Fases

1. Red y seguridad perimetral: la VPC, la subred, las rutas y los grupos de seguridad con
   mínimo privilegio. Es en lo que estoy ahora.
2. Servidor de análisis: la instancia EC2 con Wazuh y el modelo local, las credenciales en
   Parameter Store, IMDSv2 y permisos IAM mínimos.
3. Conexión y detección: el agente de Wazuh en los servidores vigilados y las reglas de
   detección de ataques web.
4. Aviso inteligente: juntar la alerta con la respuesta del modelo local y mandarla por
   Telegram, agrupando las alertas repetidas.
5. Banco de pruebas: lanzar ataques web de prueba y tráfico legítimo para medir cuánto
   detecta, los falsos positivos y comparar modelos.
6. Extras y documentación: validación automática, respuesta activa y una guía para
   desplegarlo.

## Tecnologías

AWS (EC2, VPC, IAM, Systems Manager Parameter Store), Terraform, Wazuh, Ollama
(probando TinyLlama y Llama 3.2 para comparar), Docker con OWASP Juice Shop para las
pruebas, Python y Bash para los scripts, y la API de bots de Telegram para los avisos.

## Estructura

Por ahora:

    terraform/    la infraestructura (de momento la fase 1)

Iré añadiendo carpetas para los scripts y la documentación según vaya avanzando.

## Uso

Todavía no es desplegable. Cuando tenga la fase 1 escrita, el uso será el habitual de
Terraform: entrar en `terraform/`, copiar `terraform.tfvars.example` a `terraform.tfvars`,
rellenarlo con mis valores y lanzar `terraform init`, `terraform plan` y `terraform apply`.
Al terminar las pruebas, `terraform destroy` para no dejar nada encendido y no gastar.

## Autor

Darius Costea Mihail. ASIR, modalidad virtual. Curso 2026-2027.
Tutora del proyecto: Simona Ionescu.

## Licencia

MIT. Ver el fichero LICENSE.
