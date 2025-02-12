# Stage 1: Install dependencies and build
# FROM oven/bun AS builder

# WORKDIR /app

# # Copy package files and install dependencies
# COPY bun.lock package.json ./
# RUN bun install --frozen-lockfile

# # Copy the rest of the project and build
# COPY . .
# RUN bun run build

# # Stage 2: Run the application
# FROM oven/bun AS runner

# WORKDIR /app

# # Copy built output and dependencies
# COPY --from=builder /app/build ./build
# COPY --from=builder /app/node_modules ./node_modules
# COPY --from=builder /app/package.json ./package.json

# # Set environment variable for production
# ENV NODE_ENV=production

# # Expose the port (default SvelteKit port is 3000)
# EXPOSE 3000

# # Run the SvelteKit app with Bun
# # CMD ["bun", "run", "preview", "--host"]
# CMD ["node" "build"]

FROM node:23-alpine AS builder
WORKDIR /app

COPY package*.json .
COPY pnpm-lock.yaml .

RUN npm i -g pnpm
RUN pnpm install

COPY . .

RUN pnpm run build
RUN pnpm prune --prod

FROM node:18.8.0-alpine AS deployer

WORKDIR /app

COPY --from=builder /app/build build/
COPY --from=builder /app/package.json .

EXPOSE 3000

ENV NODE_ENV=production

CMD [ "node", "build" ]