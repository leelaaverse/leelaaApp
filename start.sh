#!/bin/bash

# leelaaApp Startup Script
echo "🌟 Starting leelaaApp - AI-Powered Social Media Platform"
echo ""

# Check if dependencies are installed
if [ ! -d "backend/node_modules" ] || [ ! -d "frontend/node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm run install-all
    echo ""
fi

# Start backend in background
echo "🚀 Starting backend server on port 5000..."
cd backend && npm start &
BACKEND_PID=$!

# Wait for backend to be ready
sleep 3

# Start frontend
echo "🎨 Starting frontend on port 3000..."
cd ../frontend && npm start

# Cleanup on exit
trap "kill $BACKEND_PID 2>/dev/null" EXIT
