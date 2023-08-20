# Eita Backend

O produto consiste em aplicativo de geração de conteúdo de educação personalizado para o usuário.

No backend temos os principais endpoints:

- `user/create` - Criar o usuário e o seu embedding de interesse conforme as escolhas iniciais do onboard
- `user/update` - Atualizar o usuário e o seu embedding conforme o conteúdo consumido
- `feed/index` - Listar os conteúdos recomendados para o usuário
- `content/classify` - Classificar o conteúdo para personalizar ainda mais o seu embedding

O embedding de interesse do usuário por padrão só é recalculado durante [um cronjob](https://github.com/vitebo/eita-backend/blob/main/config/schedule.rb).
Esse cronjob recalcula apenas os usuários que tiveram algum tipo de interação com o conteúdo depois do ultimo cron

## Stack

- Ruby 3.2.2
- Rails 7.0.7
- Postgres 13.3
- PgVector 0.4.4
- ruby-openai
- cosine-similarity

## Setup

Para rodar o projeto é necessário ter o [Docker](https://docs.docker.com/get-docker/) e o [Docker Compose](https://docs.docker.com/compose/install/) instalados.

Você precisa criar um arquivo `.env` na raiz do projeto com as seguintes variáveis:

```sh
OPENAI_API_KEY=****
```

Para rodar o projeto basta executar o comando:

```sh
docker compose up -d
```
