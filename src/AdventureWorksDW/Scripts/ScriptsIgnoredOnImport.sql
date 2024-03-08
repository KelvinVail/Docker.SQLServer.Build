
PRINT CONVERT(varchar(1000), @@VERSION);
GO

PRINT '';
GO

PRINT 'Started - ' + CONVERT(varchar, GETDATE(), 121);
GO

USE [master];
GO

-- ****************************************
-- Drop Database
-- ****************************************
PRINT '';
GO

PRINT '*** Dropping Database';
GO

IF @@ERROR = 3702 
    RAISERROR('$(DatabaseName) database cannot be dropped because there are still other open connections', 127, 127) WITH NOWAIT, LOG;
GO

-- ****************************************
-- Create Database
-- ****************************************
PRINT '';
GO

PRINT '*** Creating Database';
GO

PRINT '';
GO

PRINT '*** Checking for $(DatabaseName) Database';
GO

/* CHECK FOR DATABASE IF IT DOESN'T EXISTS, DO NOT RUN THE REST OF THE SCRIPT */
IF NOT EXISTS (SELECT TOP 1 1 FROM sys.databases WHERE name = N'$(DatabaseName)')
BEGIN
PRINT '*******************************************************************************************************************************************************************'
+char(10)+'********$(DatabaseName) Database does not exist.  Make sure that the script is being run in SQLCMD mode and that the variables have been correctly set.*********'
+char(10)+'*******************************************************************************************************************************************************************';
SET NOEXEC ON;
END
GO

ALTER DATABASE $(DatabaseName) 
SET RECOVERY SIMPLE, 
    ANSI_NULLS ON, 
    ANSI_PADDING ON, 
    ANSI_WARNINGS ON, 
    ARITHABORT ON, 
    CONCAT_NULL_YIELDS_NULL ON, 
    QUOTED_IDENTIFIER ON, 
    NUMERIC_ROUNDABORT OFF, 
    PAGE_VERIFY CHECKSUM, 
    ALLOW_SNAPSHOT_ISOLATION OFF;
GO

-- ****************************************
-- Create DDL Trigger for Database
-- ****************************************
PRINT '';
GO

PRINT '*** Creating DDL Trigger for Database';
GO

-- ******************************************************
-- Create tables
-- ******************************************************
PRINT '';
GO

PRINT '*** Creating Tables';
GO

SET ANSI_PADDING ON
GO

-- ******************************************************
-- Load data
-- ******************************************************
PRINT '';
GO

PRINT '*** Loading Data';
GO

PRINT 'Loading [dbo].[AdventureWorksDWBuildVersion]';
GO

INSERT INTO [dbo].[AdventureWorksDWBuildVersion] 
VALUES
( CONVERT(nvarchar(50), SERVERPROPERTY('ProductVersion')), CONVERT(datetime, SERVERPROPERTY('ResourceLastUpdateDateTime')));
GO

PRINT 'Loading [dbo].[DimAccount]';
GO

BULK INSERT [dbo].[DimAccount] FROM '$(SqlSamplesSourceDataPath)DimAccount.csv'
WITH (
    CHECK_CONSTRAINTS,
   -- CODEPAGE='ACP',
    DATAFILETYPE = 'widechar',
    FIELDTERMINATOR= '|',
    ROWTERMINATOR = '\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[DimCurrency]';
GO

BULK INSERT [dbo].[DimCurrency] FROM '$(SqlSamplesSourceDataPath)DimCurrency.csv'
WITH (
    CHECK_CONSTRAINTS,
   -- CODEPAGE='ACP',
    DATAFILETYPE = 'widechar',
    FIELDTERMINATOR= '|',
    ROWTERMINATOR = '\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[DimCustomer]';
GO

BULK INSERT[dbo].[DimCustomer] FROM '$(SqlSamplesSourceDataPath)DimCustomer.csv'
WITH (
    CHECK_CONSTRAINTS,
   -- CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[DimDate]';
GO

BULK INSERT [dbo].[DimDate] FROM '$(SqlSamplesSourceDataPath)DimDate.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[DimDepartmentGroup]';
GO

BULK INSERT [dbo].[DimDepartmentGroup] FROM '$(SqlSamplesSourceDataPath)DimDepartmentGroup.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[DimEmployee]';
GO

BULK INSERT [dbo].[DimEmployee] FROM '$(SqlSamplesSourceDataPath)DimEmployee.csv'
WITH (
    CHECK_CONSTRAINTS,
   -- CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[DimGeography]';
GO

BULK INSERT [dbo].[DimGeography] FROM '$(SqlSamplesSourceDataPath)DimGeography.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[DimOrganization]';
GO

BULK INSERT [dbo].[DimOrganization] FROM '$(SqlSamplesSourceDataPath)DimOrganization.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[DimProduct]';
GO

BULK INSERT [dbo].[DimProduct] FROM '$(SqlSamplesSourceDataPath)DimProduct.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[DimProductCategory]';
GO

BULK INSERT [dbo].[DimProductCategory] FROM '$(SqlSamplesSourceDataPath)DimProductCategory.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[DimProductSubcategory]';
GO

BULK INSERT [dbo].[DimProductSubcategory] FROM '$(SqlSamplesSourceDataPath)DimProductSubcategory.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[DimPromotion]';
GO

BULK INSERT [dbo].[DimPromotion] FROM '$(SqlSamplesSourceDataPath)DimPromotion.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[DimReseller]';
GO

BULK INSERT [dbo].[DimReseller] FROM '$(SqlSamplesSourceDataPath)DimReseller.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[DimSalesReason]';
GO

BULK INSERT [dbo].[DimSalesReason] FROM '$(SqlSamplesSourceDataPath)DimSalesReason.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[DimSalesTerritory]';
GO

BULK INSERT [dbo].[DimSalesTerritory] FROM '$(SqlSamplesSourceDataPath)DimSalesTerritory.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[DimScenario]';
GO

BULK INSERT [dbo].[DimScenario] FROM '$(SqlSamplesSourceDataPath)DimScenario.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[FactAdditionalInternationalProductDescription]';
GO

BULK INSERT [dbo].[FactAdditionalInternationalProductDescription] FROM '$(SqlSamplesSourceDataPath)FactAdditionalInternationalProductDescription.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[FactCallCenter]';
GO

BULK INSERT [dbo].[FactCallCenter] FROM '$(SqlSamplesSourceDataPath)FactCallCenter.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[FactCurrencyRate]';
GO

BULK INSERT [dbo].[FactCurrencyRate] FROM '$(SqlSamplesSourceDataPath)FactCurrencyRate.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[FactFinance]';
GO

BULK INSERT [dbo].[FactFinance] FROM '$(SqlSamplesSourceDataPath)FactFinance.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[FactInternetSales]';
GO

BULK INSERT [dbo].[FactInternetSales] FROM '$(SqlSamplesSourceDataPath)FactInternetSales.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[FactInternetSalesReason] ';
GO

BULK INSERT [dbo].[FactInternetSalesReason] FROM '$(SqlSamplesSourceDataPath)FactInternetSalesReason.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[FactProductInventory]';
GO

BULK INSERT [dbo].[FactProductInventory] FROM '$(SqlSamplesSourceDataPath)FactProductInventory.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[FactResellerSales]';
GO

BULK INSERT [dbo].[FactResellerSales] FROM '$(SqlSamplesSourceDataPath)FactResellerSales.csv'
WITH (
    CHECK_CONSTRAINTS,
    --ODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[FactSalesQuota]';
GO

BULK INSERT [dbo].[FactSalesQuota] FROM '$(SqlSamplesSourceDataPath)FactSalesQuota.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[FactSurveyResponse]';
GO

BULK INSERT [dbo].[FactSurveyResponse] FROM '$(SqlSamplesSourceDataPath)FactSurveyResponse.csv'
WITH (
    CHECK_CONSTRAINTS,
   -- CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[NewFactCurrencyRate]';
GO

BULK INSERT [dbo].[NewFactCurrencyRate] FROM '$(SqlSamplesSourceDataPath)NewFactCurrencyRate.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[ProspectiveBuyer]';
GO

BULK INSERT [dbo].[ProspectiveBuyer] FROM '$(SqlSamplesSourceDataPath)ProspectiveBuyer.csv'
WITH (
    CHECK_CONSTRAINTS,
    CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

PRINT 'Loading [dbo].[sysdiagrams]';
GO

BULK INSERT [dbo].[sysdiagrams] FROM '$(SqlSamplesSourceDataPath)sysdiagrams.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='widechar',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);
GO

-- ******************************************************
-- Add Primary Keys
-- ******************************************************
PRINT '';
GO

PRINT '*** Adding Primary Keys';
GO

SET QUOTED_IDENTIFIER ON;
GO

-- ******************************************************
-- Add Indexes
-- ******************************************************
PRINT '';
GO

PRINT '*** Adding Indexes';
GO

-- ****************************************
-- Create Foreign key constraints
-- ****************************************
PRINT '';
GO

PRINT '*** Creating Foreign Key Constraints';
GO

-- ******************************************************
-- Add database views.
-- ******************************************************
PRINT '';
GO

PRINT '*** Creating Table Views';
GO

/****** Object:  View [dbo].[vTimeSeries]    Script Date: 7/8/2016 3:09:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[vTargetMail]    Script Date: 7/8/2016 3:09:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[vAssocSeqOrders]    Script Date: 7/8/2016 3:09:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[vAssocSeqLineItems]    Script Date: 7/8/2016 3:09:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- ****************************************
-- Drop DDL Trigger for Database
-- ****************************************
PRINT '';
GO

PRINT '*** Disabling DDL Trigger for Database';
GO

USE [master];
GO

PRINT 'Finished - ' + CONVERT(varchar, GETDATE(), 121);
GO

SET NOEXEC OFF
GO

/*============================================================================
  File:     instawdb.sql

  Summary:  Creates the AdventureWorksDW sample database. Run this on
  any version of SQL Server (2008R2 or later) to get AdventureWorksDW for your
  current version.  

  Date:     October 26, 2017
  Updated:  October 26, 2017

------------------------------------------------------------------------------
  This file is part of the Microsoft SQL Server Code Samples.

  Copyright (C) Microsoft Corporation.  All rights reserved.

  This source code is intended only as a supplement to Microsoft
  Development Tools and/or on-line documentation.  See these other
  materials for detailed information regarding Microsoft code samples.

  All data in this database is ficticious.
  
  THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
  KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
  PARTICULAR PURPOSE.
============================================================================*/

/*
 * HOW TO RUN THIS SCRIPT:
 *
 * 1. Enable full-text search on your SQL Server instance. 
 *
 * 2. Open the script inside SQL Server Management Studio and enable SQLCMD mode. 
 *    This option is in the Query menu.
 *
 * 3. Copy this script and the install files to C:\Samples\AdventureWorksDW, or
 *    set the following environment variable to your own data path.
 */
 :setvar SqlSamplesSourceDataPath "F:\repos\Learning\AdventureWorksDW-data-warehouse-install-script\"

/*
 * 4. Append the SQL Server version number to database name if you want to
 *    differentiate it from other installs of AdventureWorksDW
 */

:setvar DatabaseName "AdventureWorksDW"

/* Execute the script
 */

IF '$(SqlSamplesSourceDataPath)' IS NULL OR '$(SqlSamplesSourceDataPath)' = ''
BEGIN
	RAISERROR(N'The variable SqlSamplesSourceDataPath must be defined.', 16, 127) WITH NOWAIT
	RETURN
END;


SET NOCOUNT OFF;

GO

--Syntax Error: Incorrect syntax near :.
--/*============================================================================
--  File:     instawdb.sql
--
--  Summary:  Creates the AdventureWorksDW sample database. Run this on
--  any version of SQL Server (2008R2 or later) to get AdventureWorksDW for your
--  current version.  
--
--  Date:     October 26, 2017
--  Updated:  October 26, 2017
--
--------------------------------------------------------------------------------
--  This file is part of the Microsoft SQL Server Code Samples.
--
--  Copyright (C) Microsoft Corporation.  All rights reserved.
--
--  This source code is intended only as a supplement to Microsoft
--  Development Tools and/or on-line documentation.  See these other
--  materials for detailed information regarding Microsoft code samples.
--
--  All data in this database is ficticious.
--  
--  THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
--  KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
--  IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
--  PARTICULAR PURPOSE.
--============================================================================*/
--
--/*
-- * HOW TO RUN THIS SCRIPT:
-- *
-- * 1. Enable full-text search on your SQL Server instance. 
-- *
-- * 2. Open the script inside SQL Server Management Studio and enable SQLCMD mode. 
-- *    This option is in the Query menu.
-- *
-- * 3. Copy this script and the install files to C:\Samples\AdventureWorksDW, or
-- *    set the following environment variable to your own data path.
-- */
-- :setvar SqlSamplesSourceDataPath "F:\repos\Learning\AdventureWorksDW-data-warehouse-install-script\"
--
--/*
-- * 4. Append the SQL Server version number to database name if you want to
-- *    differentiate it from other installs of AdventureWorksDW
-- */
--
--:setvar DatabaseName "AdventureWorksDW"
--
--/* Execute the script
-- */
--
--IF '$(SqlSamplesSourceDataPath)' IS NULL OR '$(SqlSamplesSourceDataPath)' = ''
--BEGIN
--	RAISERROR(N'The variable SqlSamplesSourceDataPath must be defined.', 16, 127) WITH NOWAIT
--	RETURN
--END;
--
--
--SET NOCOUNT OFF;

GO

--Syntax Error: Incorrect syntax near $(DatabaseName).
--IF EXISTS (SELECT [name] FROM [master].[sys].[databases] WHERE [name] = N'$(DatabaseName)')
--    DROP DATABASE $(DatabaseName);
--
---- If the database has any other open connections close the network connection.

GO


CREATE DATABASE $(DatabaseName);

GO

--Syntax Error: Incorrect syntax near $(DatabaseName).
--
--CREATE DATABASE $(DatabaseName);

GO


USE $(DatabaseName);

GO

--Syntax Error: Incorrect syntax near USE.
--
--USE $(DatabaseName);



GO
