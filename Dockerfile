# Use Node.js LTS
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files first
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the code
COPY . .

# Expose port
EXPOSE 3001

# Default command (same as "node server/server.js")
CMD ["node", "server/server.js"]
