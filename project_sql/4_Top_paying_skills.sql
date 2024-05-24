SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact AS job_postings
INNER JOIN skills_job_dim AS job_skills ON
job_postings.job_id = job_skills.job_id
INNER JOIN skills_dim AS skills ON 
job_skills.skill_id = skills.skill_id
where 
	job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
   AND job_work_from_home = 'True'
GROUP BY skills
ORDER BY 
	avg_salary DESC
LIMIT 25


/*
Top 25 Paying Skills for Data Analysts

[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]

Analysis of Top Paying Skills for Data Analysts:

1. Data Processing and Analysis Tools Dominate: The highest paying skills include tools and frameworks for data processing and analysis, such as PySpark, Jupyter, Pandas, and Databricks. This underscores the value of expertise in handling large-scale data analytics and processing.

2. Version Control and Collaboration Tools: Skills in version control systems like Bitbucket and GitLab command high salaries. This trend highlights the importance of collaboration and version control in modern data analysis and software development workflows.

3. Emerging and Specialized Technologies: Skills in relatively newer or specialized technologies, such as Couchbase (a NoSQL database), Watson (IBM’s AI platform), and DataRobot (an automated machine learning tool), are highly valued. This indicates a premium on cutting-edge technology and specialized tools.

4. Programming Languages and Cloud Platforms: Proficiency in programming languages (Swift, Golang, Scala) and cloud platforms (GCP) are among the top-paying skills. This shows the growing demand for versatile programming capabilities and cloud computing expertise in the field of data analysis.
*/
