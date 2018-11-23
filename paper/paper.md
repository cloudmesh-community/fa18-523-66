# SAS Viya  :wave: :exclamation: fa18-523-66

| Ritu Susan Sanjay
| rssanjay@iu.edu
| Indiana University, Bloomington
| hid : fa18-523-66
| github: [:cloud:](https://github.com/cloudmesh-community/fa18-523-66/blob/master/paper/paper.md)

* :o: this is incomplete and we could not complet eour review due to that reason

* :o: abstract needs to be merged into introduction, paper is to short to justify abstract

* :o: conclusion needs to be merged into introduction, paper is to short to justify abstract

* :o: please use proper itemized and numbered list, pleas look at markdown guides.


---

Keywords: SAS Viya, Data Mining, Cloud Analytic Services

---

## Abstract

:o: there is no need to provide a general introdcution to data sciene, what we want you to focus on is the technology we picked. Pleas remember that is how we started the summaries. They essentially are like the introduction ....
Also the rest of the papr seems incomplete

Data Science - quite  a difficult term to technically define. However, the demand for data scientists is at an all time high. At the simplest level, it is the art of making sense from the never-ending sea of data - simple as that. To better unserstand this, we can think of developing a data mining model analogous to making a dish. You first scrape together the ingredients; this is our raw data. To improve the taste, you add a pinch of salt and other seasonings or spices; this is the creation of new predictor variables. Finally, you mix it all up together, and have  a taste. If it doesn't taste right, you might want to try a couple of other methods until you've perfected the recipe; analogy here referring to iteratively building descriptive (unsupervised) or predictive (supervised) models. And just like in the show Master Chef you often end up competing with other data scientists in developing the best possible recipe, or in this case the best model [@fa18-523-66-Discovering-datascience].

In the above example, just as how the chef needs his sharp knives, a data scientist needs the right tool. The top rated software being python, spark, R, Matlab to name a few. SAS Viya is the latest enhancement of the SAS platform. It is designed to address the new, and increasingly diverse, needs of organizations with methods, access, and deployment that scale to meet burgeoning analytics use cases. In the words of its developers:

> "SAS Viya addresses the complex analytical challenges of today, and effortlessly scales to meet your future needs, with cloud-enabled, elastic in-memory processing, in a high availability, multi-user environment [@fa18-523-66-SASViya-Special-Collection-5]".

## Introduction

SAS 9 brought with it a brilliant 

:o: advertisement please provide the citation who said it is brilliant is it SAS that says about itself it is brilliant?

server-client web service model, all processes goverened by a resilient metadata server. It appeared to be the perfect :o:

We stopped the review here as we feel this paper is based on advertisement form SAS and maybe the wrong papers have been reviewed

platform for analytics, albeit a bit expensive. However, the advent of cloud computing blew the whole tech industry out of proportion. "SAS Viya brings a more resilient, elastic, unified, and accessible architecture, which leverages cloud-friendly microservices and a next generation analytics run-time engine [@fa18-523-66-SASViya-Special-Collection-1]". Thanks to its powerful and scalable capabilities, SAS Viya adds an additional value to the existing SAS deployment.

SAS Viya enables you to explore your data deeper, using the latest innovations in in-memory analytics. SAS is committed to delivering new, innovative data mining and machine learning algorithms that will scale to the size of your business, now and in the future". The methods available to users is classified in two: Data Wrangling methods and Modeling methods. Data wrangling methods include binning, transformations, SQL, clustering etc., while modelling techniques include everything from regression to text mining to neural networks. One of the prime features of using SAS for these methods is its innate ability to run all above-mentioned methods in-memory and of course take advantage of the parallel processing infrastructure [@fa18-523-66-SASViya-Special-Collection-4].

SAS Viya emphasises a unified experience for data scientists and analysts alike. The new cloud analytical platform, allows programmers to execute using laguages like Python, Java, and Lua. Furthermore, the platform also allows these codes to be written and executed on Jupyter notebooks. Obviously, SAS Viya offers something exciting for everyone [@fa18-523-66-SASViya-Special-Collection-3]. 

## SAS Viya Components

SAS Viya 3.4 gives data scientists access to the following components:

#### 1) SAS Cloud Analytic Services:

"CAS goals are to provide an analytics service with a public API accessible by many clients supported by SAS or open-source clients using plug-in modules from SAS. [@article-SAS-CAS-10to18]"

SAS CAS is a platform for distributed and high-performance computing with a cloud-based RE. The many features of CAS include data sharing between sessions, security, and fault tolerance (i.e. allowing a node to fail without data loss). CAS was designed to operate fully on-cloud, either as a single host or on a cluster (private or public). CAS uses sessions to track users and offers a full Security interface to protect data at the file level, as well as the column level. The sessions provide isolation for the user, which protects 
the integrity of the server.The purpose of connecting to CAS is to execute server requests. A user must create a session to submit a request. The user can connect to the server either through a HTTP_based REST interface or through a ProtoBUF-based binary interface. The user must be authenticated by CAS in order to a create session. [@article-SAS-CAS-1to3]

The most import aspect of CAS is that all data is stored in the form of tables. These tables may be streamed from a  database into the server , ESP stream or loaded from disk. Data (including metadata) in CAS is all stored and accessed through the CASLIB. The caslib is basically a container that usually has one or more instances of the CAS tables. [@article-SAS-CAS-4to9]

Like all cloud services, SAS Viya too concentrates on fault tolerance. Node failure is inevitable when dealing with multiple number of nodes are implemented in a system. Data is replicated across the cluster, in order to retrieve data in case one of the worker nodes fail. The new system has been dubbed the GCCOMM. The subsystem can detect failure in nodes; the controllers and workers can  reconfigure the system, thus restarting the action and allowing the remaining worker nodes to access lost data from the redundant blocks. [@article-SAS-CAS-4to9]

#### 2) SAS Studio:
In the simplest of words, SAS Studio is an editor designed for both expert and novice programmers to write and execute SAS code in an assisted environment. Users are provided with a single interface to access all data files, programs and libraries (user-defined and in-built). The SAS studio is extremely convinient: there is no local installation involved i.e. once the software is installed you just provide the users with the url to access the software. This centralizes and simplifies regular maintenance. Other features range from
(data) table analyzer, sql engine, code snippet library prompts from frequently executed codes, report generation and export in multiple formats including pdf and xml. One important feature to be noted is that the studio interface is consistant, regardless of where and how the software runs; as the IT infrasturcture is modified, the SAS Studio environment is the same. [@article-SAS-Studio]

#### 3) SAS Visual Analytics:

#### 4) SAS VIsual Statistics:

#### 5) SAS Visual Data Mining and Machine Learning:

#### 6) SAS Econometrics:

#### 7) SAS Visual Forecasting:
> "SAS Visual Forecasting provides a resilient, distributed and optimized generic time series analysis scripting environment for cloud 
> computing." [@article-SAS-Visual-Forecasting]

> "Users can range from analysts responsible for the creation of the forecasts to the managers and directors responsible for overseeing > the forecasting and planning processes." [@article-SAS-Visual-Forecasting]

The software itself recommends the most suitable model and additionally models are selected based not on how well they fit past data but on how well they can be used to predict the future. The interface allows for training and modelling data mining algorithms including neural networks. For example, the Multstage Forecasting node (for regression and time series included) creates a forecast combining signals obtained from different models. [@article-SAS-Visual-Forecasting]

#### 8) SAS Visual Text Analytics:
SAS Visual Text Analytics seeks to bring together concepts of NLP [@Natural Language Processing] along with machine learning and data mining techniques to derive insights from unstructured data. The accuracy of an analytical model may be increased by utilizing a combination of machine learning techniques and rule-based approaches. Users also have the ability to build their own custom search engine, provided by microservice architecture and built in APIs. The text-analytics pipeline makes available five types of nodes : Text Parsing, Concepts, Catagories, Sentiment and Topics. The software also features automatic extraction of features identified by topics generated by the machine. [@article-SAS-Visual-Text-Analytics]

#### 9) SAS Optimization:



## Deployment

SAS Viya has undergone rigorous performance testing with various hardware combinations. In addition to being tested on high-performing Intel Xeon E3-E7 series microprocessors, 
SAS Viya has also been tested with newer Intel chips, such as Intel Xeon Scalable Processors. SAS Viya also supports 64-bit AMD chipsets. Thirty-two-bit chipsets are not supported.[pg 6-8]

It is necessary to note that a seperete independent host is needed if SAS 9.4 exists on the system (co-installation is not possible). Also, if the existing SAS software on the system 
is SAS 9.3, note that many of the features on SAS 9.3 are not supported if the Java version has been updated to Java 8 or plus. The hardware requirements for a programming only environment
also differs from a full deployment.


### System Requirements:
 
It is first necessary to understand the difference beyween the two deployment types: full deployment and programming-only deployment. The full deployment includes all the features SAS Viya has to offer and is usually the default mode. However, it is also possible to deploy only a subset of the features; the programming-only deployment excludes the SAS Drive [@SAS-Drive] and a number of the graphical features [@http://documentation.sas.com/docsetId=calchkcfg&docsetTarget=n00004saschecklist0000config.htm&docsetVersion=3.4&locale=en#n00001saschecklist0000config]. The hardware requirements for a programming only and a full deployment differ. When determining the specifications of the host, three components are to be kept in mind: CAS server,programming runtime and the service layer.[pg 6-8]

 1) CAS Server : The amount of RAM that is required for the CAS Server is determined by the amount of data that is processed, and by the level of user activity in the environment. However, out of the box, the amount of RAM that is required to start the CAS Server is less than 1 GB.

 2) Programming Runtime : The number of CPU cores that are required for the Programming Runtime depends on your specific license. If your CAS license is for N cores, you are also entitled to run the Programming Runtime on the samenumber of cores. However, the minimum requirement is 2 cores. SAS recommends that you allocate at least 4 cores for optimal performance. The minimum required amount of RAM for the Programming Runtime is 4 GB.

 3) Service Layer : This category consists of components that are required for a full deployment, as well as services that support specific SAS products. They include the Core Services host  group and all the other services that support SAS Viya analytics processing.

### Installation:

The first step in the installation involves setting up the accounts. The user account for both the CAS as well as the postgreSQL requires the SAS credentials to be specified. Instructions on how to set this up is extensively detailed in the setup manual (the link to the latest version of the same is provided at the end of this section). If the user seeks to set up the full deployment, then changes may be made to modify the postgreSQL settings to specify personal ports and directories. Further to this, the CAS Server Monitor port may also be changed along with modifications to the kerberos [@kerberos] settings. The final step after the configuration files have been modified is to simply run the SAS Viya setup batch file through the command prompt folling the regular intructions. [@pg 29-37]

After completing the installation of SAS Viya,it is necessary to configure the connection to your identity provider before your users can access SAS Environment Manager and SAS Visual Analytics. The final step then remains to create a backup configuration [@pg 39-50]. Note that this is also different depending on the type of deployment (i.e. programming-only or full deployment). 

The latest version of the deployment guide may be accessed at : https://support.sas.com/en/documentation/install-center/viya/deployment-guides.html 

## Example

{// an example section detailing how the sas cloud may be used in big data analytics}

## Conclusion

TBD
{// ....conclude}
