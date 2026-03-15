-- Database schema for Barann repository

-- Table for users
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Table for games
CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    release_date DATE,
    added_on TIMESTAMP DEFAULT NOW()
);

-- Table for transactions
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    game_id INT REFERENCES games(game_id),
    transaction_date TIMESTAMP DEFAULT NOW(),
    amount DECIMAL(10, 2) NOT NULL
);

-- Table for admin settings
CREATE TABLE admin_settings (
    setting_id SERIAL PRIMARY KEY,
    setting_name VARCHAR(100) NOT NULL UNIQUE,
    setting_value VARCHAR(255) NOT NULL,
    updated_at TIMESTAMP DEFAULT NOW()
);
