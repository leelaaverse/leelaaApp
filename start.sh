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
cd backend || { echo "Error: backend directory not found"; exit 1; }
npm start &
BACKEND_PID=$!
cd ..

# Wait for backend to be ready with health check
echo "⏳ Waiting for backend to be ready..."
for i in {1..30}; do
    if curl -s http://localhost:5000 > /dev/null 2>&1; then
        echo "✅ Backend is ready!"
        break
    fi
    if [ $i -eq 30 ]; then
        echo "❌ Backend failed to start after 30 seconds"
        kill $BACKEND_PID 2>/dev/null
        exit 1
    fi
    sleep 1
done

# Start frontend
echo "🎨 Starting frontend on port 3000..."
cd frontend || { echo "Error: frontend directory not found"; kill $BACKEND_PID 2>/dev/null; exit 1; }
npm start

# Cleanup on exit
trap "kill $BACKEND_PID 2>/dev/null" EXIT
