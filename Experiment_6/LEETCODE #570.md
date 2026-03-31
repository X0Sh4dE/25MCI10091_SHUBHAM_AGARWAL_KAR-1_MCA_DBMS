<h1>LEETCODE #570</h1>
<img width="695" height="476" alt="image" src="https://github.com/user-attachments/assets/01aa5fbb-9f6c-4a7b-8c8a-ac234b61189a" />
<br>
<br>
<h3>SOLUTION</h3>

SELECT e.name FROM Employee e
JOIN 
Employee m ON e.id = m.managerId
GROUP BY e.id, e.name HAVING COUNT(m.id) >= 5;
