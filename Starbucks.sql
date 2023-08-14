-- Choosing a specific Database of interest to work with 

use superstore;

-- Having a look at all the tables available in our superstore schema(database)

show tables;


-- 1. Selecting to have a closer look at all the data inside the `starbucks_directory` table.
-- 2. Having a closer look at all column names and other information about the starbucks_directory table 

select * from starbucks_directory;
Describe starbucks_directory;

-- Renaming some of the columns to be worked on inside the starbucks_directory table so as to fit the naming convention.

alter table starbucks_directory rename column store_name to Store_Name;
alter table starbucks_directory rename column `Store Number` to Store_Number;
alter table starbucks_directory rename column `Ownership Type` to Ownership_Type;
alter table starbucks_directory rename column `Street Address` to Street_Address;
alter table starbucks_directory rename column `State/Province` to State;

-- Reselecting to have a look at all the data to confirm that some of the columns be worked have been sucessfully renamed.

select Brand, Store_Number, Store_Name, Ownership_Type, City, Country 
from starbucks_directory;

-- Dropping some of the unwanted columns.

alter table starbucks_directory drop column Street_Address;
alter table starbucks_directory drop column Postcode;
alter table starbucks_directory drop column `Phone Number`;
alter table starbucks_directory drop column Timezone;
alter table starbucks_directory drop column Longitude;
alter table starbucks_directory drop column Latitude;

-- Reselecting all the data from the starbucks_directory to have a confirmatory look after dropping some columns.

select * from starbucks_directory;


-- Number of Individual Ownership Types existing inside the dataset
-- Qn: What are the different types of available business Ownserhips and how many are they? 

select Distinct(Ownership_Type) from starbucks_directory;

select count(Distinct(Ownership_Type)) as Total_count_of_Ownership_Types
from starbucks_directory;

-- Number stores under each ownership type in Descending order(From highest to lowest number of stores).
-- Qn: How many stores fall under each ownership?
-- Qn: Which Ownership Type has the highest number of stores?
-- Qn: Amongst the above Ownership types, which one has the least number of stores? 

select Ownership_Type, count(Ownership_Type) as Number_of_stores
from starbucks_directory
group by Ownership_Type
order by Number_of_stores Desc;

-- Number of Individual Brand names existing inside the dataset
-- Qn: What are the individual brands inside the dataset and how many are they?

select Distinct(Brand) from starbucks_directory;

select count(Distinct(Brand)) as Total_brand_count
from starbucks_directory;

-- Number stores under each Brand name in Descending order(From highest to lowest number of stores).

-- Qn: Which Brand has the hightest number of stores?
-- Qn: Which Brand has the least number of stores?

select Brand, count(Brand) as Number_of_stores
from starbucks_directory
group by Brand
order by Number_of_stores Desc;

-- Focusing more on the `Starbucks` Brand.
  -- Count of Starbucks stores by Country in Descending order.
  -- Qn: Which Country has the highest number of Starbucks stores?
  -- Qn: Which Country has the least number of Starbucks stores?
  -- Qn: What should be done to increase Starbucks store numbers in countries where they are less popular?
  
-- select Country, count(Country) as Total_store_count
-- from starbucks_directory
-- where Brand = 'Starbucks'
-- group by Country
-- order by Total_store_count Desc;

select Country, count(Country) as Total_store_count,
    case when count(Country) > 10000 then "Very High"
         when count(Country) >= 2000 then "High"
         when count(Country) >= 500  then "Moderate"
         when count(Country) >= 100 then "Adequate"
         when count(Country) >= 10 then "Low"
         else "Scarce"
    end as store_comparison
from starbucks_directory
where Brand = 'Starbucks'
group by Country
order by Total_store_count Desc;


   -- My Country of interest i.e US (United States)
     -- Number of Starbucks stores in the US
     -- Qn: What is the total number of Starbucks stores located inside the US (United States)?
     
select count(Brand) as Total_count_of_Starbucks_US_stores from starbucks_directory
where Country = 'US' and Brand = 'Starbucks';
     
     -- Count of Starbucks stores by City in United States in Descending order.
     -- Top 10 Cities in the United States with the highest number of Starbucks stores. 
     -- Which City in the United States has the lowest number of Starbucks stores and why?
     
select City, count(City) as Total_store_count
from starbucks_directory
where Country = 'US'
group by City
order by Total_store_count Desc
limit 10;


select City, count(City) as Total_store_count
from starbucks_directory
where Country = 'US'
group by City
order by Total_store_count Asc
limit 15;


