
/*
It's a hotel progress checking project.

Here are some business questions that we have to find 

1: Is our hotel revenue growing by year? (by hotel type)
2: Should we increase our parking lot size?
3: What trend can we see in the data? (by average daily rate)

Column that are used:
-hotel
-adr
-stays_in_week_nights
-stays_in_weekend_nights
-discount
-parking lot car spaces
*/

-- Here is a quick query to show the revenue by year according to hotel type.

Select arrival_date_year, hotel,
round(sum((stays_in_week_nights+stays_in_weekend_nights)*adr),2) as revenue
from hotels
group by arrival_date_year, hotel

/*
 The main query that we need to visualize the data
 
*/

with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union 
select * from dbo.['2020$'])

Select * from hotels
left join dbo.market_segment$
on hotels.market_segment = market_segment$.market_segment
left join dbo.meal_cost$
on meal_cost$.meal = hotels.meal