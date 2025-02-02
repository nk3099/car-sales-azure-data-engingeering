# car-sales-azure-data-engingeering

> This project is to analyze Olympic data using various tools and technologies, including Azure Data Factory, Data Lake Gen 2, Synapse Analytics, and Azure Databricks.

# Table of Contents
- [Overview of the Design](#overview-of-the-design)
- [Dataset](#Dataset)
- [Tech Stack](#Tech-Stack)
- [Setting the workspace](#setting-the-workspace)
- [Azure Services](#Azure-Services)
- [Databricks-backed secret scope](#Databricks-backed-secret-scope)


# <a name="overview-of-the-design"></a> Overview of the Design
![Architecture_Design]()

# <a name="Dataset"></a>Dataset
For this project, we are going to use the following dataset : [Car Sales - Sample Dataset](https://tableauserverguru.wordpress.com/sample-data-sets/) 

We are considering following CSV data within the [raw-data](https://github.com/nk3099/car-sales-azure-data-engingeering/tree/main/raw-data) folder:
- [IncrementalSales.csv](https://github.com/nk3099/car-sales-azure-data-engingeering/blob/main/raw-data/IncrementalSales.csv)
- [SalesData.csv](https://github.com/nk3099/car-sales-azure-data-engingeering/blob/main/raw-data/SalesData.csv)

# <a name="Tech-Stack"></a>Tech Stack
- PySpark
- SQL
- Azure
- Databricks

# <a name="setting-the-workspace"></a> Setting the workspace
![setting_workspace](https://github.com/user-attachments/assets/2941ea54-9abe-4157-9021-6e76d4d2ed88)


# <a name="azure-services"></a> Azure Services:
**Data Factory:** 
```
Data integration service that enables you to create, schedule, and manage data pipelines for efficient data movement and transformation between various sources and destinations in Azure and beyond. It simplifies ETL (Extract, Transform, Load) and data integration tasks.
```
![adf](https://github.com/user-attachments/assets/a8753d91-21ff-446a-ae46-cbd2c5b2ffdf)



**Data Lake Gen 2:** 
```
Data lake solution that combines the capabilities of a data lake with the power of Azure Blob Storage, allowing you to store and analyze large volumes of structured and unstructured data with enhanced performance, security, and analytics capabilities.
```
parisolympic (ADLS gen2) : Containers > paris-olympic-data >
```
1.raw-data
 - athletes.csv
 - coaches.csv
 - medals.csv
 - teams.csv
   
2.transformed-data
 - athletes > (Patitioned csv file)
 - coaches > (Patitioned csv file)
 - medals > part-00000-tid-2301537820015857710-f4df93dd-dc2f-4969-a478-2255936842a0-40-1-c000.csv (Patitioned csv file)
 - teams > (Patitioned csv file)
```
   
![adls](https://github.com/user-attachments/assets/71a6ecdd-c215-44c7-b5d5-fa7b7a6e0933)

**Azure Databricks:**
```
Databricks is a unified analytics platform built on top of Apache Spark, designed to help data engineers and data scientists collaborate on big data processing and machine learning tasks. It provides tools for data exploration, data processing, and building machine learning models in a collaborative and scalable environment.
```

**Synapse Analytics:**
```
SQL Data Warehouse, is a cloud-based analytics service provided by Microsoft Azure. It combines big data and data warehousing into a single integrated platform, allowing organizations to analyze and process large volumes of data for business intelligence and data analytics purposes.
```

![synapse-sql](https://github.com/user-attachments/assets/03b180c1-7f48-4784-a722-3898ed98946d)



# <a name="databricks-backed-secret-scope"></a> Databricks-backed secret scope
A Databricks-backed secret scope is stored in (backed by) an encrypted database owned and managed by Azure Databricks.

![paris-olympic-scopes](https://github.com/user-attachments/assets/aac172ae-657e-4d6b-b97b-8bf102417ddb) 

![databricks-scope](https://github.com/user-attachments/assets/339d0767-54b9-4b0f-a2fb-da3e87aec26e)


## Steps:

1.Install Databricks CLI and configure with your workspace. \
```
1.pip install databricks-cli
2.databricsk configure --help
3.databricks configure --token
4.Go to C:\Users\.databrickscg (databricks configuration file) and make sure host_url and token is pasted correctly.
```

![configure-databricks-cli](https://github.com/user-attachments/assets/cbacaebb-6e2b-4f19-8365-79c98289193a)


2.Creating databricks-backed secret scope commands:
```
1.databricks secrets create-scope --scope <scope-name> --initial-manage-principal users
2.databricks secret put --scope <scope-name> --key <key-name>
3.databricks secrets list --scope <scope-name>
4.databricks secrets delete-scope --scope <scope-name>
```
![scopes](https://github.com/user-attachments/assets/03580fcb-e38c-4fe4-8ef0-861595a1f8da)


