# 2024 NFL Fantasy Football Analysis

Analysis of 2024 NFL fantasy football performance using Pro Football Reference 
data loaded into Google BigQuery.

## Business Questions
1. Which players were the top fantasy scorers at each position in 2024?
2. Which NFL teams produced the most total fantasy points?
3. Which positions score the most PPR points on average?

## Key Findings
- Saquon Barkley led all RBs, Ja'Marr Chase led all WRs in fantasy scoring
- Detroit Lions produced the most team fantasy points — reflecting a 
  high-volume offense that distributed targets across multiple skill positions
- QBs average the most fantasy points per player, but positional scarcity 
  at RB and WR makes early-round investment at those positions more valuable 
  in PPR and dynasty formats

## Dynasty Relevance
In dynasty leagues, identifying which teams consistently produce fantasy-relevant 
players matters more than single-season output. High-volume offenses like Detroit 
create multiple startable assets — making their entire skill position group 
valuable roster targets.

## Tools
- Google BigQuery (SQL)
- Tableau Public
- Pro Football Reference (data source)

## Visualizations
https://public.tableau.com/authoring/2024NFLFantasyFootballAnalysis/Dashboard1


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

## SQL Skills Demonstrated
- Window functions (DENSE_RANK with PARTITION BY)
- Aggregations (SUM, AVG)
- Multi-CTE queries
- Positional filtering and ranking
