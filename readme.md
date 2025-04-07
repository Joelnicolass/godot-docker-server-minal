# 🕹️ Godot Headless Server en Docker

Este repositorio contiene instrucciones y recordatorios para construir, desplegar y mantener un servidor dedicado de Godot en un entorno Docker, ideal para juegos multijugador.

---

## 📝 Recordatorios

### 1. Build de la imagen Docker

```bash
# Habilitar BuildKit y especificar plataforma AMD64
export DOCKER_BUILDKIT=1

docker buildx build \
  --platform linux/amd64 \
  -t nombre-imagen:4.4.1 .
```

### 2. Ejecutar localmente

```bash
docker run -d \
  -p 127.0.0.1:7777:7777/udp \
  --name nombre-servidor \
  nombre-imagen:4.4.1
```

### 3. Subir la imagen a Docker Hub

```bash
# Etiquetar la imagen local
docker tag nombre-imagen:4.4.1 usuario/repositorio:latest

# Subir al repositorio remoto
docker push usuario/repositorio:latest

# Alternativa: construir y pushear en un solo paso
docker buildx build \
  --platform linux/amd64 \
  -t usuario/repositorio:latest \
  --push .
```

### 4. Limpieza de contenedores e imágenes

```bash
# Eliminar todos los contenedores detenidos
docker rm $(docker ps -a -q)

# Eliminar todas las imágenes
docker rmi $(docker images -a -q)
```

### 5. Pull y ejecución en VPS

```bash
# Descargar la imagen desde Docker Hub
docker pull usuario/repositorio:latest

# Ejecutar el contenedor en segundo plano
docker run -d \
  --name nombre-servidor \
  -p 7777:7777/udp \
  usuario/repositorio:latest
```

### 6. Monitoreo y logs

```bash
# Ver contenedores activos
docker ps

# Seguir logs del servidor
docker logs -f nombre-servidor
```

### 7. Eliminar versión actual en VPS

```bash
docker stop nombre-servidor
docker rm nombre-servidor
docker rmi usuario/repositorio:latest
```

### 8. Acceso a la VPS

```bash
# Conexión SSH al servidor
ssh root@IP_DEL_SERVIDOR

# Verificar Docker instalado
docker --version

# (Si no está instalado)
apt update && apt install -y docker.io

# Descargar imagen de Godot desde Docker Hub
docker pull usuario/repositorio

# Correr el contenedor
docker run -d \
  --name nombre-servidor \
  -p 7777:7777/udp \
  usuario/repositorio

# Verificar y seguir logs
docker ps
docker logs -f nombre-servidor
```

---

## 🔄 Sustituir valores genéricos

| Genérico          | Descripción                            |
| ----------------- | -------------------------------------- |
| `usuario`         | Tu usuario en Docker Hub               |
| `repositorio`     | Nombre de tu repositorio en Docker Hub |
| `nombre-imagen`   | Nombre de la imagen local              |
| `nombre-servidor` | Nombre del contenedor Docker           |
| `IP_DEL_SERVIDOR` | Dirección IP pública de la VPS         |

---

¡Listo para desplegar tu servidor Godot en Docker! 🎮
