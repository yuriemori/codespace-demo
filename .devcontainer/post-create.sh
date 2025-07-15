#!/bin/bash

echo "🚀 Setting up Java + TypeScript development environment..."

# Install global TypeScript and common tools
echo "📦 Installing global TypeScript and development tools..."
npm install -g typescript @typescript-eslint/eslint-plugin @typescript-eslint/parser
npm install -g prettier eslint
npm install -g @types/node

# Install backend dependencies if pom.xml exists
if [ -f "backend/pom.xml" ]; then
    echo "☕ Installing Java/Maven backend dependencies..."
    cd backend
    mvn dependency:resolve
    cd ..
elif [ -f "pom.xml" ]; then
    echo "☕ Installing Java/Maven dependencies..."
    mvn dependency:resolve
fi

# Install frontend dependencies if package.json exists
if [ -f "frontend/package.json" ]; then
    echo "🎨 Installing TypeScript/Node.js frontend dependencies..."
    cd frontend
    npm install
    cd ..
elif [ -f "package.json" ]; then
    echo "🎨 Installing TypeScript/Node.js dependencies..."
    npm install
fi

# Create default ESLint config if none exists
if [ ! -f ".eslintrc.js" ] && [ ! -f ".eslintrc.json" ] && [ ! -f "frontend/.eslintrc.js" ] && [ ! -f "frontend/.eslintrc.json" ]; then
    echo "🔧 Creating default ESLint configuration..."
    cat > .eslintrc.json << 'EOF'
{
  "env": {
    "browser": true,
    "es2021": true,
    "node": true
  },
  "extends": [
    "eslint:recommended",
    "@typescript-eslint/recommended"
  ],
  "parser": "@typescript-eslint/parser",
  "parserOptions": {
    "ecmaVersion": 12,
    "sourceType": "module"
  },
  "plugins": [
    "@typescript-eslint"
  ],
  "rules": {}
}
EOF
fi

# Create default Prettier config if none exists
if [ ! -f ".prettierrc" ] && [ ! -f ".prettierrc.json" ] && [ ! -f "frontend/.prettierrc" ] && [ ! -f "frontend/.prettierrc.json" ]; then
    echo "💅 Creating default Prettier configuration..."
    cat > .prettierrc.json << 'EOF'
{
  "semi": true,
  "trailingComma": "es5",
  "singleQuote": true,
  "printWidth": 80,
  "tabWidth": 2
}
EOF
fi

# Verify installations
echo "✅ Verifying installations..."
echo "Java version:"
java -version
echo ""
echo "Maven version:"
mvn -version
echo ""
echo "Node.js version:"
node -v
echo ""
echo "npm version:"
npm -v
echo ""
echo "TypeScript version:"
tsc -v
echo ""

echo "🎉 Development environment setup complete!"
echo ""
echo "📂 Directory structure:"
echo "  - For Java projects: Create backend/ directory with pom.xml"
echo "  - For TypeScript projects: Create frontend/ directory with package.json"
echo "  - Or place pom.xml and package.json in the root directory"
echo ""
echo "🛠️  Available tools:"
echo "  - Java 21 with Maven"
echo "  - Node.js LTS with npm"
echo "  - TypeScript compiler"
echo "  - ESLint and Prettier for code quality"
echo "  - VS Code extensions for Java and TypeScript development"