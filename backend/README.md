# Food Blueprint Backend

Rest API server pro perzistentní uložení dat aplikace.

## Požadavky

- [Docker](https://www.docker.com/)
- [NodeJS](https://nodejs.org/en)
- Node package manager (npm / [yarn](https://yarnpkg.com/) / [pnpm](https://pnpm.io/) / [bun](https://bun.sh/)) \
*pro vývoj je možné použít Bun jako package manager, bohužel ale Bun runtime není kompatibilní pro spuštění výsledného serveru (https://github.com/oven-sh/bun/issues/4290)*
- PostgreSQL klient https://www.postgresql.org/

## Příprava pro spuštění
*npm nahraďte nainstalovaným package managerem*

Spuštění Postgre databáze \
`docker compose up -d`
(nastavené údaje: `postgres:posgres`)

Vytvoření databáze pro aplikační data \
`psql -h 127.0.0.1 -U postgres -c 'CREATE DATABASE "foodblue";'` \
(heslo `postgres`)

Nainstalování balíčků aplikace \
`npm install` \
(v případě využití Bun jako package manageru je nutné ručně sestavit binárku pro node-canvas - Bun nepovoluje post-install skripty; `cd node_modules/canvas && npm install --build-from-sources`)

Vytvoření `.env` konfiguračního souboru z templatu \
`cp .env.template .env` \
(nastavte připojení k databázi - všechny proměnné začínající s `PG_`)

Vytvoření aplikačního klíče \
`node ace generate:key` \
Zkopírujte klíč do `.env` pod `APP_KEY`

Spuštění migrací \
`node ace migration:run`
(případně můžete do databáze nasypat demonstrační data - ingredience a burger pomocí `node ace db:seed`)

Nastavte `API_KEY` pro neefektivní, ale dostatečnou prevenci cizího připojení, tuto hodnotu poté nastavte v `.env` mobilní aplikace.

Spuštění aplikace pro vývoj s hot reload \
`npm run dev`

## Sestavení pro produkční prostředí
*Vyžaduje splněné kroky pro vývoj*

Sestavit výsledný javascript serveru \
`npm run build`

Spustit aplikace \
`npm start`

## Použité knihovny

- [Adonis](https://adonisjs.com/) - [licence](./licenses/ADONIS.md)
- [Node Canvas](https://www.npmjs.com/package/canvas)
- [merge-images](https://www.npmjs.com/package/merge-images)

Licence použitých knihoven jsou dostupné pod jejich odkazy.
