FROM node:lts-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Install Git (required to clone the repository)
RUN apk add --no-cache git

# Clone the GitHub repository
RUN git clone https://github.com/Abdullah1053/t3-example.git .

# Set environment variables
ENV NODE_ENV=production
ENV DATABASE_URL="postgres://postgres:BtG9uJVtfPtcF74@localhost:5432/postgres"

# Install dependencies
RUN npm install --production --silent

# Expose the port Prisma Studio uses
EXPOSE 5555

# Change ownership of the app directory to the 'node' user
RUN chown -R node /usr/src/app

# Switch to the non-root 'node' user
USER node

# Start Prisma Studio
CMD ["npx", "prisma", "studio"]

