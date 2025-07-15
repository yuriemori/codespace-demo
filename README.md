# Codespace Demo - Java + TypeScript

Development environment demo using GitHub Codespaces with Java (Maven) and TypeScript support.

## 🚀 Quick Start

### Using GitHub Codespaces
1. Click "Code" button on GitHub
2. Select "Codespaces" tab
3. Click "Create codespace on main"
4. Wait for the environment to set up automatically

### Using VS Code Dev Containers
1. Install the Dev Containers extension
2. Open this repository in VS Code
3. Click "Reopen in Container" when prompted
4. Wait for the environment to set up

## 🛠️ Development Environment

This devcontainer includes:

### Backend (Java)
- **Java 21** (LTS version)
- **Maven** for dependency management
- **Spring Boot** sample application
- VS Code Java extensions (Java Pack)

### Frontend (TypeScript)
- **Node.js** (LTS version)
- **TypeScript** compiler
- **Vite** for development server
- **ESLint** and **Prettier** for code quality
- VS Code TypeScript extensions

### VS Code Extensions
- Java Pack (RedHat Java, Java Test Runner, etc.)
- TypeScript and JavaScript support
- ESLint and Prettier
- GitLens
- Live Share

## 📁 Project Structure

```
├── .devcontainer/
│   ├── devcontainer.json      # Dev container configuration
│   └── post-create.sh         # Setup script
├── backend/                   # Java Spring Boot application
│   ├── src/main/java/
│   └── pom.xml
├── frontend/                  # TypeScript application
│   ├── src/
│   ├── package.json
│   └── vite.config.ts
└── README.md
```

## 🏃‍♂️ Running the Applications

### Backend (Java/Spring Boot)
```bash
cd backend
mvn spring-boot:run
```
The API will be available at `http://localhost:8080`

### Frontend (TypeScript/Vite)
```bash
cd frontend
npm run dev
```
The frontend will be available at `http://localhost:3000`

## 🔧 Development Commands

### Backend
```bash
# Install dependencies
mvn dependency:resolve

# Compile
mvn compile

# Run tests
mvn test

# Package
mvn package
```

### Frontend
```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build

# Lint code
npm run lint

# Format code
npm run format
```

## 🌐 Port Forwarding

The devcontainer automatically forwards these ports:
- `3000` - Frontend development server (Vite)
- `8080` - Backend API server (Spring Boot)
- `8081` - Alternative backend port
- `5173` - Alternative Vite port

## 📝 API Endpoints

The sample backend provides:
- `GET /api/hello` - Returns a greeting message
- `GET /api/health` - Health check endpoint

## 🔗 Integration

The frontend includes sample code to connect to the backend API. When both services are running, the frontend will automatically check the backend connection and provide a test button.

## 🎯 Next Steps

1. Replace the sample Java application with your actual backend code
2. Replace the sample TypeScript application with your actual frontend code
3. Update dependencies in `pom.xml` and `package.json` as needed
4. Customize the devcontainer configuration if additional tools are required

## 📚 Learn More

- [Dev Containers Documentation](https://containers.dev/)
- [GitHub Codespaces Documentation](https://docs.github.com/en/codespaces)
- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [TypeScript Documentation](https://www.typescriptlang.org/)
