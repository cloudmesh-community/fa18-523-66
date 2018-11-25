# SAS Viya  :smiley: fa18-523-66 

| Ritu Susan Sanjay

| rssanjay@iu.edu

| Indiana University, Bloomington

| hid : fa18-523-66

| github: [:cloud:](https://github.com/cloudmesh-community/fa18-523-66/blob/master/paper/paper.md)


---

Keywords: SAS Viya, Data Mining, Cloud Analytic Services, Analytics

---

## Introduction

SAS Viya is an in-memory analytics engine, with cloud enables features, providing users with accurate, quick and most importantly reliable insights. The software provides features like authorship, full-versioning, change management and  a lineage viewer along with centralized admiistration enabling tracking of users, servers and job content. [@doc-sas-viya-3.4]

The demand for data scientists is at an all time high. At the simplest level, it is the art of making sense from the never-ending sea of data - simple as that. To better unserstand this, we can think of developing a data mining model analogous to making a dish. You first scrape together the ingredients; this is our raw data. To improve the taste, you add a pinch of salt and other seasonings or spices; this is the creation of new predictor variables. Finally, you mix it all up together, and have  a taste. If it doesn't taste right, you might want to try a couple of other methods until you've perfected the recipe; analogy here referring to iteratively building descriptive (unsupervised) or predictive (supervised) models. And just like in the show Master Chef you often end up competing with other data scientists in developing the best possible recipe, or in this case the best model. [@article-SASViya-Special-Collection-5]

In the above example, just as how the chef needs his sharp knives, a data scientist needs the right tool. The top rated software being python, spark, R, Matlab to name a few. SAS Viya is the latest enhancement of the SAS platform. In the words of its developers:

> "SAS Viya addresses the complex analytical challenges of today, and effortlessly scales to meet your future needs, with cloud-enabled, > elastic in-memory processing, in a high availability, multi-user environment. It is designed to address the new, and increasingly diverse, needs of organizations with methods, access, and deployment that scale to meet burgeoning analytics use cases" [@article-SASViya-Special-Collection-5].

SAS 9 brought with it a user-friendly server-client web service model, all processes goverened by a resilient metadata server. It was one of the more popular platform for analytics, albeit a bit expensive, and hence was usually preferred by organizations willing to invest in analytic platforms rather than self-financed analysts. However, the advent of cloud computing blew the whole tech industry out of proportion. 

> "SAS Viya brings a more resilient, elastic, unified, and accessible architecture, which leverages cloud-friendly microservices and a 
>  next generation analytics run-time engine" [@article-SASViya-Special-Collection-1]. 

SAS Viya enables users to explore data deeper, using the latest innovations in in-memory analytics. The methods available to users is classified in two: Data Wrangling methods and Modeling methods. Data wrangling methods include binning, transformations, SQL, clustering etc., while modelling techniques include everything from regression to text mining to neural networks. One of the prime features of using SAS for these methods is its innate ability to run all above-mentioned methods in-memory and of course take advantage of the parallel processing infrastructure [@article-SASViya-Special-Collection-4].

SAS Viya emphasises a unified experience for data scientists and analysts alike. The new cloud analytical platform, allows programmers to execute using open-source laguages like Python, Java, and Lua. Furthermore, the platform also allows these codes to be written and executed on Jupyter notebooks [@article-SASViya-Special-Collection-3]. 
+@fig:SASPlatform shows a detailed view of the SAS Viya 3.4 architecture.

![SAS Platform [@image-sasPlatform]](images/SASViya_ExtensionOfSASPlatform.JPG){#fig:SASPlatform}


## SAS Viya Components

SAS Viya 3.4 gives data scientists access to the following components:

### SAS Cloud Analytic Services:

> "CAS goals are to provide an analytics service with a public API accessible by many clients supported by SAS or open-source clients 
> using plug-in modules from SAS. [@article-SAS-CAS-10to18]"

SAS CAS is a platform for distributed and high-performance computing with a cloud-based RE. The many features of CAS include data sharing between sessions, security, and fault tolerance (i.e. allowing a node to fail without data loss). CAS was designed to operate fully on-cloud, either as a single host or on a cluster (private or public). CAS uses sessions to track users and offers a full Security interface to protect data at the file level, as well as the column level. The sessions provide isolation for the user, which protects 
the integrity of the server.The purpose of connecting to CAS is to execute server requests. A user must create a session to submit a request. The user can connect to the server either through a HTTP_based REST interface or through a ProtoBUF-based binary interface. The user must be authenticated by CAS in order to a create session [@article-SAS-CAS-1to3].

The most import aspect of CAS is that all data is stored in the form of tables. These tables may be streamed from a  database into the server , ESP stream or loaded from disk. Data (including metadata) in CAS is all stored and accessed through the CASLIB. The caslib is basically a container that usually has one or more instances of the CAS tables [@article-SAS-CAS-4to9].

Like all cloud services, SAS Viya too concentrates on fault tolerance. Node failure is inevitable when dealing with multiple number of nodes are implemented in a system. Data is replicated across the cluster, in order to retrieve data in case one of the worker nodes fail. The new system has been dubbed the GCCOMM. The subsystem can detect failure in nodes; the controllers and workers can  reconfigure the system, thus restarting the action and allowing the remaining worker nodes to access lost data from the redundant blocks [@article-SAS-CAS-4to9].

### SAS Studio:
In the simplest of words, SAS Studio is an editor designed for both expert and novice programmers to write and execute SAS code in an assisted environment. Users are provided with a single interface to access all data files, programs and libraries (user-defined and in-built). The SAS studio is extremely convinient: there is no local installation involved i.e. once the software is installed you just provide the users with the url to access the software. This centralizes and simplifies regular maintenance. Other features range from
(data) table analyzer, sql engine, code snippet library prompts from frequently executed codes, report generation and export in multiple formats including pdf and xml. One important feature to be noted is that the studio interface is consistant, regardless of where and how the software runs; as the IT infrasturcture is modified, the SAS Studio environment is the same [@manual-SAS-Studio].

### SAS Visual Analytics:
> "SAS Visual Analytics provides a complete platform for analytics visualization and interactive selfservice BI and reporting 
> capabilities are combined with out-of-the-box advanced analytics to enable users to  discover insights from any size and type of data > including text" [@manual-SAS-Visual-Analytics].

Popular analytic tools include - goal seeking and scenario analysis, automated forecasting, decision trees, text analytics and network diagrams. [@manual-SAS-Visual-Analytics]

### SAS Visual Statistics:
> "It provides a drag-and-drop web browser interface that empowers multiple users to explore massive data, and then interactively and 
> iteratively create descriptive and predictive models" [@manual-SAS-Visual-Statistics].

Statisticians are most often faced with the challenge of vhoosing the right model that fits the data. As the amont of data to be analyzed keeps increasing, this can prove to be a very time-consuming task. SAS Visual Statistics allows users to generate reports that detail model comparision summaries, misclassification tables and ROC charts. The software includes an interactive slider that manipulates thresholds preset by the user [@manual-SAS-Visual-Statistics].

### SAS Visual Data Mining and Machine Learning:
> "In addition to innovative machine learning and deep learning techniques for analyzing structured and unstructured data, it integrates > all other tasks in your analytical processes. From data preparation and exploration to model development and deployment, multiple 
> personas work in the same, integrated environment" [@manual-SAS-Visual-DM-ML].

The software allows multiple users to concurrently analyze data (structured or unstructured) with the Model Studio. Every project can be subdidvided using visual pipelines, displayed in a logical sequence. The SAS Visual Data Mining and Machine Learning boasts of a significantly reduced runtime, owing to the multicore architecture. Popular models included in the software are:
gradient boosting, SVMs, neural networks, Gausian models, bayesian networks among others [@manual-SAS-Visual-DM-ML].

### SAS Econometrics:
> "SAS Econometrics supports a range of econometric model types with a single framework. It’s fully integrated with all of the 
> contributing analytics that coincide with econometrics, and with data preparation, exploration, presentation and reporting 
> capabilities in SAS that are essential to successful econometric analysis" [@manual-SAS-Econometrics].

The in-memory analytics feature of SAS Viya ensures that iterative and repetitive tasks can be run quickly without re-loading data. The software also provides a wide-range of tools for modelling business scenarios. Simulations and forecasting techniques can be easily implemented as the software makes use of the SAS VIya Engine, ensuring high-availability and the ability to code using open-source languages [@manual-SAS-Econometrics].

### SAS Visual Forecasting:
> "SAS Visual Forecasting provides a resilient, distributed and optimized generic time series analysis scripting environment for cloud 
> computing" [@manual-SAS-Visual-Forecasting].

> "Users can range from analysts responsible for the creation of the forecasts to the managers and directors responsible for overseeing > the forecasting and planning processes" [@manual-SAS-Visual-Forecasting].

The software itself recommends the most suitable model and additionally models are selected based not on how well they fit past data but on how well they can be used to predict the future. The interface allows for training and modelling data mining algorithms including neural networks. For example, the Multstage Forecasting node (for regression and time series included) creates a forecast combining signals obtained from different models [@manual-SAS-Visual-Forecasting].

### SAS Visual Text Analytics:
SAS Visual Text Analytics seeks to bring together concepts of NLP [@www-Natural-Language-Processing] along with machine learning and data mining techniques to derive insights from unstructured data. The accuracy of an analytical model may be increased by utilizing a combination of machine learning techniques and rule-based approaches. Users also have the ability to build their own custom search engine, provided by microservice architecture and built in APIs. The text-analytics pipeline makes available five types of nodes : Text Parsing, Concepts, Catagories, Sentiment and Topics. The software also features automatic extraction of features identified by topics generated by the machine. [@manual-SAS-Visual-Text-Analytics]

### SAS Optimization:
SAS Optimization was designed for industry experts who utilize operations research and optimization techniques to create decision-making models to solve problems. 

>"SAS Optimization provides a powerful, intuitive algebraic optimization modeling language and an array of algorithms. This involves a 
> range of models, including linear, mixed-integer linear, nonlinear, quadratic, and network optimization, as well as solve constraint 
> satisfaction problems." [@manual-SAS-Optimization]

Models are executed efficiently since the software runs on the Viya Engine. Notable models on the SAS Optimization are : Local Search Optimization, Constraint Programming, Multistart Algorithm and the Decomposition Algorithm.

## Deployment

> "SAS Viya has undergone rigorous performance testing with various hardware combinations. In addition to being tested on high-
> performing Intel Xeon E3-E7 series microprocessors, SAS Viya has also been tested with newer Intel chips, such as Intel Xeon Scalable > Processors. SAS Viya also supports 64-bit AMD chipsets (thirty-two-bit chipsets are not supported)" [@manual-viya-deployment-guide-6to8].

It is necessary to note that a seperete independent host is needed if SAS 9.4 exists on the system (co-installation is not possible). Also, if the existing SAS software on the system is SAS 9.3, note that many of the features on SAS 9.3 are not supported if the Java version has been updated to Java 8 or plus. The hardware requirements for a programming only environment also differs from a full deployment.

### System Requirements:
 
It is first necessary to understand the difference beyween the two deployment types: full deployment and programming-only deployment. The full deployment includes all the features SAS Viya has to offer and is usually the default mode. However, it is also possible to deploy only a subset of the features; the programming-only deployment excludes the SAS Drive and a number of the graphical features [@www-deployment-difference]. The hardware requirements for a programming only and a full deployment differ. When determining the specifications of the host, three components are to be kept in mind: CAS server,programming runtime and the service layer [@manual-viya-deployment-guide-6to8].

 1) CAS Server : "The amount of RAM that is required for the CAS Server is determined by the amount of data that is processed, and by the level of user activity in the environment. However, out of the box, the amount of RAM that is required to start the CAS Server is less than 1 GB" [@manual-viya-deployment-guide-6to8].

 2) Programming Runtime : "The number of CPU cores that are required for the Programming Runtime depends on your specific license. If your CAS license is for N cores, you are also entitled to run the Programming Runtime on the samenumber of cores. However, the minimum requirement is 2 cores. SAS recommends that you allocate at least 4 cores for optimal performance. The minimum required amount of RAM for the Programming Runtime is 4 GB" [@manual-viya-deployment-guide-6to8].

 3) Service Layer : "This category consists of components that are required for a full deployment, as well as services that support specific SAS products. They include the Core Services host  group and all the other services that support SAS Viya analytics processing"  [@manual-viya-deployment-guide-6to8].

### Installation:

The first step in the installation involves setting up the accounts. The user account for both the CAS as well as the postgreSQL requires the SAS credentials to be specified. Instructions on how to set this up is extensively detailed in the setup manual (the link to the latest version of the same is provided at the end of this section). If the user seeks to set up the full deployment, then changes may be made to modify the postgreSQL settings to specify personal ports and directories. Further to this, the CAS Server Monitor port may also be changed along with modifications to the kerberos [@www-kerberos] settings. The final step after the configuration files have been modified is to simply run the SAS Viya setup batch file through the command prompt folling the regular intructions [@manual-viya-deployment-guide-29to37].

After completing the installation of SAS Viya,it is necessary to configure the connection to your identity provider before your users can access SAS Environment Manager and SAS Visual Analytics. The final step then remains to create a backup configuration [@manual-viya-deployment-guide-39to50]. Note that this is also different depending on the type of deployment (i.e. programming-only or full deployment). 

The latest version of the deployment guide may be accessed at : SAS Viya Deployment Guide [:cloud:](https://support.sas.com/en/documentation/install-center/viya/deployment-guides.html)

## Sample Illustration

This section consists of an example detailing how easy it is to create a model in SAS Viya. For the example, we consider a dataset consisting of the political opinion poll from the Annual National Election Survey, consucted once every four years. Thermometer measures are used in many surveys to rank opinions. These variables range from 0 (very cold, or unfavorable feeling) to 100 (very warm, favorable feeling). This example examines the multivariate relationship of the preference for the Democratic variable against current economy condition, religious attendence and how better off the respondant is compared to the previous year.

Step 1: Start up the SAS Viya Service

SAS Viya starts up with a user friendly interface. The left panel details all about the data and the models that may be created and executed using the engine. While the right panel houses options for modifying or altering data variables and adjusting model parameters.
+@fig:StartPage shows a screenshot of the start menu.

![SAS Viya Start Page [@image-viyaStartpage]](images/SASViya_startpage.JPG){#fig:StartPage}


Step 2: Import data

+@fig:ImportData shows how datasets may be imported onto the SAS library.

![SAS Viya Import Data [@image-viyaImportData]](images/sasViya_importData.JPG){#fig:ImportData}

Step 3: Add model object i.e. linear regression object

To create a linear regression model, all you have to so is drag and drop the desired object into the analysis screen.
+@fig:ModelObject demonstrates how a model may be added.

![SAS Viya Add Data Object [@image-viyaAddDataObject]](images/sasViya_addObject.JPG){#fig:ModelObject}

Step 4: Specify roles on the right options panel

+@fig:SpecifyRoles demnstrates how roles and rules may be applied to the model.

![SAS Viya Add Variable Roles [@image-viyaAddVarRoles]](images/sasViya_addRoles.JPG){#fig:SpecifyRoles}

Step 5: Modify parameters if necessary to improve model

The model can then be interpreted using measures like the adjusted r-square, that predicts approximately 21.5% of the variation in the variable. Looking at other measures like the F-statistic (very high) and p-value (very low)  implies that the model is statistically significant.
+@fig:Results displays the final result.

![Linear Regression Results [@image-LinRegRes]](images/LinearRegResults.JPG){#fig:Results}

## Conclusion

"Data is no longer considered to be static or stale" [@book-big-data-schonberger-pg5].

Today data is the raw material generated and consumed by businesses, governments and scientific researchers. Given the right tools and the computing power, data can open up a whole new world of insights. The new cloud-based analytic software offered by SAS helps create well-defined models and generate results, giving way to new ideas.  However, SAS Viya is just one of the many tools among thousands offered today and choosing the right tool depends on the users' goals.
