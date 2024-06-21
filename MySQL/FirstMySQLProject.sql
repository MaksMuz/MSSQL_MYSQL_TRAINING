SELECT *
FROM layoffs;

-- Remove Duplicates
-- Standarize the Data
-- Null Values or blank values
-- Remove Any Columns

CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT * 
FROM layoffs_staging;

INSERT layoffs_staging
SELECT *
FROM layoffs;

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date') as row_num
FROM layoffs_staging;

WITH duplicate_cte as
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location,
industry, total_laid_off, percentage_laid_off, `date`, stage,
country, funds_raised_millions) as row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

SELECT *
FROM layoffs_staging
WHERE company='Oda';

SELECT *
FROM layoffs_staging
WHERE company='Casper';

WITH duplicate_cte as
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location,
industry, total_laid_off, percentage_laid_off, `date`, stage,
country, funds_raised_millions) as row_num
FROM layoffs_staging
)
DELETE
FROM duplicate_cte
WHERE row_num > 1;

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * 
FROM layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location,
industry, total_laid_off, percentage_laid_off, `date`, stage,
country, funds_raised_millions) as row_num
FROM layoffs_staging;

SELECT * 
FROM layoffs_staging2
WHERE row_num > 1;

DELETE
FROM layoffs_staging2
WHERE row_num > 1;

SELECT * 
FROM layoffs_staging2
WHERE row_num > 1;

-- Standarizing data

SELECT distinct(company)
FROM layoffs_staging2;

SELECT company, TRIM(company)
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

SELECT distinct(industry)
FROM layoffs_staging2
ORDER BY 1;

SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

UPDATE
layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%';

SELECT distinct(industry)
FROM layoffs_staging2
ORDER BY 1;

SELECT distinct location
FROM layoffs_staging2
ORDER BY 1;

SELECT distinct(country)
FROM layoffs_staging2
ORDER BY 1;

SELECT distinct(country)
FROM layoffs_staging2
WHERE country LIKE 'United%';

UPDATE
layoffs_staging2
set country = 'United States'
where country like 'United States%';

select `date`,
str_to_date(`date`, '%m/%d/%Y')
from layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date(`date`, '%m/%d/%Y');

select * from layoffs_staging2;

Alter table layoffs_staging2
modify column `date` DATE;

SELECT *
from layoffs_staging2
where total_laid_off IS NULL;

SELECT *
from layoffs_staging2
where total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
from layoffs_staging2
where industry IS NULL
OR industry = '';

SELECT *
FROM layoffs_staging2
WHERE company = 'Airbnb';

SELECT *
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	on t1.company = t2.company
where (t1.industry IS NULL OR  t1.industry = '')
and t2.industry IS NOT NULL;

SELECT t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	on t1.company = t2.company
where (t1.industry IS NULL OR  t1.industry = '')
and t2.industry IS NOT NULL;

UPDATE layoffs_staging2 t1 # wrong
join layoffs_staging2 t2
	on t1.company = t2.company
SET t1.industry = t2.industry
where (t1.industry IS NULL OR  t1.industry = '')
and t2.industry IS NOT NULL;

update layoffs_staging2
set industry = null
where industry= '';

UPDATE layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
SET t1.industry = t2.industry
where t1.industry IS NULL
and t2.industry IS NOT NULL;

SELECT *
FROM layoffs_staging2
WHERE company like 'Bally%';

SELECT *
from layoffs_staging2
where total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE
from layoffs_staging2
where total_laid_off IS NULL
AND percentage_laid_off IS NULL;

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;