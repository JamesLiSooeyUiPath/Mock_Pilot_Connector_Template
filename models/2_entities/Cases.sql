with Customer_Data_Input as (
    select * from {{ ref('Customer_Data_Input') }}
),

/* 
Template for Cases File
Update Required: Add optional fields for Case based attributes
*/
Cases as (
    select
        Customer_Data_Input."OR_ID" + '_' + Customer_Data_Input."Client_Name" as "Case ID"
    from Customer_Data_Input
)

select * from Cases
