# apps/backend/Dockerfile
# NOTE: build context for this service must be the MONOREPO ROOT, not apps/backend
FROM node:22-alpine AS base

WORKDIR /app

# Copy root-level workspace files first (lockfile lives at repo root in a monorepo)
COPY package*.json ./
COPY turbo.json ./
COPY apps/backend ./apps/backend

# Install only what's needed, using the root lockfile
RUN npm ci

WORKDIR /app/apps/backend
RUN npm run build

EXPOSE 9000

CMD ["sh", "-c", "npx medusa db:migrate && npx medusa start"]
