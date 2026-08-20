# apps/storefront/Dockerfile
FROM node:20-alpine AS base

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci

# Copy source and build
COPY . .
RUN npm run build

# Expose Next.js default port
EXPOSE 8000

ENV PORT=8000
ENV NODE_ENV=production

CMD ["npm", "run", "start"]
