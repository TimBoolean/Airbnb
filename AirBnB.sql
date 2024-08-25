SELECT * FROM airbnbbb.analysis;

alter table analysis
modify column guests varchar(50);


-- # of host_type

select
(select count(host_type) from analysis where host_type = '2-5 Units') as 'host_type_2-5',
(select count(host_type) from analysis where host_type = 'single owners') as 'single owners',
(select count(host_type) from analysis where host_type = 'Professionals' ) as 'Professionals';

-- amenities affect on revenue

select am.hot_tub, am.pool, an.host_type, avg(an.revenue) as avg_revenue
from analysis an
join amenities am
on am.unified_id = an.unified_id
group by 1, 2,3
order by an.host_type;

-- max revenue by host_type

select host_type, sum(revenue) as max_rev
from analysis 
group by 1;

-- count # of host types

 select host_type, count(host_type) as num_of_hosts
from analysis
group by host_type;

-- Percentage of host type

Select
host_type,
count(*) as count_per_group,
(count(*) * 100.0) / (select count(*) from analysis) as percentage
from analysis
group by host_type

-- city and revenue

select city, avg(revenue) as avg_rev
from analysis
group by city
order by avg_rev

-- length stay by host type
Select host_type, length_stay, count(host_type) as num_host
from analysis
group by 1,2
order by num_host ;

-- length of stay for each month

select length_stay, month, host_type
from analysis
group by 1,2,3
order by 3

select host_type, avg(revenue)
from analysis
group by 1

Select
host_type,
count(*) AS count_per_group,
(count(*) * 100.0) / (select count(*) from analysis) AS percentage
from analysis
group by host_type










