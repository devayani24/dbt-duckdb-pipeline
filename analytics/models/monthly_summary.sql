-- What share of postings are remote

WITH totals AS (
  SELECT
    month,
    sum(postings) as total_postings
  FROM {{ ref('job_per_month') }}
  GROUP BY month
),
remote AS (
  SELECT
    DATETRUNC('month',search_date) as month,
    count(job_id) as remote_postings
  FROM {{ ref('job_postings') }}
  WHERE job_work_from_home = True
  GROUP BY month
  ORDER BY month
)

SELECT 
  t.month,
  t.total_postings,
  r.remote_postings,
  ROUND((100.0 * r.remote_postings/t.total_postings),1) AS pct_remote
FROM totals t
JOIN remote r ON r.month = t.month
ORDER BY t.month