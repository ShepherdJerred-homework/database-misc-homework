USE homework;

CREATE TABLE addresses    (address_id CHAR(36) PRIMARY KEY, state CHAR(2), city VARCHAR(64), street TEXT, zip INT);

CREATE TABLE coaches      (coach_id CHAR(36)  PRIMARY KEY, coach_name TEXT, address_id CHAR(36), FOREIGN KEY coaches(address_id) REFERENCES addresses(address_id));

CREATE TABLE teams        (team_id CHAR(36) PRIMARY KEY, coach_id CHAR(36), FOREIGN KEY teams(coach_id) REFERENCES coaches(coach_id));

CREATE TABLE players      (player_id CHAR(36) PRIMARY KEY, player_name TEXT, address_id CHAR(36), FOREIGN KEY players(address_id) REFERENCES addresses(address_id));
CREATE TABLE players_team (player_id CHAR(36) PRIMARY KEY, team_id CHAR(36), FOREIGN KEY players_team(player_id) REFERENCES players(player_id), FOREIGN KEY players_team(team_id) REFERENCES teams(team_id));

CREATE TABLE games        (game_id CHAR(36) PRIMARY KEY, address_id CHAR(36), home_score INT, away_score INT, FOREIGN KEY (address_id) REFERENCES addresses(address_id));
CREATE TABLE game_teams   (game_id CHAR(36) PRIMARY KEY, home_team_id CHAR(36), away_team_id CHAR(36), FOREIGN KEY (game_id) REFERENCES games(game_id), FOREIGN KEY (home_team_id) REFERENCES teams(team_id), FOREIGN KEY (away_team_id) REFERENCES teams(team_id));

