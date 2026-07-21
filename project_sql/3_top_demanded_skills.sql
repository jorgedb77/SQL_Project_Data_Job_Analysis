/*
Pregunta: ¿Cuáles son las habilidades más demandadas para los analistas de datos?
- Une las ofertas de empleo a la tabla de unión interna (inner join) de manera similar a la consulta 2
- Identifica las 5 principales habilidades más demandadas para un analista de datos.
- Enfócate en todas las ofertas de empleo.
- ¿Por qué? Recupera las 5 habilidades con mayor demanda en el mercado laboral, 
  ofreciendo información sobre las habilidades más valiosas para quienes buscan empleo.
*/

SELECT
  skills_dim.skills AS skill,
  COUNT(skills_dim.skills) AS conteo_demanda
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY skills_dim.skills 
ORDER BY conteo_demanda DESC
LIMIT 5; 