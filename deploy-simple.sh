#!/bin/bash

echo "🚀 Simple Marketplace Deployment (No Docker)"

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: package.json not found. Please run this script from the app directory."
    exit 1
fi

# Install Bun if not installed
if ! command -v bun &> /dev/null; then
    echo "📦 Installing Bun..."
    curl -fsSL https://bun.sh/install | bash
    source ~/.bashrc
fi

# Install dependencies
echo "📦 Installing dependencies..."
bun install

# Check if .env exists
if [ ! -f ".env" ]; then
    if [ -f "env.example" ]; then
        echo "📋 Creating .env from template..."
        cp env.example .env
        echo "⚠️  Please edit .env with your configuration"
        echo "   nano .env"
    else
        echo "❌ Error: No .env file and no env.example template found"
        exit 1
    fi
fi

# Build the application
echo "🔨 Building the application..."
bun run build

# Start the application
echo "🚀 Starting the application..."
echo "   The app will be available at http://localhost:3000"
echo "   Press Ctrl+C to stop"
bun run start 