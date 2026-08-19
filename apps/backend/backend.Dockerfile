# apps/backend/Dockerfile
FROM node:22-alpine AS base

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci

# Copy source and build
COPY . .
RUN npm run build

# Expose Medusa's default port
EXPOSE 9000

# Run DB migrations then start the server
CMD ["sh", "-c", "npx medusa db:migrate && npx medusa start"]
