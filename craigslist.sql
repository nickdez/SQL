DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist;


CREATE TABLE Users
(
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(30) UNIQUE NOT NULL,
  user_password VARCHAR(30) NOT NULL,
  region VARCHAR(50) NOT NULL
  
);

CREATE TABLE Region (
    region_id SERIAL PRIMARY KEY,
    region_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Posts (
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    user_id INT NOT NULL,
    location VARCHAR(50) NOT NULL,
    region_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (region_id) REFERENCES Region(region_id)
);

CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Post_Categories (
    post_id INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
