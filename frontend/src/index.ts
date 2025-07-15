// Sample TypeScript application
class App {
    private readonly apiBaseUrl = 'http://localhost:8080';

    async initialize(): Promise<void> {
        console.log('🚀 Frontend application starting...');
        
        // Display welcome message
        this.displayWelcomeMessage();
        
        // Try to connect to backend
        await this.checkBackendConnection();
    }

    private displayWelcomeMessage(): void {
        const container = document.createElement('div');
        container.style.cssText = `
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            text-align: center;
        `;
        
        container.innerHTML = `
            <h1>🎉 Codespace Demo Frontend</h1>
            <p>TypeScript frontend is running successfully!</p>
            <div id="backend-status">Checking backend connection...</div>
            <div style="margin-top: 20px;">
                <button id="test-backend" onclick="app.testBackend()">Test Backend API</button>
            </div>
        `;
        
        document.body.appendChild(container);
    }

    private async checkBackendConnection(): Promise<void> {
        const statusElement = document.getElementById('backend-status');
        if (!statusElement) return;

        try {
            const response = await fetch(`${this.apiBaseUrl}/api/health`);
            if (response.ok) {
                const message = await response.text();
                statusElement.innerHTML = `✅ Backend connected: ${message}`;
                statusElement.style.color = 'green';
            } else {
                throw new Error(`HTTP ${response.status}`);
            }
        } catch (error) {
            statusElement.innerHTML = `❌ Backend not available (${error})`;
            statusElement.style.color = 'red';
        }
    }

    async testBackend(): Promise<void> {
        try {
            const response = await fetch(`${this.apiBaseUrl}/api/hello`);
            const message = await response.text();
            alert(`Backend response: ${message}`);
        } catch (error) {
            alert(`Error connecting to backend: ${error}`);
        }
    }
}

// Initialize the application
const app = new App();
document.addEventListener('DOMContentLoaded', () => {
    app.initialize();
});

// Make app available globally for button onclick
(window as any).app = app;