EXEC DataWarehouse.bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN
    DECLARE @start_time DATETIME , @end_time DATETIME;
    BEGIN TRY
    PRINT '===========================================';
    PRINT '=========BRONZE LAYER LODING===============';
    PRINT '-------------------------------------------';
    PRINT '------------CRM TABLES LODING--------------';
    PRINT '-------------------------------------------';
    PRINT '>>>>>> TRUNCATION TABLE : bronze.crm_cust_info'
    SET @start_time = GETDATE();
    TRUNCATE TABLE bronze.crm_cust_info;
    PRINT '>>>>>> INSERTING DATA INTO TABLE : bronze.crm_cust_info'
    BULK INSERT bronze.crm_cust_info
    FROM 'C:\Users\Mrgul\Desktop\Ondia\sql_dtwh_project\datasets\source_crm\cust_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );
    SET @end_time = GETDATE();
    PRINT 'INSERTION TIME : ' + CAST(datediff(second ,@start_time, @end_time) AS NVARCHAR(50))+' seconds';
    PRINT '>>>>>> TRUNCATION TABLE : bronze.crm_prd_info'
    SET @start_time = GETDATE();
    TRUNCATE TABLE bronze.crm_prd_info;
    PRINT '>>>>>> INSERTING DATA INTO TABLE : bronze.crm_prd_info'
    BULK INSERT bronze.crm_prd_info
    FROM 'C:\Users\Mrgul\Desktop\Ondia\sql_dtwh_project\datasets\source_crm\prd_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );
    SET @end_time = GETDATE();
    PRINT 'INSERTION TIME : ' + CAST(datediff(second ,@start_time, @end_time) AS NVARCHAR(50))+' seconds';
    PRINT '>>>>>> TRUNCATION TABLE : bronze.crm_sales_details'
    TRUNCATE TABLE bronze.crm_sales_details;
    SET @start_time = GETDATE();
    PRINT '>>>>>> INSERTING DATA INTO TABLE : bronze.crm_sales_details'
    BULK INSERT bronze.crm_sales_details
    FROM 'C:\Users\Mrgul\Desktop\Ondia\sql_dtwh_project\datasets\source_crm\sales_details.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );
    SET @end_time = GETDATE();
    PRINT 'INSERTION TIME : ' + CAST(datediff(second ,@start_time, @end_time) AS NVARCHAR(50))+' seconds';
    PRINT '-------------------------------------------';
    PRINT '------------ERP TABLES LODING--------------';
    PRINT '-------------------------------------------';
    PRINT '>>>>>> TRUNCATION TABLE : bronze.erp_cust_az12'
    SET @start_time = GETDATE();
    TRUNCATE TABLE bronze.erp_cust_az12;
    PRINT '>>>>>> INSERTING DATA INTO TABLE : bronze.erp_cust_az12'
    BULK INSERT bronze.erp_cust_az12
    FROM 'C:\Users\Mrgul\Desktop\Ondia\sql_dtwh_project\datasets\source_erp\CUST_AZ12.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );
    SET @end_time = GETDATE();
    PRINT 'INSERTION TIME : ' + CAST(datediff(second ,@start_time, @end_time) AS NVARCHAR(50))+' seconds';
    PRINT '>>>>>> TRUNCATION TABLE : bronze.erp_loc_a101'
    SET @start_time = GETDATE();
    TRUNCATE TABLE bronze.erp_loc_a101;
    PRINT '>>>>>> INSERTING DATA INTO TABLE : bronze.erp_loc_a101'
    BULK INSERT bronze.erp_loc_a101
    FROM 'C:\Users\Mrgul\Desktop\Ondia\sql_dtwh_project\datasets\source_erp\LOC_A101.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );
    SET @end_time = GETDATE();
    PRINT 'INSERTION TIME : ' + CAST(datediff(second ,@start_time, @end_time) AS NVARCHAR(50))+' seconds';
    PRINT '>>>>>> TRUNCATION TABLE : bronze.erp_px_cat_g1v2'
    SET @start_time = GETDATE();
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;
    PRINT '>>>>>> INSERTING DATA INTO TABLE : bronze.erp_px_cat_g1v2'
    BULK INSERT bronze.erp_px_cat_g1v2
    FROM 'C:\Users\Mrgul\Desktop\Ondia\sql_dtwh_project\datasets\source_erp\PX_CAT_G1V2.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );
    SET @end_time = GETDATE();
    PRINT 'INSERTION TIME : ' + CAST(datediff(second ,@start_time, @end_time) AS NVARCHAR(50))+' seconds';
    END TRY
    BEGIN CATCH
        PRINT '==========================================';
        PRINT 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR(50));
        PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR(50));
        PRINT 'Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR(50));
        PRINT '==========================================';
    END CATCH;

END;
GO