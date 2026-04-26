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

## SQL Skills Demonstrated
- Window functions (DENSE_RANK with PARTITION BY)
- Aggregations (SUM, AVG)
- Multi-CTE queries
- Positional filtering and ranking
