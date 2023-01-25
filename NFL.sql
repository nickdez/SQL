DROP DATABASE IF EXISTS NFL_QBS_STATS;
CREATE DATABASE NFL_QBS_STATS;
\c NFL_QBS_STATS;

CREATE TABLE Teams
(
team_name VARCHAR(50) PRIMARY KEY,
location_state VARCHAR(50) NOT NULL,
location_city VARCHAR(50) NOT NULL
);

CREATE TABLE Players
(
player_name VARCHAR(100) NOT NULL UNIQUE PRIMARY KEY,
player_number INT NOT NULL,
team_name VARCHAR(50) NOT NULL,
td_count INT,
interception_count INT,
yard_throw INT,
FOREIGN KEY (team_name) REFERENCES Teams(team_name)
);

CREATE TABLE Game
(
game_id SERIAL PRIMARY KEY,
game_date DATE NOT NULL,
home_team_name VARCHAR(50) NOT NULL,
away_team_name VARCHAR(50) NOT NULL,
location_state VARCHAR(50) NOT NULL,
location_city VARCHAR(50) NOT NULL,
FOREIGN KEY (home_team_name) REFERENCES Teams(team_name),
FOREIGN KEY (away_team_name) REFERENCES Teams(team_name),
FOREIGN KEY (location_state) REFERENCES Teams(location_state),
FOREIGN KEY (location_city) REFERENCES Teams(location_city)
);

CREATE TABLE Referees
(
Ref_name VARCHAR(200) NOT NULL UNIQUE PRIMARY KEY,
game_id SERIAL,
FOREIGN KEY (game_id) REFERENCES Game(game_id)
);

CREATE TABLE SCORES (
    score_id SERIAL PRIMARY KEY,
    game_id INT,
    player_id INT,
    FOREIGN KEY (game_id) REFERENCES Game(game_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);
