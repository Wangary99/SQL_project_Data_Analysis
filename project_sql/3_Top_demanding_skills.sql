SELECT 
    skills,
    COUNT(job_skills.job_id) AS demand_count
FROM job_postings_fact AS job_postings
INNER JOIN skills_job_dim AS job_skills ON
job_postings.job_id = job_skills.job_id
INNER JOIN skills_dim AS skills ON 
job_skills.skill_id = skills.skill_id
where 
	job_title_short = 'Data Analyst' AND 
	job_work_from_home = 'True'
GROUP BY skills
ORDER BY 
	demand_count DESC
LIMIT 5