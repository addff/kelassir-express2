const express = require('express');
const path = require('path');
const app = express();
const PORT = 3000;

// Serve static files (optional, for CSS/images later)
app.use(express.static(path.join(__dirname, 'public')));

// Route for homepage
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'views', 'index.html'));
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
