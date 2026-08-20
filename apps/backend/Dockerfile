# apps/backend/Dockerfile
# Build context MUST be the monorepo root in docker-compose.yml
FROM node:22-alpine AS base

WORKDIR /app

# Copy root workspace config + lockfile
COPY package*.json ./
COPY turbo.json ./

# Copy BOTH app folders — npm workspaces needs all referenced workspaces present
COPY apps ./apps

# Install all workspace dependencies (matches your lockfile)
RUN npm ci

# Build only the backend package (and anything it depends on) via turbo filter
RUN npx turbo build --filter=@dtc/backend

WORKDIR /app/apps/backend

EXPOSE 9000

CMD ["sh", "-c", "npx medusa db:migrate && npx medusa start"]
