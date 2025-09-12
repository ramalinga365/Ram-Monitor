# ---------- Build Stage ----------
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies (ignore peer dep conflicts)
RUN npm install --legacy-peer-deps

# Copy the rest of the source code
COPY . .

# Build (Ram Monitor has frontend build step)
RUN npm run build

# ---------- Runtime Stage ----------
FROM node:18-alpine AS runtime

# Set working directory
WORKDIR /app

# Copy only what we need from build stage
COPY --from=build /app . 

# Declare volume for persistent data
VOLUME ["/app/data"]

# Expose port
EXPOSE 3001

# Default command
CMD ["node", "server/server.js"]

