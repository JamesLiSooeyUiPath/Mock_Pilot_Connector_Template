
with Customer_Data_Input as (
    select * from {{ ref('Customer_Data_Input') }}
),

/* 
Template for Events file
Update Required: Add required fields -- Activity and Event End
Update Required: Add optional fields for event based attributes
*/
Events as (
    select
        Customer_Data_Input."OR_ID" + '_' + Customer_Data_Input."Client_Name" as "Case ID"
    from Customer_Data_Input
)

select * from Events


