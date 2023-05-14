#!/bin/bash
# Iniciar el servicio MariaDB
mysqld
# Mantener el contenedor en ejecución
tail -f /dev/null