import React, { useState, useEffect } from 'react';
import './App.css';

const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:5000';

function App() {
  const [posts, setPosts] = useState([]);
  const [author, setAuthor] = useState('');
  const [content, setContent] = useState('');
  const [aiPrompt, setAiPrompt] = useState('');
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  // Fetch posts on component mount
  useEffect(() => {
    fetchPosts();
  }, []);

  const fetchPosts = async () => {
    try {
      const response = await fetch(`${API_URL}/api/posts`);
      const data = await response.json();
      setPosts(data);
      setLoading(false);
    } catch (err) {
      setError('Failed to fetch posts. Make sure the backend is running.');
      setLoading(false);
    }
  };

  const handleCreatePost = async (e) => {
    e.preventDefault();
    
    if (!author || !content) {
      setError('Please fill in all fields');
      return;
    }

    try {
      const response = await fetch(`${API_URL}/api/posts`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ author, content, aiGenerated: false })
      });

      if (response.ok) {
        setAuthor('');
        setContent('');
        setError('');
        fetchPosts();
      }
    } catch (err) {
      setError('Failed to create post');
    }
  };

  const handleGenerateAI = async (e) => {
    e.preventDefault();

    if (!aiPrompt) {
      setError('Please enter a prompt for AI generation');
      return;
    }

    try {
      const response = await fetch(`${API_URL}/api/generate-content`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ prompt: aiPrompt })
      });

      if (response.ok) {
        setAiPrompt('');
        setError('');
        fetchPosts();
      }
    } catch (err) {
      setError('Failed to generate AI content');
    }
  };

  const handleLike = async (postId) => {
    try {
      await fetch(`${API_URL}/api/posts/${postId}/like`, {
        method: 'POST'
      });
      fetchPosts();
    } catch (err) {
      setError('Failed to like post');
    }
  };

  const formatTime = (timestamp) => {
    const date = new Date(timestamp);
    const now = new Date();
    const diff = Math.floor((now - date) / 1000);

    if (diff < 60) return 'Just now';
    if (diff < 3600) return `${Math.floor(diff / 60)}m ago`;
    if (diff < 86400) return `${Math.floor(diff / 3600)}h ago`;
    return `${Math.floor(diff / 86400)}d ago`;
  };

  return (
    <div className="App">
      <header className="header">
        <h1>🌟 leelaaApp</h1>
        <p>AI-Powered Social Media Platform</p>
        <div className="ai-badge">✨ Experience the Future of Content</div>
      </header>

      {error && <div className="error">{error}</div>}

      <div className="create-post">
        <h2>Create Post</h2>
        <form onSubmit={handleCreatePost}>
          <div className="input-group">
            <input
              type="text"
              placeholder="Your name"
              value={author}
              onChange={(e) => setAuthor(e.target.value)}
            />
          </div>
          <div className="input-group">
            <textarea
              placeholder="What's on your mind?"
              value={content}
              onChange={(e) => setContent(e.target.value)}
            />
          </div>
          <div className="button-group">
            <button type="submit" className="btn-primary">
              📝 Post
            </button>
          </div>
        </form>
      </div>

      <div className="create-post">
        <h2>🤖 Generate AI Content</h2>
        <form onSubmit={handleGenerateAI}>
          <div className="input-group">
            <input
              type="text"
              placeholder="Enter a prompt for AI generation (e.g., 'beautiful landscape')"
              value={aiPrompt}
              onChange={(e) => setAiPrompt(e.target.value)}
            />
          </div>
          <div className="button-group">
            <button type="submit" className="btn-ai">
              ✨ Generate AI Post
            </button>
          </div>
        </form>
      </div>

      <div className="feed">
        <h2>📱 Feed</h2>
        {loading ? (
          <div className="loading">Loading posts...</div>
        ) : (
          posts.map((post) => (
            <div key={post.id} className="post">
              <div className="post-header">
                <span className="post-author">{post.author}</span>
                {post.aiGenerated && <span className="ai-tag">🤖 AI Generated</span>}
              </div>
              <div className="post-content">{post.content}</div>
              <div className="post-footer">
                <span className="post-time">{formatTime(post.timestamp)}</span>
                <button
                  className="like-button"
                  onClick={() => handleLike(post.id)}
                >
                  ❤️ {post.likes} {post.likes === 1 ? 'Like' : 'Likes'}
                </button>
              </div>
            </div>
          ))
        )}
      </div>
    </div>
  );
}

export default App;
