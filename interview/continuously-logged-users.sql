/* table: uid, login_date
   source: https://mp.weixin.qq.com/s/Hdmw_yJ_Tyr2wXK85AJcDA */

select
  b.uid as uid,
  b.gap as gap
  count(*)
from
  (select
    a.uid as uid,
    a.login_date - a.rn as gap
  from
    (select
      uid,
      login_date,
      row_number() over(partition by uid order by login_date) as rn
    from
      login) a
   )
group by
  b.uid, b.gap
having
  count(*)>=10
