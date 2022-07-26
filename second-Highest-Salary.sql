/*source:https://leetcode.com/problems/second-highest-salary/*/

select
    (SELECT DISTINCT(salary)
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1) 
as  SecondHighestSalary;
    
    
