WITH customers AS (
    SELECT 
        _CustomerID AS Customer_ID,
        "Customer Names" AS Customer_Names
    FROM {{ source("eCom", "Customers") }}
    )
select *
from customers
