
# Link deploy:
---

https://backend-bingo-driven.onrender.com 

---

# Execução do Projeto

Siga os passos abaixo para rodar seu backend com PostgreSQL usando Docker.

---

## 1. Criar uma network Docker

```bash
docker network create NOMENETWORK
```

> Substitua `NOMENETWORK` pelo nome que desejar para a rede de containers.

---

## 2. Criar um volume Docker para persistência do banco

```bash
docker volume create NOMEVOLUME
```

> Substitua `NOMEVOLUME` pelo nome do volume que deseja criar.

---

## 3. Criar e executar o container PostgreSQL

```bash
docker run -d \
  --name NOMECONTAINERPOSTGRES \
  --network NOMENETWORK \
  -e POSTGRES_PASSWORD=SUASENHAPOSTGRES \
  -p 5433:5432 \
  -v NOMEVOLUME:/var/lib/postgresql/data \
  postgres
```

- `NOMECONTAINERPOSTGRES`: nome do container do banco
- `SUASENHAPOSTGRES`: senha para o usuário `postgres`
- `NOMENETWORK` e `NOMEVOLUME`: use os nomes criados nos passos anteriores

---

## 4. Construir a imagem do backend

No diretório do backend (onde está o Dockerfile), execute:

```bash
docker build -t mybackend .
```

---

## 5. Executar o container do backend

```bash
docker run -d \
  --name NOMECONTAINER \
  --network NOMENETWORK \
  -e DATABASE_URL=postgresql://postgres:SUASENHAPOSTGRES@NOMECONTAINERPOSTGRES:5432/NOMEBANCODEDADOS?schema=public \
  -p 5000:5000 \
  mybackend
```

- `NOMECONTAINER`: nome do container do backend
- `DATABASE_URL`: string de conexão do backend com o banco

---

# Rodar a aplicação com Docker Compose

No terminal, no mesmo diretório do `docker-compose.yml`, execute:

```bash
docker compose up -d --build
```


## Parar a aplicação

Para derrubar os containers criados pelo Compose:

```bash
docker compose down
```

## Considerações finais

- O backend ficará disponível em `http://localhost:5000`.
- O banco PostgreSQL estará acessível na porta local `5433`.

---
