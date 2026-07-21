/*
Respuesta: ¿Cuáles son las habilidades más óptimas para aprender (es decir, tienen alta demanda y son habilidades bien remuneradas)?
- Identifica habilidades con alta demanda y asociadas con altos salarios promedio para roles de Analista de Datos
- Se concentra en puestos remotos con salarios especificados
- ¿Por qué? Apunta a habilidades que ofrecen seguridad laboral (alta demanda) y beneficios financieros (altos salarios), 
    ofreciendo información estratégica para el desarrollo profesional en análisis de datos
*/

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS conteo_demanda,
    ROUND(AVG(job_postings_fact.salary_year_avg),2) AS promedio_salarioanual
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id,
    skills_dim.skills
HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY
    promedio_salarioanual DESC,
    conteo_demanda DESC
LIMIT 25;