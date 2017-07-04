# Connect to WRDS (assumes ~/.Rprofile and ~/.Renviron are properly configured)
wrds <- wrdsconnect(user=user, pass=pass)

# Pulls list of all libraries in WRDS
res1 <- dbSendQuery(wrds, "select distinct libname from dictionary.tables")
data1 <- fetch(res1, n = -1) #n=-1 fetches all data
data1

# Should pull the databases within a given library (CRSP), but doesn't seem to be working
res2 <- dbSendQuery(wrds, "select distinct memname from dictionary.columns where libname='CRSP'")
data2 <- fetch(res2, n = -1)
data2

# Obtains variables from a database (DSF) within a library (CRSP)
res3 <- dbSendQuery(wrds, "select name from dictionary.columns where libname='CRSP' and memname='DSF'")
data3 <- fetch(res3, n = -1)
data3

# Pulls all variables from a database (DSF) within a library (CRSP), limited to 10 observations
res4 <- dbSendQuery(wrds, "select * from CRSP.DSF (obs=10)")
data4 <- fetch(res4, n = -1)
data4

# Pulls a subset of variables from a database (DSF) within a library (CRSP), limited to 10 observations
res5 <- dbSendQuery(wrds, "select cusip,permno,date,bidlo,askhi from CRSP.DSF (obs=10)")
data5 <- fetch(res5, n = -1)
data5

# Refines previous query (can't seem to run on my machine without RStudio crashing)
res6 <- dbSendQuery(wrds, "select cusip,permno,date,bidlo,askhi from CRSP.DSF where askhi > 2500 and bidlo < 2000")
data6 <- fetch(res6, n = -1)
data6

# Refines previous query to pull variables for a specific trading day
res7 <- dbSendQuery(wrds, "select cusip,permno,date,bidlo,askhi from CRSP.DSF where date = '04jan2013'd")
data7 <- fetch(res7, n = -1)
data7

# Refines previous query to pull variables for a date range
res8 <- dbSendQuery(wrds, "select cusip,permno,date,bidlo,askhi from CRSP.DSF where date between '07jan2013'd and '08jan2013'd")
data8 <- fetch(res8, n = -1)
data8