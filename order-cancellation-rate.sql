/*source:https://leetcode.com/problems/trips-and-users/*/

select
    t.request_at as Day,
    round(count(case when t.status in ('cancelled_by_driver', 'cancelled_by_client') then 1
                      else null
                end)/count(*),2) as 'Cancellation Rate'
from
    Trips t
where
    t.client_id in(select users_id from Users where banned = 'No')
and
    t.driver_id in(select users_id from Users where banned = 'No')
and
    t.request_at between '2013-10-01' and '2013-10-03'
group by
    t.request_at
    

