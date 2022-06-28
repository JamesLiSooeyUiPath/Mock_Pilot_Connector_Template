/*import*/ 
with Customer_Data_Raw as (
    select * from {{ (var("schema_sources"))}}.[Process Mining Training Data]
),


/* 
Load raw customer data from SQL Server into new SQL Table "Customer_Data_Input" 
Update Required: Convert datatypes from nvarchar to the correct data types
*/
Customer_Data_Input as (
    select
        Customer_Data_Raw."Reject_Cleared"
        ,Customer_Data_Raw."OR_Total_Rejects"
        ,Customer_Data_Raw."OR_ID"
        ,Customer_Data_Raw."PLI_Prod_Name"
        ,Customer_Data_Raw."Queue_Name"
        ,Customer_Data_Raw."Queue_Group_Name"
        ,Customer_Data_Raw."Queue_Occurrence_Start_Time"
        ,Customer_Data_Raw."Queue_Occurrence_End_Time"
        ,Customer_Data_Raw."Queue_Occurrence_Completed"
        ,Customer_Data_Raw."Task_Name"
        ,Customer_Data_Raw."Task_Id"
        ,Customer_Data_Raw."Task_Start_Time"
--        ,Customer_Data_Raw."Task_End_Time"
        ,{{ pm_utils.to_timestamp('Customer_Data_Raw."Task_End_Time"') }} as "Task_End_Time"
        ,Customer_Data_Raw."Product_Req_Type_Desc"
        ,Customer_Data_Raw."LOB_Type_Description_DM"
        ,Customer_Data_Raw."Sub_Product_Name_MVG"
        ,Customer_Data_Raw."Queue_Start_Date_To_Queue_End_Date"
        ,Customer_Data_Raw."IR_Total_DDA_Accounts"
        ,Customer_Data_Raw."Task_Assigned_To_SID"
        ,Customer_Data_Raw."Task_Assigned_To_Name"
        ,Customer_Data_Raw."Client_Name"
        ,Customer_Data_Raw."CASID"
    from Customer_Data_Raw
)

/* export */
select * from Customer_Data_Input
