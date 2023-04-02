--All the Manchester United games from 1993-2022
SELECT *
FROM eplmatches
WHERE (home = 'Manchester Utd') OR (away = 'Manchester Utd')
ORDER BY season_year ASC, week ASC

--All the games won by Manchester United from 1993-2022
SELECT *
FROM eplmatches
WHERE (home = 'Manchester Utd' AND ftr = 'H') OR (away = 'Manchester Utd' AND ftr = 'A')
ORDER BY season_year ASC, week ASC

--All the games lost by Manchester United from 1993-2022
SELECT *
FROM eplmatches
WHERE (home = 'Manchester Utd' AND ftr = 'A') OR (away = 'Manchester Utd' AND ftr = 'H')
ORDER BY season_year ASC, week ASC

--Number of Manchester United wins against each team from 1993-2022
SELECT team, COUNT (*) as win_appearance
FROM (
	SELECT *,
		CASE
			WHEN home = 'Manchester Utd' THEN away
			WHEN away = 'Manchester Utd' THEN home
		END AS team
	FROM eplmatches
	WHERE (home = 'Manchester Utd' AND ftr = 'H') OR (away = 'Manchester Utd' AND ftr = 'A')
)subquery
GROUP BY team
ORDER BY team ASC

--Number of wins against Manchester United by each team from 1993-2022
SELECT team, COUNT (*) as win_appearance
FROM (
	SELECT *,
		CASE
			WHEN home = 'Manchester Utd' THEN away
			WHEN away = 'Manchester Utd' THEN home
		END AS team
	FROM eplmatches
	WHERE (home = 'Manchester Utd' AND ftr = 'A') OR (away = 'Manchester Utd' AND ftr = 'H')
)subquery
GROUP BY team
ORDER BY team ASC

--Number of Manchester United wins each season from 1993-2022
SELECT season_year, COUNT(*) as num_wins
FROM(
	SELECT *,
	CASE
		WHEN home = 'Manchester Utd' THEN home
		WHEN away = 'Manchester Utd' THEN away
	END AS wins
	FROM eplmatches
	WHERE (home = 'Manchester Utd' AND ftr = 'H') OR (away = 'Manchester Utd' AND ftr = 'A')
)subquery
GROUP BY season_year
ORDER BY season_year ASC

--Number of Manchester United draws each season from 1993-2022
SELECT season_year, COUNT(*) as num_wins
FROM(
	SELECT *,
	CASE
		WHEN home = 'Manchester Utd' THEN home
		WHEN away = 'Manchester Utd' THEN away
	END AS wins
	FROM eplmatches
	WHERE (home = 'Manchester Utd' AND ftr = 'D') OR (away = 'Manchester Utd' AND ftr = 'D')
)subquery
GROUP BY season_year
ORDER BY season_year ASC

--Number of Manchester United losses each season from 1993-2022
SELECT season_year, COUNT(*) as num_wins
FROM(
	SELECT *,
	CASE
		WHEN home = 'Manchester Utd' THEN home
		WHEN away = 'Manchester Utd' THEN away
	END AS wins
	FROM eplmatches
	WHERE (home = 'Manchester Utd' AND ftr = 'A') OR (away = 'Manchester Utd' AND ftr = 'H')
)subquery
GROUP BY season_year
ORDER BY season_year ASC
	
	










