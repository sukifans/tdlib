# 镜像

``mmx233/tdlib:latest``

# 构建

```shell
docker buildx build --file Dockerfile --platform linux/amd64,linux/arm64,linux/arm/v7 --tag mmx233/tdlib:latest --push .
```