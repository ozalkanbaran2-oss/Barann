'use strict';

const express = require('express');
const mongoose = require('mongoose');

const app = express();
const PORT = process.env.PORT || 3000;

// Database connection
 mongoose.connect('mongodb://localhost:27017/mydatabase', { useNewUrlParser: true, useUnifiedTopology: true })
 .then(() => console.log('Database connected'))
 .catch(err => console.log(err));

// Middleware
app.use(express.json());

// Routes import
const apiRoutes = require('./routes/api');
app.use('/api', apiRoutes);

// Start server
app.listen(PORT, () => {
 console.log(`Server is running on port ${PORT}`);
});
