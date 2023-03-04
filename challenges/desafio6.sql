SELECT
    MIN(pl.price_plan) AS faturamento_minimo,
    MAX(pl.price_plan) AS faturamento_maximo,
    ROUND(AVG(pl.price_plan), 2) AS faturamento_medio,
    ROUND(SUM(pl.price_plan), 2) AS faturamento_total
  FROM plans pl
  INNER JOIN users usr ON pl.id_plan = usr.id_plan
