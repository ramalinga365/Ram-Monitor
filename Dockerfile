# Use Node.js LTS
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files first
COPY package*.json ./

# Install dependencies (ignore peer dep conflicts)
RUN npm install --omit=dev --legacy-peer-deps

# Copy the rest of the code
COPY . .

# Declare volume for persistent data
VOLUME ["/app/data"]

# Expose port
EXPOSE 3001

# Default command
CMD ["node", "server/server.js"]
