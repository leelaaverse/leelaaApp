const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());

// In-memory storage for demo (replace with database in production)
let posts = [
  {
    id: 1,
    author: "AI Assistant",
    content: "Welcome to leelaaApp! This is an AI-powered social media platform where content comes alive through artificial intelligence.",
    aiGenerated: true,
    likes: 42,
    timestamp: new Date().toISOString()
  },
  {
    id: 2,
    author: "Creative AI",
    content: "Just generated a beautiful sunset scene: The golden rays paint the sky in hues of orange and purple, while clouds drift lazily across the horizon.",
    aiGenerated: true,
    likes: 28,
    timestamp: new Date().toISOString()
  }
];

let users = [
  { id: 1, username: "AI Assistant", avatar: "🤖" },
  { id: 2, username: "Creative AI", avatar: "🎨" }
];

// Routes
app.get('/', (req, res) => {
  res.json({ message: 'Welcome to leelaaApp API - AI-powered social media' });
});

// Get all posts
app.get('/api/posts', (req, res) => {
  res.json(posts.sort((a, b) => new Date(b.timestamp) - new Date(a.timestamp)));
});

// Create a new post
app.post('/api/posts', (req, res) => {
  const { author, content, aiGenerated } = req.body;
  
  if (!author || !content) {
    return res.status(400).json({ error: 'Author and content are required' });
  }

  const newPost = {
    id: posts.length + 1,
    author,
    content,
    aiGenerated: aiGenerated || false,
    likes: 0,
    timestamp: new Date().toISOString()
  };

  posts.push(newPost);
  res.status(201).json(newPost);
});

// Generate AI content
app.post('/api/generate-content', (req, res) => {
  const { prompt } = req.body;
  
  if (!prompt) {
    return res.status(400).json({ error: 'Prompt is required' });
  }

  // Simulated AI content generation (replace with actual AI API in production)
  const aiResponses = [
    `Based on "${prompt}": Imagine a world where technology and nature coexist in perfect harmony. ${prompt} becomes a reality through innovation and creativity.`,
    `Exploring "${prompt}": In the digital age, we discover new ways to ${prompt}. The future is bright and full of possibilities.`,
    `"${prompt}" inspires us to think differently. Through AI and human collaboration, we create something truly unique and meaningful.`,
    `Reflecting on "${prompt}": Every idea has the power to change the world. Let's make ${prompt} happen together.`
  ];

  const generatedContent = aiResponses[Math.floor(Math.random() * aiResponses.length)];

  const aiPost = {
    id: posts.length + 1,
    author: "AI Generator",
    content: generatedContent,
    aiGenerated: true,
    likes: 0,
    timestamp: new Date().toISOString()
  };

  posts.push(aiPost);
  res.status(201).json(aiPost);
});

// Like a post
app.post('/api/posts/:id/like', (req, res) => {
  const postId = parseInt(req.params.id);
  const post = posts.find(p => p.id === postId);

  if (!post) {
    return res.status(404).json({ error: 'Post not found' });
  }

  post.likes += 1;
  res.json(post);
});

// Get users
app.get('/api/users', (req, res) => {
  res.json(users);
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
