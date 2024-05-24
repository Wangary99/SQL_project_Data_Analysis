WITH skills_demand AS (
    SELECT 
        job_skills.skill_id,
        skills.skills AS skills,
        COUNT(job_skills.job_id) AS demand_count
    FROM job_postings_fact AS job_postings
    INNER JOIN skills_job_dim AS job_skills ON
        job_postings.job_id = job_skills.job_id
    INNER JOIN skills_dim AS skills ON 
        job_skills.skill_id = skills.skill_id
    WHERE 
        job_postings.job_title_short = 'Data Analyst' AND 
        job_postings.salary_year_avg IS NOT NULL AND 
        job_postings.job_work_from_home = 'True'
    GROUP BY job_skills.skill_id, skills.skills
), average_salary AS (
    SELECT 
        job_skills.skill_id,
        skills.skills AS skills,
        ROUND(AVG(job_postings.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact AS job_postings
    INNER JOIN skills_job_dim AS job_skills ON
        job_postings.job_id = job_skills.job_id
    INNER JOIN skills_dim AS skills ON 
        job_skills.skill_id = skills.skill_id
    WHERE 
        job_postings.job_title_short = 'Data Analyst' AND
        job_postings.salary_year_avg IS NOT NULL AND 
        job_postings.job_work_from_home = 'True'
    GROUP BY job_skills.skill_id, skills.skills
)
SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand.demand_count,
    average_salary.avg_salary
FROM
    skills_demand
INNER JOIN average_salary ON average_salary.skill_id = skills_demand.skill_id
WHERE demand_count > 10
ORDER BY
    average_salary DESC,
    demand_count DESC
