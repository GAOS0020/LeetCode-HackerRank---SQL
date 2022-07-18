/*
source: https://www.hackerrank.com/challenges/symmetric-pairs/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
*/

select
    a.x,a.y
from
    functions a,functions b
where
    a.y = b.x
and
    a.x = b.y
group by
    a.x,a.y
having
    count(a.x)>1 or a.x<a.y
order by
    a.x
