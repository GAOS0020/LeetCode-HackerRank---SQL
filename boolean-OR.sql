/*source:https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true*/

WITH data AS
(
SELECT 
  c.hacker_id as id, h.name as name, count(c.challenge_id) as counter
FROM 
  Hackers h
JOIN 
  Challenges c 
 on c.hacker_id = h.hacker_id
GROUP BY 
  c.hacker_id, h.name
)
SELECT 
  id,name,counter
FROM 
  data
WHERE
  counter=(SELECT max(counter) FROM data) 
OR
  counter in (SELECT counter FROM data
                GROUP BY counter
                 HAVING count(counter)=1 )
ORDER BY 
  counter desc, id
  
  
