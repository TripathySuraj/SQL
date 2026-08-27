use swiggy;

-- if statement (only two possible cases like ternary operator)
SELECT name, cost,
IF(cost<=500,"Budget","Expensive") as budget_status
FROM restaurants;

-- CASE statement (for multiple cases)
SELECT name, cost,
CASE
    WHEN cost<=300 THEN "Budget"
    WHEN cost<600 THEN "Mid-Range"
    ELSE "Expensive"
END as budget_status
FROM restaurants;