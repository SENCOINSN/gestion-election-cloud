CREATE DATABASE IF NOT EXISTS election_db;

USE election_db;

CREATE TABLE IF NOT EXISTS candidates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    party VARCHAR(255) NOT NULL,
    votes INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS voters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    has_voted BOOLEAN DEFAULT FALSE
);

INSERT INTO candidates (name, party) VALUES ('Alice Smith', 'Party A');
INSERT INTO candidates (name, party) VALUES ('Bob Johnson', 'Party B');