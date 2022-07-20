/*
source: https://www.hackerrank.com/challenges/interviews/problem?isFullScreen=true
tags: join VS left join
      when should aggregation function be used
*/

select
    a.contest_id,
    a.hacker_id,
    a.name,
    sum(c.ts),
    sum(c.tas),
    sum(b.tv),
    sum(b.tuv)
from
    (select
        ct.contest_id as contest_id,
        ct.hacker_id as hacker_id,
        ct.name as name,
        ch.challenge_id as challenge_id
    from
        contests ct,colleges cl,challenges ch
    where
        ct.contest_id = cl.contest_id
    and
        cl.college_id = ch.college_id) a
    left join
    (select
        challenge_id,
        sum(total_views) as tv,
        sum(total_unique_views) as tuv
     from
        view_stats
     group by
        challenge_id
    )b
    on a.challenge_id = b.challenge_id
    left join
    (select
        challenge_id,
        sum(total_submissions) as ts,
        sum(total_accepted_submissions) as tas
     from
        submission_Stats
     group by
        challenge_id
    ) c
    on a.challenge_id = c.challenge_id
group by
    a.contest_id,
    a.hacker_id,
    a.name
having
    sum(b.tv)+sum(b.tuv)+sum(c.ts)+sum(c.tas)>0
order by
    a.contest_id
    
    
