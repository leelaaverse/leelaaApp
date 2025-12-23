# Contributing to leelaaApp

Thank you for your interest in contributing to leelaaApp! This document provides guidelines and instructions for contributing.

## Getting Started

1. **Fork the repository**
2. **Clone your fork**
   ```bash
   git clone https://github.com/YOUR_USERNAME/leelaaApp.git
   cd leelaaApp
   ```

3. **Install dependencies**
   ```bash
   npm run install-all
   ```

## Development Workflow

### Running the Application

**Option 1: Using the startup script (Linux/Mac)**
```bash
./start.sh
```

**Option 2: Manual start**
```bash
# Terminal 1 - Backend
cd backend
npm start

# Terminal 2 - Frontend
cd frontend
npm start
```

**Option 3: Using npm scripts from root**
```bash
# In one terminal
npm run start-backend

# In another terminal
npm run start-frontend
```

### Project Structure

- `frontend/` - React application
  - `src/App.js` - Main application component
  - `src/App.css` - Styling
  - `public/` - Static assets

- `backend/` - Node.js/Express API
  - `server.js` - Main server file
  - `.env.example` - Environment variables template

### Making Changes

1. **Create a new branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes**
   - Follow the existing code style
   - Test your changes thoroughly
   - Update documentation if needed

3. **Commit your changes**
   ```bash
   git add .
   git commit -m "Description of your changes"
   ```

4. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

5. **Create a Pull Request**
   - Go to the original repository
   - Click "New Pull Request"
   - Select your branch
   - Describe your changes

## Code Style Guidelines

### JavaScript/React
- Use functional components and hooks
- Use clear, descriptive variable names
- Add comments for complex logic
- Keep components focused and reusable

### CSS
- Follow the existing styling patterns
- Use meaningful class names
- Maintain responsive design

### Backend
- Use async/await for asynchronous operations
- Validate input data
- Handle errors appropriately
- Document API endpoints

## Feature Ideas

Here are some features you could contribute:

- 🔐 User authentication (JWT, OAuth)
- 💬 Comments and replies on posts
- 🖼️ Image upload and display
- 🔍 Search functionality
- #️⃣ Hashtag support
- 📊 User analytics dashboard
- 🌐 Integration with real AI APIs (OpenAI, Anthropic)
- 💾 Database integration (MongoDB, PostgreSQL)
- 🔔 Notifications system
- 👥 User profiles and followers
- 🎨 Theme customization
- 📱 Mobile app (React Native)

## Testing

Currently, the project uses manual testing. Future contributions could include:
- Unit tests (Jest)
- Integration tests
- E2E tests (Cypress, Playwright)

## Questions?

If you have questions or need help, please:
1. Check existing issues
2. Create a new issue with the "question" label
3. Join our community discussions

## License

By contributing to leelaaApp, you agree that your contributions will be licensed under the Apache License 2.0.

---

Thank you for contributing to leelaaApp! 🌟
