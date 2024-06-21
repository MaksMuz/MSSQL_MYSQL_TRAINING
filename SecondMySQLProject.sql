-- Exploratory Data Analysis

select * from layoffs_staging2;

select max(total_laid_off), max(percentage_laid_off), avg(total_laid_off), avg(percentage_laid_off)
from layoffs_staging2;

select * from layoffs_staging2
where percentage_laid_off = 1;

select * from layoffs_staging2
where percentage_laid_off = 1
order by total_laid_off DESC;

select * from layoffs_staging2
where percentage_laid_off = 1
order by funds_raised_millions DESC;

select company, total_laid_off
from layoffs_staging2;

select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 DESC;

select min(`date`), max(`date`)
from layoffs_staging2;

select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 DESC;

select distinct(company), industry, sum(total_laid_off) OVER(PARTITION BY company)
from layoffs_staging2
order by 3 DESC;

select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 DESC;

WITH summed_layoffs AS (
    SELECT 
        country, 
        company, 
        industry, 
        sum(total_laid_off) OVER (PARTITION BY company) AS company_total_laid_off,
        sum(total_laid_off) OVER (PARTITION BY country) AS country_total_laid_off
    FROM 
        layoffs_staging2
)
SELECT DISTINCT
    country,
    company,
    industry,
    company_total_laid_off,
    country_total_laid_off
FROM 
    summed_layoffs
ORDER BY 
    country,
    company;
    
select `date`, sum(total_laid_off)
from layoffs_staging2
group by `date`
order by 1 desc;

select YEAR(`date`), sum(total_laid_off)
from layoffs_staging2
group by YEAR(`date`)
order by 1 desc;

select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 1 desc;

select substring(`date`,6,2) as `MONTH`, sum(total_laid_off)
from layoffs_staging2
group by `MONTH`;

select substring(`date`,1,7) as `MONTH`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `MONTH`
order by 1 asc;


with Rolling_Total as
(
select substring(`date`,1,7) as `MONTH`, sum(total_laid_off) as total_off
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `MONTH`
order by 1 asc
)
select `MONTH`, total_off, sum(total_off) over(order by `MONTH`) as rolling_total
from Rolling_Total;

select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by 3 desc;

with Company_Year (company, years, total_laid_off) as
(
select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
)
select * from Company_Year;

with Company_Year (company, years, total_laid_off) as
(
select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
)
select *, dense_rank() over(partition by years order by total_laid_off desc) as Ranking 
from Company_Year
where years is not null
order by Ranking;

with Company_Year (company, years, total_laid_off) as
(
select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
), Company_Year_Rank as
(
select *, dense_rank() over(partition by years order by total_laid_off desc) as Ranking 
from Company_Year
where years is not null
)
select * from Company_Year_Rank;

with Company_Year (company, years, total_laid_off) as
(
select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
), Company_Year_Rank as
(
select *, dense_rank() over(partition by years order by total_laid_off desc) as Ranking 
from Company_Year
where years is not null
)
select * from Company_Year_Rank
where Ranking <= 5;
