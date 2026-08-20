# apps/storefront/Dockerfile
# NOTE: build context for this service must be the MONOREPO ROOT, not apps/storefront
FROM node:22-alpine AS base

WORKDIR /app

COPY package*.json ./
COPY turbo.json ./
COPY apps/storefront ./apps/storefront

RUN npm ci

WORKDIR /app/apps/storefront
RUN npm run build

EXPOSE 8000
ENV PORT=8000
ENV NODE_ENV=production

CMD ["npm", "run", "start"]
