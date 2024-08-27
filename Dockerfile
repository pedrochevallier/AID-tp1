# Usamos la imagen oficial de MySQL como base
FROM mysql:8.0

# Establecemos las variables de entorno para la base de datos
ENV MYSQL_DATABASE=ventas \
    MYSQL_ROOT_PASSWORD=root \
    MYSQL_PASSWORD=root

# Copiamos un script SQL (si tienes uno) para inicializar la base de datos
# Asegúrate de que "init.sql" esté en el mismo directorio que el Dockerfile
COPY init.sql /docker-entrypoint-initdb.d/

COPY ./UsedVehiclesSells.csv /var/lib/mysql-files

# Exponemos el puerto por el que se accederá a MySQL
EXPOSE 3306

# No necesitas CMD ya que la imagen oficial de MySQL lo maneja automáticamente
