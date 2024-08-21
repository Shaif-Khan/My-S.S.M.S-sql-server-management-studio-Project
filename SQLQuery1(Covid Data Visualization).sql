-- To Fetch & make the temporary table we use (#temp) syntax!

with #temp_datadriven as (select continent,total_cases,population from coviddeath where continent is 
not null  )

select * from #temp_datadriven




-- To Fetch all the details of a particular Table!

select * from coviddeath
select * from covidvaccinations




--To join the two tables on the basis of some common data we use join command!

select * from coviddeath join covidvaccinations on coviddeath.location=covidvaccinations.location




-- join two tables with the help of Alias!


select * from coviddeath dea join covidvaccinations vac on dea.location=vac.location 




-- By using where Clause!

select * from coviddeath dea join covidvaccinations vac on dea.location=vac.location
where new_cases is not null




-- To fetch a particular data of a Table!

select positive_rate,tests_per_case,tests_units,total_tests,people_vaccinated,people_fully_vaccinated
from covidvaccinations where total_tests is not null



-- Data manipulation with the help of MAX,MIN,AVG!
select max(positive_rate)as newcolumn,tests_per_case,tests_units,total_tests,people_vaccinated,
people_fully_vaccinated
from covidvaccinations where total_tests is not null group by positive_rate,tests_per_case,
tests_units,total_tests,people_vaccinated,people_fully_vaccinated order by 3,4



select positive_rate ,tests_per_case,tests_units,total_tests,min(people_vaccinated) as minvaccinations,
people_fully_vaccinated
from covidvaccinations where total_tests is not null group by positive_rate,tests_per_case,
tests_units,total_tests,people_vaccinated,people_fully_vaccinated order by 3,4



select positive_rate,tests_per_case,tests_units,total_tests,people_vaccinated,
avg(cast(people_fully_vaccinated as int)) as avgvaccinations
from covidvaccinations where total_tests is not null group by positive_rate,tests_per_case,
tests_units,total_tests,people_vaccinated,people_fully_vaccinated order by 3,4





--To Fetch the Data & and Make the CTE(Common Table Expressions)!

with cte_coviddata as (

select max(positive_rate)as newcolumn,tests_per_case,tests_units,total_tests,people_vaccinated,
people_fully_vaccinated
from covidvaccinations where total_tests is not null group by positive_rate,tests_per_case,
tests_units,total_tests,people_vaccinated,people_fully_vaccinated 
)

select * from cte_coviddata




--How to Perform Different Joins!(full join,right join,inner join,right outer join,left join, left outer join)!

select hosp_patients,hosp_patients,weekly_icu_admissions_per_million
,total_cases_per_million,total_deaths_per_million
from coviddeath full join covidvaccinations on coviddeath.iso_code=covidvaccinations.iso_code where
hosp_patients  is not null and weekly_hosp_admissions_per_million is not null




select hosp_patients,hosp_patients,weekly_icu_admissions_per_million
,total_cases_per_million,total_deaths_per_million
from coviddeath  right join covidvaccinations on coviddeath.iso_code=covidvaccinations.iso_code where
hosp_patients  is not null and weekly_hosp_admissions_per_million is not null



select hosp_patients,hosp_patients,weekly_icu_admissions_per_million
,total_cases_per_million,total_deaths_per_million
from coviddeath inner join covidvaccinations on coviddeath.iso_code=covidvaccinations.iso_code where
hosp_patients  is not null and weekly_hosp_admissions_per_million is not null




select hosp_patients,hosp_patients,weekly_icu_admissions_per_million
,total_cases_per_million,total_deaths_per_million
from coviddeath right outer join covidvaccinations on coviddeath.iso_code=covidvaccinations.iso_code where
hosp_patients  is not null and weekly_hosp_admissions_per_million is not null




select hosp_patients,hosp_patients,weekly_icu_admissions_per_million
,total_cases_per_million,total_deaths_per_million
from coviddeath left join covidvaccinations on coviddeath.iso_code=covidvaccinations.iso_code where
hosp_patients  is not null and weekly_hosp_admissions_per_million is not null




select hosp_patients,hosp_patients,weekly_icu_admissions_per_million
,total_cases_per_million,total_deaths_per_million
from coviddeath left outer join covidvaccinations on coviddeath.iso_code=covidvaccinations.iso_code where
hosp_patients  is not null and weekly_hosp_admissions_per_million is not null




-- how to use UNION and UNION ALL!

select continent,reproduction_rate,population from coviddeath union select
location,continent,total_tests from covidvaccinations where continent is not null 
 order by 2,3




 select continent,reproduction_rate,population from coviddeath union all select
location,continent,total_tests from covidvaccinations where continent is not null 
 order by 1,2




--Use of <>,<,>,=,<=,>=!


select * from covidvaccinations where location = 'greece'




select * from covidvaccinations where continent <> 'asia'



select * from covidvaccinations where new_tests_smoothed <1100



select * from covidvaccinations where new_vaccinations_smoothed_per_million >2573




select * from covidvaccinations where new_vaccinations_smoothed_per_million >=13553





select * from covidvaccinations where new_vaccinations_smoothed_per_million <=553





-- Use of like keyword(clause)!

select * from covidvaccinations where iso_code like 'grc'





-- how to use stored Procedure!

create procedure test as select * from coviddeath
exec test


create procedure vaccinations as select * from covidvaccinations
exec vaccinations




--TO View the percentage of total deaths as per population!

select continent,total_deaths,population ,(total_deaths/population)*100 as 
percentageofdeath from coviddeath where  total_deaths   is not null
order by total_deaths desc 