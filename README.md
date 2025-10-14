# leelaaApp 🌟

A modern AI-powered social media platform for leelaaverse, where content comes alive through artificial intelligence.

## Features

- 📝 **Create Posts**: Share your thoughts and ideas with the community
- 🤖 **AI Content Generation**: Generate creative content using AI based on prompts
- ❤️ **Social Interactions**: Like and engage with posts
- 🎨 **Beautiful UI**: Modern, responsive design with gradient backgrounds
- ⚡ **Real-time Updates**: Dynamic feed with latest posts

## Tech Stack

### Frontend
- **React** - Modern UI library
- **CSS3** - Custom styling with gradients and animations
- **Fetch API** - For backend communication

### Backend
- **Node.js** - Runtime environment
- **Express** - Web framework
- **CORS** - Cross-origin resource sharing
- **dotenv** - Environment variable management

## Project Structure

```
leelaaApp/
├── frontend/           # React frontend application
│   ├── public/        # Static files
│   ├── src/
│   │   ├── App.js     # Main application component
│   │   ├── App.css    # Styling
│   │   └── index.js   # Entry point
│   └── package.json
├── backend/           # Node.js/Express backend
│   ├── server.js      # Main server file
│   ├── .env.example   # Environment variables template
│   └── package.json
├── .gitignore
├── LICENSE
└── README.md
```

## Getting Started

### Prerequisites
- Node.js (v14 or higher)
- npm or yarn

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/leelaaverse/leelaaApp.git
cd leelaaApp
```

2. **Install Backend Dependencies**
```bash
cd backend
npm install
```

3. **Install Frontend Dependencies**
```bash
cd ../frontend
npm install
```

### Running the Application

1. **Start the Backend Server**
```bash
cd backend
npm start
# Server will run on http://localhost:5000
```

2. **Start the Frontend (in a new terminal)**
```bash
cd frontend
npm start
# App will open on http://localhost:3000
```

### Environment Variables

Create a `.env` file in the backend directory based on `.env.example`:

```env
PORT=5000
# Add your AI API keys here when integrating real AI services
# OPENAI_API_KEY=your_key_here
# ANTHROPIC_API_KEY=your_key_here
```

## Usage

### Creating a Post
1. Enter your name in the "Your name" field
2. Type your message in the text area
3. Click "📝 Post" to share

### Generating AI Content
1. Enter a prompt (e.g., "beautiful landscape", "future of technology")
2. Click "✨ Generate AI Post"
3. AI will create and post content based on your prompt

### Interacting with Posts
- Click the ❤️ button to like a post
- Posts show timestamp and like count
- AI-generated posts are marked with a 🤖 badge

## API Endpoints

### Posts
- `GET /api/posts` - Get all posts
- `POST /api/posts` - Create a new post
- `POST /api/posts/:id/like` - Like a post

### AI Generation
- `POST /api/generate-content` - Generate AI content from a prompt

### Users
- `GET /api/users` - Get all users

## Future Enhancements

- 🔐 User authentication and profiles
- 💬 Comments and replies
- 🖼️ Image upload and sharing
- 🔍 Search and hashtags
- 📊 Analytics dashboard
- 🌐 Real AI API integration (OpenAI, Anthropic, etc.)
- 💾 Database integration (MongoDB, PostgreSQL)
- 🚀 Deployment to cloud platforms

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Built with ❤️ for the leelaaverse community
- Powered by AI and modern web technologies

---

Made with 🌟 by leelaaverse

