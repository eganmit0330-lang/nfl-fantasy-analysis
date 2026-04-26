-- Query 1: Top Fantasy Scorers by Position
WITH helper AS (
  SELECT 
    Player,
    FantPT,
    FantPos
  FROM `claude-data-489019.2024_fantasy_football.fantasy_stats_2024`
),
ranked AS (
  SELECT
    DENSE_RANK() OVER (PARTITION BY FantPos ORDER BY FantPT DESC) AS positional_rank,
    Player,
    FantPT,
    FantPos
  FROM helper
)
SELECT 
  Player,
  FantPT,
  FantPos,
  positional_rank
FROM ranked
WHERE positional_rank <= 25
ORDER BY FantPos, positional_rank ASC;

-- Query 2: Team Fantasy Points Total
SELECT
  Tm,
  SUM(FantPT) AS team_pts
FROM `claude-data-489019.2024_fantasy_football.fantasy_stats_2024`
GROUP BY Tm
ORDER BY team_pts DESC;

-- Query 3: Average Fantasy Points by Position
SELECT
  FantPos,
  AVG(FantPT) AS average_pts_by_position
FROM `claude-data-489019.2024_fantasy_football.fantasy_stats_2024`
GROUP BY FantPos
ORDER BY average_pts_by_position DESC;
