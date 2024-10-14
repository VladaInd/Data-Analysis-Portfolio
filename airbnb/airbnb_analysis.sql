-- Handling empty values
update listings
set neighbourhood_group = 'Unknown'
where neighbourhood_group is null
   or neighbourhood_group = '';

update listings
set license='Unknown'
where license is null;

select price, minimum_nights
from listings
where price is null
   or minimum_nights is null;

--Change Type of Columns

Alter table listings
    alter column price TYPE numeric(10, 2);

Alter table listings
    alter column calculated_host_listings_count TYPE integer
        using (calculated_host_listings_count::integer);

alter table listings
    alter column last_review TYPE date
        using (last_review::date);

--Remove Duplicates

with duplicate_lis as
         (select *,
                 row_number() over (
                     partition by id,host_id,name
                     ) as row_num
          from listings)
select *
from duplicate_lis
where row_num > 1;

with duplicate_rew as (select *,
                              row_number() over (
                                  partition by id,reviewer_id
                                  ) as row_num
                       from reviews)
select *
from duplicate_rew
where row_num > 1;


--Overview Of Pricing Statistics for Each Room Type

select room_type,
       round(avg(price), 2) as avg_price,
       max(price)           as max_price,
       min(price)           as min_price
from listings
group by room_type;

--Calculate average price, average number of reviews, and their correlation

SELECT AVG(price)                     as avg_price,
       AVG(number_of_reviews)         as avg_reviews,
       CORR(price, number_of_reviews) as price_review_correlation
FROM listings;

-- Analysis of Airbnb data by month for 2023

select sum(l.minimum_nights)              as total_nights_booked,
       ROUND(avg(l.price), 2)             as avg_price,
       ROUND(avg(l.number_of_reviews), 2) as avg_num_of_reviews,
       extract(month from r.date:: date)  as month,
       sum(l.minimum_nights * l.price)    as sum_income
from listings as l
         join public.reviews r on l.id = r.listing_id
where r.date between '2023-01-01' and '2023-12-31'
group by extract(month from r.date:: date)
order by month;

--TOP 10 Hosts

SELECT host_name,
       sum(case when room_type = 'Entire home/apt' then 1 else 0 end) as entire_home,
       sum(case when room_type = 'Private rooms' then 1 else 0 end)   as private_room,
       sum(case when room_type = 'Shared rooms' then 1 else 0 end)    as shared_rooms,
       sum(case when room_type = 'Hotels rooms' then 1 else 0 end)    as hotels_rooms,
       calculated_host_listings_count                                 as listings
from listings
group by host_name, calculated_host_listings_count
order by listings desc
limit 10;

--Room Type Distribution Analysis

with room_types_totals as (select room_type,
                                  sum(price)       as type_price,
                                  count(room_type) as count_type
                           from listings
                           group by room_type)
select room_type,
       count_type,
       round(100 * count_type / sum(count_type) over (), 1) as percentage_count
from room_types_totals
order by percentage_count desc;

--Calculate average rental prices for each neighborhood

select neighbourhood,
       round(avg(price), 1) as avg_price_nei
from listings
where price is not null
group by neighbourhood
order by neighbourhood desc;

--What was the trend in average price of property during 2023

select extract(month from r.date:: date) as month,
       round(avg(l.price), 1)            as avg_price
from listings l
         join public.reviews r on l.id = r.listing_id
where r.date between '2023-01-01' and '2023-12-31'
group by month
order by month;

-- Analysis Short-Term Rentals vs Long-Term Rentals

with total_rental as (select minimum_nights,
                             case
                                 when minimum_nights < 30 and minimum_nights is not null then 'short_term_rentals'
                                 else 'long_term_rentals'
                                 end as term_rentals
                      from listings)
select sum(case when term_rentals = 'short_term_rentals' then 1 else 0 end) as short_term_count,
       sum(case when term_rentals = 'long_term_rentals' then 1 else 0 end)  as long_term_count,
       round(100 * sum(case when term_rentals = 'short_term_rentals' then 1 else 0 end) / sum(count(*)) over (), 2),
       round(100 * sum(case when term_rentals = 'long_term_rentals' then 1 else 0 end) / sum(count(*)) over (), 2)
from total_rental;


