# apps/storefront/Dockerfile
# Build context MUST be the monorepo root in docker-compose.yml
FROM node:22-alpine AS base

WORKDIR /app

COPY package*.json ./
COPY turbo.json ./
COPY apps ./apps

RUN npm ci

RUN npx turbo build --filter=@dtc/storefront

WORKDIR /app/apps/storefront

EXPOSE 8000
ENV PORT=8000
ENV NODE_ENV=production

CMD ["npm", "run", "start"]
