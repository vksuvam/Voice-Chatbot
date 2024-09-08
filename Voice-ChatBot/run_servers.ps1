# Navigate to the API directory
cd api

# Kill any process using port 8000
npx kill-port 8000

# Run the Python server in the background
Start-Process python3 "app.py"

# Navigate back to the root directory
cd ..

# Navigate to the React app directory
cd chatBotVoice

# Kill any process using port 5173
npx kill-port 5173

# Run the React development server
npm run dev

# Navigate back to the root directory
cd ..
