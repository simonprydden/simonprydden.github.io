#!/bin/sh

if [ -d "node_modules" ]; then
  echo "Node modules found. Starting the application..."
else
  echo "Node modules not found. Installing dependencies..."
  npm install
fi

npm run start -- --host 0.0.0.0 --poll 1000