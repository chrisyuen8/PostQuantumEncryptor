#!/bin/bash

# Define project name
PROJECT_NAME="PostQuantumEncryptor"
GITHUB_URL="https://github.com/chrisyuen8/PostQuantumEncryptor.git"

# Create project folder
#mkdir -p ~/$PROJECT_NAME
#cd ~/$PROJECT_NAME

# Initialize Git
git init

# Create core folders
mkdir -p src bin docs tests

# Create key project files
touch README.md
touch .gitignore
echo "venv/" > .gitignore
echo "__pycache__/" >> .gitignore

# Create main Python script
cat <<EOL > src/main.py
import sys

def main():
    print("Welcome to Post-Quantum Encryptor!")

if __name__ == "__main__":
    main()
EOL

# Create a requirements file
echo "pqcrypto" > requirements.txt

# Setup a virtual environment
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

# Git setup and first commit
git add .
git commit -m "Initial project structure setup"
git branch -M main
git remote add origin $GITHUB_URL
git push -u origin main

echo "✅ Project $PROJECT_NAME setup complete!"
echo "📂 Folder structure created in: ~/$PROJECT_NAME"

