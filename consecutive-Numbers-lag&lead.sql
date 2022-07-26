/*source:https://leetcode.com/problems/consecutive-numbers/*/

with laglead as(
select
    num,
    lag(num,1) over(order by id) as 'lag',
    lead(num,1) over(order by id) as 'lead'
from
    Logs
)

select
    distinct num as ConsecutiveNums
from
    laglead
where
    num = laglead.lag and num = laglead.lead


