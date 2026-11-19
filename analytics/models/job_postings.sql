
select
	job_id,
	job_title,
	company_name,
	job_location,
	job_via,
	job_posted_at,
	job_salary,
	job_schedule_type,
	job_work_from_home

 FROM '../data/raw/raw_job_postings_*.parquet'
 WHERE error IS NULL