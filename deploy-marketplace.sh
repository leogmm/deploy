#!/bin/bash

# Marketplace Deployment Script
echo "🚀 Deploying Solman CS Marketplace..."

# Update system
echo "📦 Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install Docker and Docker Compose
echo "🐳 Installing Docker and Docker Compose..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Create project directory
echo "📁 Setting up project directory..."
mkdir -p ~/solman-marketplace
cd ~/solman-marketplace

# Copy project files (you'll need to upload these)
echo "📋 Please upload your marketplace files to this directory"
echo "   Then run: cp env.example .env"
echo "   Edit .env with your configuration"
echo "   Then run: docker-compose up -d"

echo "✅ Marketplace deployment script completed!"
echo "📝 Next steps:"
echo "   1. Upload your marketplace code to ~/solman-marketplace"
echo "   2. Copy env.example to .env and configure it"
echo "   3. Run: docker-compose up -d"
echo "   4. Access your marketplace at http://your-server-ip:3000" 