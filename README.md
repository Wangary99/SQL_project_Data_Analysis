# Introduction
Dive into the data job market. Focusing on data analyst role, this project expolores top paying jobs, in demand skills, and where high demand meets high salary in data analytics.
SQL queries? Check them out here: [project_sql folder](/project_sql/)

# Background
The questions I wanted to answer through the SQL queries were;
1. What are the top paying data analyst jobs?
2. What skills are required for these top paying jobs?
3. What skills are most in demand for data analytics?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I used
For my deep dive into the data analyst job market, I used the following tools for my analysis;
1. **SQL** - It was the backbone of my analysis. It allowed me to query the database and discover critical insights.
2. **postegreSQL** - The chosen database management system, ideal for handling the job posting data.
3. **Visual Studio Code** - My go-to IDE for database management and executing SQL queries.
4. **Git & Github** - Essential for version control and sharing my SQL scripts and analysis ensuring collaboration and project tracking.

# The analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. 
Here's how I approached each question:
### 1.  Top Paying Data Analyst Jobs
To identify the highest paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql
SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact AS job_postings
LEFT JOIN company_dim AS company ON
company.company_id = job_postings.company_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10
```
## Job Listings Summary

| Job ID  | Job Title                             | Job Location | Job Schedule Type | Avg Salary | Job Posted Date       | Company Name                            |
|---------|---------------------------------------|--------------|-------------------|------------|-----------------------|-----------------------------------------|
| 226942  | Data Analyst                          | Anywhere     | Full-time         | 650000.0   | 2023-02-20 15:13:33   | Mantys                                  |
| 547382  | Director of Analytics                 | Anywhere     | Full-time         | 336500.0   | 2023-08-23 12:04:42   | Meta                                    |
| 552322  | Associate Director- Data Insights     | Anywhere     | Full-time         | 255829.5   | 2023-06-18 16:03:12   | AT&T                                    |
| 99305   | Data Analyst, Marketing               | Anywhere     | Full-time         | 232423.0   | 2023-12-05 20:00:40   | Pinterest Job Advertisements            |
| 1021647 | Data Analyst (Hybrid/Remote)          | Anywhere     | Full-time         | 217000.0   | 2023-01-17 00:17:23   | Uclahealthcareers                       |
| 168310  | Principal Data Analyst (Remote)       | Anywhere     | Full-time         | 205000.0   | 2023-08-09 11:00:01   | SmartAsset                              |
| 731368  | Director, Data Analyst - HYBRID       | Anywhere     | Full-time         | 189309.0   | 2023-12-07 15:00:13   | Inclusively                             |
| 310660  | Principal Data Analyst, AV Performance Analysis | Anywhere     | Full-time         | 189000.0   | 2023-01-05 00:00:25   | Motional                                |
| 1749593 | Principal Data Analyst                | Anywhere     | Full-time         | 186000.0   | 2023-07-11 16:00:05   | SmartAsset                              |
| 387860  | ERM Data Analyst                      | Anywhere     | Full-time         | 184000.0   | 2023-06-09 08:01:04   | Get It Recruit - Information Technology |


Key Insights from the Top Paying Data Analyst Positions
1. Top Salary: The highest paying data analyst position offers an annual salary of $650,000 at Mantys.
2. High-Level Roles: Significant salaries are observed for high-level roles such as "Director of Analytics" at Meta ($336,500) and "Associate Director- Data Insights" at AT&T ($255,829.50).
3. Specialized Positions: Specialized roles like "Principal Data Analyst" and "Data Analyst, Marketing" command salaries above $200,000.
4. Remote Work Trend: All positions are full-time and remote or hybrid, reflecting the trend towards flexible working arrangements.

### 2. Top Paying Data Analyst Job Skills
To uncover the most lucrative skills for data analysts, I analyzed the average yearly salaries associated with various skills. This query identifies which specific competencies are most rewarded in the data analyst field.

```sql
WITH top_paying_jobs AS (
    SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact AS job_postings
LEFT JOIN company_dim AS company ON
company.company_id = job_postings.company_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10

)

SELECT 
    top_paying_jobs.*,
    skills 
FROM top_paying_jobs
INNER JOIN skills_job_dim AS job_skills ON
top_paying_jobs.job_id = job_skills.job_id
INNER JOIN skills_dim AS skills ON 
job_skills.skill_id = skills.skill_id
ORDER BY salary_year_avg DESC
```
## Job Listings

| Job ID | Job Title                             | Job Location | Job Schedule Type | Avg Salary | Job Posted Date       | Company Name                              | Skills      |
|--------|---------------------------------------|--------------|-------------------|------------|-----------------------|-------------------------------------------|-------------|
| 552322 | Associate Director- Data Insights     | Anywhere     | Full-time         | 255829.5   | 2023-06-18 16:03:12   | AT&T                                      | sql         |
| 552322 | Associate Director- Data Insights     | Anywhere     | Full-time         | 255829.5   | 2023-06-18 16:03:12   | AT&T                                      | python      |
| 552322 | Associate Director- Data Insights     | Anywhere     | Full-time         | 255829.5   | 2023-06-18 16:03:12   | AT&T                                      | r           |
| 552322 | Associate Director- Data Insights     | Anywhere     | Full-time         | 255829.5   | 2023-06-18 16:03:12   | AT&T                                      | azure       |
| 552322 | Associate Director- Data Insights     | Anywhere     | Full-time         | 255829.5   | 2023-06-18 16:03:12   | AT&T                                      | databricks  |
| 552322 | Associate Director- Data Insights     | Anywhere     | Full-time         | 255829.5   | 2023-06-18 16:03:12   | AT&T                                      | aws         |
| 552322 | Associate Director- Data Insights     | Anywhere     | Full-time         | 255829.5   | 2023-06-18 16:03:12   | AT&T                                      | pandas      |
| 552322 | Associate Director- Data Insights     | Anywhere     | Full-time         | 255829.5   | 2023-06-18 16:03:12   | AT&T                                      | pyspark     |
| 552322 | Associate Director- Data Insights     | Anywhere     | Full-time         | 255829.5   | 2023-06-18 16:03:12   | AT&T                                      | jupyter     |
| 552322 | Associate Director- Data Insights     | Anywhere     | Full-time         | 255829.5   | 2023-06-18 16:03:12   | AT&T                                      | excel       |
| 552322 | Associate Director- Data Insights     | Anywhere     | Full-time         | 255829.5   | 2023-06-18 16:03:12   | AT&T                                      | tableau     |
| 552322 | Associate Director- Data Insights     | Anywhere     | Full-time         | 255829.5   | 2023-06-18 16:03:12   | AT&T                                      | power bi    |
| 552322 | Associate Director- Data Insights     | Anywhere     | Full-time         | 255829.5   | 2023-06-18 16:03:12   | AT&T                                      | powerpoint  |
| 99305  | Data Analyst, Marketing               | Anywhere     | Full-time         | 232423.0   | 2023-12-05 20:00:40   | Pinterest Job Advertisements              | sql         |
| 99305  | Data Analyst, Marketing               | Anywhere     | Full-time         | 232423.0   | 2023-12-05 20:00:40   | Pinterest Job Advertisements              | python      |
| 99305  | Data Analyst, Marketing               | Anywhere     | Full-time         | 232423.0   | 2023-12-05 20:00:40   | Pinterest Job Advertisements              | r           |
| 99305  | Data Analyst, Marketing               | Anywhere     | Full-time         | 232423.0   | 2023-12-05 20:00:40   | Pinterest Job Advertisements              | hadoop      |
| 99305  | Data Analyst, Marketing               | Anywhere     | Full-time         | 232423.0   | 2023-12-05 20:00:40   | Pinterest Job Advertisements              | tableau     |
| 1021647| Data Analyst (Hybrid/Remote)          | Anywhere     | Full-time         | 217000.0   | 2023-01-17 00:17:23   | Uclahealthcareers                         | sql         |
| 1021647| Data Analyst (Hybrid/Remote)          | Anywhere     | Full-time         | 217000.0   | 2023-01-17 00:17:23   | Uclahealthcareers                         | crystal     |
| 1021647| Data Analyst (Hybrid/Remote)          | Anywhere     | Full-time         | 217000.0   | 2023-01-17 00:17:23   | Uclahealthcareers                         | oracle      |
| 1021647| Data Analyst (Hybrid/Remote)          | Anywhere     | Full-time         | 217000.0   | 2023-01-17 00:17:23   | Uclahealthcareers                         | tableau     |
| 1021647| Data Analyst (Hybrid/Remote)          | Anywhere     | Full-time         | 217000.0   | 2023-01-17 00:17:23   | Uclahealthcareers                         | flow        |
| 168310 | Principal Data Analyst (Remote)       | Anywhere     | Full-time         | 205000.0   | 2023-08-09 11:00:01   | SmartAsset                                | sql         |
| 168310 | Principal Data Analyst (Remote)       | Anywhere     | Full-time         | 205000.0   | 2023-08-09 11:00:01   | SmartAsset                                | python      |
| 168310 | Principal Data Analyst (Remote)       | Anywhere     | Full-time         | 205000.0   | 2023-08-09 11:00:01   | SmartAsset                                | go          |
| 168310 | Principal Data Analyst (Remote)       | Anywhere     | Full-time         | 205000.0   | 2023-08-09 11:00:01   | SmartAsset                                | snowflake   |
| 168310 | Principal Data Analyst (Remote)       | Anywhere     | Full-time         | 205000.0   | 2023-08-09 11:00:01   | SmartAsset                                | pandas      |
| 168310 | Principal Data Analyst (Remote)       | Anywhere     | Full-time         | 205000.0   | 2023-08-09 11:00:01   | SmartAsset                                | numpy       |
| 168310 | Principal Data Analyst (Remote)       | Anywhere     | Full-time         | 205000.0   | 2023-08-09 11:00:01   | SmartAsset                                | excel       |
| 168310 | Principal Data Analyst (Remote)       | Anywhere     | Full-time         | 205000.0   | 2023-08-09 11:00:01   | SmartAsset                                | tableau     |
| 168310 | Principal Data Analyst (Remote)       | Anywhere     | Full-time         | 205000.0   | 2023-08-09 11:00:01   | SmartAsset                                | gitlab      |
| 731368 | Director, Data Analyst - HYBRID       | Anywhere     | Full-time         | 189309.0   | 2023-12-07 15:00:13   | Inclusively                               | sql         |
| 731368 | Director, Data Analyst - HYBRID       | Anywhere     | Full-time         | 189309.0   | 2023-12-07 15:00:13   | Inclusively                               | python      |
| 731368 | Director, Data Analyst - HYBRID       | Anywhere     | Full-time         | 189309.0   | 2023-12-07 15:00:13   | Inclusively                               | azure       |
| 731368 | Director, Data Analyst - HYBRID       | Anywhere     | Full-time         | 189309.0   | 2023-12-07 15:00:13   | Inclusively                               | aws         |
| 731368 | Director, Data Analyst - HYBRID       | Anywhere     | Full-time         | 189309.0   | 2023-12-07 15:00:13   | Inclusively                               | oracle      |
| 731368 | Director, Data Analyst - HYBRID       | Anywhere     | Full-time         | 189309.0   | 2023-12-07 15:00:13   | Inclusively                               | snowflake   |
| 731368 | Director, Data Analyst - HYBRID       | Anywhere     | Full-time         | 189309.0   | 2023-12-07 15:00:13   | Inclusively                               | tableau     |
| 731368 | Director, Data Analyst - HYBRID       | Anywhere     | Full-time        


The analysis of the top-paying job skills based on the provided CSV data reveals the following insights:

1. Top Paying Skills: The skills associated with the highest average annual salaries are:
   - Jupyter: $255,829.50
   - PySpark: $255,829.50
   - Databricks: $255,829.50
   - PowerPoint: $255,829.50
   - Hadoop: $232,423.00

2. Consistent High Salary: 
Skills such as Jupyter, PySpark, Databricks, and PowerPoint all share the same high average salary,
 indicating that these are particularly valuable in the job market.

3. High Demand for Data-related Skills:
 Many of the top-paying skills are related to data processing and analysis
(e.g., Jupyter, PySpark, Databricks, Hadoop), emphasizing the high demand for expertise in these areas.

4. Versatility of High-Paying Skills:
 Some skills like PowerPoint, which is generally considered a presentation tool, 
 also appear among the top-paying skills. 
 This indicates that proficiency in widely-used business tools can also command high salaries when 
 combined with other technical skills.

### 3. The Top Demanding Skills In The Field Of Data
By examining the frequency of job postings requiring specific skills, I determined the most in-demand skills for data analysts. This analysis reveals the skills that are highly sought after by employers.

```sql
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
```
## Skills Demand Table
| Skills   | Demand Count |
|----------|--------------|
| SQL      | 7291         |
| Excel    | 4611         |
| Python   | 4330         |
| Tableau  | 3745         |
| Power BI | 2609         |

 Findings from the Analysis of Top Demanding Skills in Data Analysis

1. **High Demand for SQL**:
   - SQL is the most sought-after skill, with a demand count of 7,291, indicating its critical importance in data analysis roles.

2. **Excel as a Key Competency**:
   - Excel remains highly relevant, with a demand count of 4,611, showing its widespread use in data handling and analysis tasks.

3. **Popularity of Python**:
   - Python, a versatile programming language, has a strong demand count of 4,330, reflecting its growing significance in data analysis and machine learning.

4. **Visualization Tools in Demand**:
   - Tableau and Power BI are essential for data visualization, with demand counts of 3,745 and 2,609 respectively, highlighting the need for skills in presenting data insights effectively.

These findings underscore the critical skills that data analysts need to meet current job market demands, with a particular emphasis on SQL, Excel, Python, and data visualization tools like Tableau and Power BI.
### 4. The top Paying skills in The Field Of Data
Focusing on the skills that command the highest salaries, I analyzed the average yearly salaries linked to each skill. This query highlights the skills that can significantly boost a data analyst's earning potential.

```sql
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
```

## Skills and Average Salary Table

| Skills         | Avg Salary |
|----------------|------------|
| PySpark        | 208172     |
| Bitbucket      | 189155     |
| Couchbase      | 160515     |
| Watson         | 160515     |
| DataRobot      | 155486     |
| GitLab         | 154500     |
| Swift          | 153750     |
| Jupyter        | 152777     |
| Pandas         | 151821     |
| Elasticsearch  | 145000     |
| Golang         | 145000     |
| NumPy          | 143513     |
| Databricks     | 141907     |
| Linux          | 136508     |
| Kubernetes     | 132500     |
| Atlassian      | 131162     |
| Twilio         | 127000     |
| Airflow        | 126103     |
| Scikit-learn   | 125781     |
| Jenkins        | 125436     |
| Notion         | 125000     |
| Scala          | 124903     |
| PostgreSQL     | 123879     |
| GCP            | 122500     |
| MicroStrategy  | 121619     |


Findings from the Analysis of Top Paying Skills in the Data field

1. **Top-Earning Skills**:
   - PySpark leads with an impressive average salary of $208,172, making it the highest-paying skill for data analysts.

2. **Valuable Collaboration Tools**:
   - Bitbucket ($189,155) and GitLab ($154,500) highlight the significant value placed on version control and collaboration skills in data projects.

3. **High-Value Specialized Technologies**:
   - Skills like Couchbase and Watson (both $160,515) and DataRobot ($155,486) command high salaries, indicating a premium on specialized data processing and AI tools.

4. **Programming and Data Processing Proficiency**:
   - Tools and languages such as Swift ($153,750), Jupyter ($152,777), and Pandas ($151,821) are well-compensated, reflecting their critical importance in the field.

### 5. The Most Optimal Skills
To identify the most optimal skills for data analysts, I combined the analysis of both salary and demand. This approach highlights the skills that are not only well-paid but also in high demand, providing a balanced perspective on the best skills to acquire.

```sql
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
```
## Skills Demand and Average Salary Table

| Skill ID | Skills      | Demand Count | Avg Salary |
|----------|-------------|--------------|------------|
| 234      | Confluence  | 11           | 114210     |
| 233      | Jira        | 20           | 104918     |
| 215      | Flow        | 28           | 97200      |
| 201      | Alteryx     | 17           | 94145      |
| 199      | SPSS        | 24           | 92170      |
| 198      | Outlook     | 13           | 90077      |
| 197      | SSRS        | 14           | 99171      |
| 196      | PowerPoint  | 58           | 88701      |
| 195      | SharePoint  | 18           | 81634      |
| 194      | SSIS        | 12           | 106683     |
| 192      | Sheets      | 32           | 86088      |
| 188      | Word        | 48           | 82576      |
| 187      | Qlik        | 13           | 99631      |
| 186      | SAS         | 63           | 98902      |
| 185      | Looker      | 49           | 103795     |
| 183      | Power BI    | 110          | 97431      |
| 182      | Tableau     | 230          | 99288      |
| 181      | Excel       | 256          | 87288      |
| 97       | Hadoop      | 22           | 113193     |
| 92       | Spark       | 13           | 99077      |
| 80       | Snowflake   | 37           | 112948     |
| 79       | Oracle      | 37           | 104534     |
| 78       | Redshift    | 16           | 99936      |
| 77       | BigQuery    | 13           | 109654     |
| 76       | AWS         | 32           | 108317     |
| 74       | Azure       | 34           | 111225     |
| 61       | SQL Server  | 35           | 97786      |
| 22       | VBA         | 24           | 88783      |
| 13       | C++         | 11           | 98958      |
| 9        | JavaScript  | 20           | 97587      |
| 8        | Go          | 27           | 115320     |
| 7        | SAS         | 63           | 98902      |
| 5        | R           | 148          | 100499     |
| 4        | Java        | 17           | 106906     |
| 2        | NoSQL       | 13           | 101414     |
| 1        | Python      | 236          | 101397     |
| 0        | SQL         | 398          | 97237      |



Findings from the Analysis of Optimal Skills in The Data Field

1. **Most Demanded Skills**:
   - SQL (398), Python (236), and Tableau (230) are the most demanded skills, reflecting their widespread use and importance in data analysis roles.

2. **Top-Paying Skills**:
   - High-paying skills include Go ($115,320), Confluence ($114,210), and Snowflake ($112,948), indicating a premium for specialized technical expertise.

3. **High Demand with Competitive Salaries**:
   - Skills like Power BI (110 demand count, $97,431) and SAS (63 demand count, $98,902) combine high demand with competitive salaries, showcasing their value in the job market.

4. **Specialized Tools and Technologies**:
   - Tools such as Confluence, Jira, and Flow, while not the highest in demand, still command substantial salaries, emphasizing the importance of proficiency in specialized software for data professionals.

-What I learned
### Project Learnings

Through this project, I gained valuable insights and hands-on experience in various aspects of data analysis and database management. Here are some key learnings:

1. **SQL for Data Analysis**:
   - I learned how to write complex SQL queries to analyze data effectively, including filtering, grouping, and joining tables to extract meaningful insights.

2. **Database Management with PostgreSQL**:
   - I gained proficiency in managing databases using PostgreSQL, including creating, updating, and querying databases to handle large datasets efficiently.

3. **Loading and Handling CSV Files**:
   - I mastered the process of loading CSV files into Visual Studio Code and subsequently into databases, ensuring smooth data integration and manipulation.

4. **Connecting Visual Studio Code with PostgreSQL**:
   - I learned how to establish a connection between Visual Studio Code and PostgreSQL, enabling seamless interaction between the development environment and the database.

5. **Advanced SQL Techniques**:
   - Through practical application, I expanded my knowledge of advanced SQL techniques, including using Common Table Expressions (CTEs) and window functions to perform sophisticated data analysis.

These skills have significantly enhanced my ability to work with databases and perform detailed data analysis, preparing me for more complex projects in the future.

# Conclusion

### Insights from the Data Analysis
#### Skills Demand and Salary
##### High Demand Skills:

- SQL has the highest demand count (7291), followed by Excel (4611), Python (4330), Tableau (3745), and Power BI (2609).
These skills are crucial for data-related roles, with SQL being the most demanded, reflecting its fundamental role in data management and manipulation.
Top Paying Skills:

- Pyspark stands out with the highest average salary ($208,172), followed by Bitbucket ($189,155) and Couchbase ($160,515).
##### Other high-paying skills include Watson, Datarobot, and Gitlab, indicating that specialized technical skills and proficiency in specific platforms are highly valued.
#### Job Listings Analysis
##### Top Job Titles and Salaries:

- Data Analyst roles show significant variation in salary, with the highest being $650,000 for a Data Analyst at Mantys, highlighting that specific industries or companies might offer exceptionally high compensation for these roles.
- Director of Analytics at Meta offers a substantial salary of $336,500, indicating that leadership roles in analytics can command high salaries.
- The role of Associate Director- Data Insights at AT&T offers a competitive salary of $255,829.5, showcasing the value of senior analytical positions in major corporations.
##### Consistent Demand for Analytical Roles:

- There is a steady demand for various analytical positions such as Data Analyst, Principal Data Analyst, and Director of Data Analyst, indicating that organizations continue to prioritize data-driven decision-making.
- Companies across different sectors, including tech giants like Meta, telecommunications like AT&T, and financial services like SmartAsset, are heavily investing in analytical talent.
General Observations
Skill Set Importance:

- Fundamental skills like SQL, Python, and Excel are universally demanded across different job roles and industries.
Specialized skills such as Pyspark, Bitbucket, and Couchbase command higher salaries, suggesting a premium for niche expertise.
Role Variability:

- Salaries for similar job titles can vary significantly, influenced by the industry, company, location, and specific skill requirements.
- Full-time roles with flexible or remote work options are prevalent, reflecting current trends towards remote work environments.

### Closing thoughts
This project provided an in-depth exploration into the realm of data analysis and database management. By utilizing SQL and PostgreSQL, I was able to derive significant insights from complex datasets, highlighting the most demanded and highest-paying skills in the data analysis field.

The process involved writing advanced SQL queries, managing databases effectively, and seamlessly integrating CSV files into the workflow using Visual Studio Code. Establishing a connection between Visual Studio Code and PostgreSQL further streamlined the data analysis process, making it efficient and manageable.

These experiences have not only deepened my understanding of SQL and PostgreSQL but also enhanced my ability to handle real-world data analysis tasks proficiently. The skills and knowledge acquired through this project are invaluable assets that will undoubtedly contribute to my future endeavors in data analysis and database management.

