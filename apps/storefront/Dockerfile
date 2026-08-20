# apps/storefront/Dockerfile
# Build context MUST be the monorepo root in docker-compose.yml
FROM node:22-alpine AS base

WORKDIR /app

COPY package*.json ./
COPY turbo.json ./
COPY apps ./apps

RUN npm ci

# Next.js bakes NEXT_PUBLIC_* vars in at BUILD time, not runtime.
# These ARGs receive values from docker-compose.yml's build.args section.
ARG NEXT_PUBLIC_MEDUSA_BACKEND_URL
ARG NEXT_PUBLIC_MEDUSA_PUBLISHABLE_KEY
ENV NEXT_PUBLIC_MEDUSA_BACKEND_URL=$NEXT_PUBLIC_MEDUSA_BACKEND_URL
ENV NEXT_PUBLIC_MEDUSA_PUBLISHABLE_KEY=$NEXT_PUBLIC_MEDUSA_PUBLISHABLE_KEY

RUN npx turbo build --filter=@dtc/storefront

WORKDIR /app/apps/storefront

EXPOSE 8000
ENV PORT=8000
ENV NODE_ENV=production

CMD ["npm", "run", "start"]
