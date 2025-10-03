#!/bin/bash

# Setup script for AI/ML Playground
# Creates a virtual environment and installs dependencies

set -e

echo "🔧 Setting up AI/ML Playground environment..."

# Create virtual environment
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
else
    echo "✅ Virtual environment already exists."
fi

# Activate virtual environment
echo "🚀 Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "⬆️ Upgrading pip..."
pip install --upgrade pip

# Determine which requirements to install
echo "Which environment do you want to set up?"
echo "1️⃣ ML/DL only"
echo "2️⃣ GenAI/LLM only"
echo "3️⃣ Full environment (ML + GenAI)"
read -p "Enter choice [1/2/3]: " choice

case $choice in
    1)
        echo "📚 Installing ML/DL dependencies..."
        pip install -r requirements-ml.txt
        ;;
    2)
        echo "📚 Installing GenAI dependencies..."
        pip install -r requirements-genai.txt
        ;;
    3)
        echo "📚 Installing full environment..."
        pip install -r requirements-ml.txt
        pip install -r requirements-genai.txt
        ;;
    *)
        echo "⚠️ Invalid choice. Exiting."
        exit 1
        ;;
esac

echo "🎉 Setup complete!"
echo "👉 To start working, run: source venv/bin/activate"
