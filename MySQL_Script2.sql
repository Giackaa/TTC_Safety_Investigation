select OCC_Year, count(occ_year) as Assault_Count from assault_open_data
where occ_year between 2018 and 2023
group by OCC_Year
;

