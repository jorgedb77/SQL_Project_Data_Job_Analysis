/*
Respuesta: ¿Cuáles son las habilidades principales basadas en el salario?
- Analiza el salario promedio asociado con cada habilidad para puestos de Analista de Datos
- Se enfoca en roles con salarios especificados, independientemente de la ubicación
- ¿Por qué? Revela cómo las diferentes habilidades afectan los niveles salarios para los Analistas de Datos y 
    ayuda a identificar las habilidades financieramente más gratificantes para adquirir o mejorar
*/

SELECT
  skills_dim.skills AS skill,
  ROUND(AVG(salary_year_avg),2) AS promedio_salarioanual
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
GROUP BY skills_dim.skills 
ORDER BY promedio_salarioanual DESC
LIMIT 25; 