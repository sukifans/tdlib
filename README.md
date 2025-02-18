# 镜像

``mmx233/tdlib:latest``

# 构建

[go_dep_repo](https://github.com/zelenin/go-tdlib)

```shell
export COMPOSE_PARALLEL_LIMIT=1
docker buildx build --file Dockerfile.alpine --platform linux/amd64,linux/386,linux/arm/v6,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/riscv64 --tag mmx233/tdlib:latest --push .
```
