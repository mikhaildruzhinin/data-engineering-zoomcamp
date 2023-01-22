/**
 * How many taxi trips were totally made on January 15?
 */
select count(*)
from green_taxi_trips gtt 
where date(lpep_pickup_datetime) = '2019-01-15'
and date(lpep_dropoff_datetime) = '2019-01-15';

/**
 * Which was the day with the largest trip distance? Use the pick up time for your calculations.
 */
select date(lpep_pickup_datetime)
from green_taxi_trips gtt 
order by trip_distance desc
limit 1;

/**
 * In 2019-01-01 how many trips had 2 and 3 passengers?
 */
select '2', count(1)
from green_taxi_trips gtt 
where date(lpep_pickup_datetime) = '2019-01-01'
--and date(lpep_dropoff_datetime) = '2019-01-01'
and passenger_count = 2
union
select '3', count(1)
from green_taxi_trips gtt 
where date(lpep_pickup_datetime) = '2019-01-01'
--and date(lpep_dropoff_datetime) = '2019-01-01'
and passenger_count = 3;

/**
 * For the passengers picked up in the Astoria Zone which was the drop off zone that had the largest tip?
 * We want the name of the zone, not the id.
 */
select gtt.tip_amount, z1."Zone" as pickup_zone, z2."Zone" as dropoff_zone
from green_taxi_trips gtt 
left join zones z1
on gtt."PULocationID" = z1."LocationID"
left join zones z2
on gtt."DOLocationID" = z2."LocationID"
where z1."Zone" = 'Astoria'
order by tip_amount desc
limit 1;
