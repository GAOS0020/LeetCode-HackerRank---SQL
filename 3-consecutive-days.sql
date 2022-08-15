/*source:https://leetcode.com/problems/human-traffic-of-stadium/*/

select
    id,visit_date,people
from
    (select
        *,
        case 
            when (lag(id,1) over(order by id asc)+1=id and lag(id,2) over(order by id asc)+2=id) then True
            when (lead(id,1) over(order by id asc)-1=id and lag(id,1) over(order by id asc)+1=id) then True
            when (lead(id,1) over(order by id asc)-1=id and lead(id,2) over(order by id asc)-2=id) then True
            else False
        end as csc
    from
        Stadium
    where
        people >= 100) a
where
    a.csc = True
    
    
