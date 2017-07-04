#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Tue Jul  4 11:38:45 2017

@author: rayhanmomin
"""

import wrds

if __name__ == "__main__":
    # Connect to WRDS, prompts for username and password in console
    db = wrds.Connection()
    
    # Pulls list of all libraries in WRDS
    data1 = db.list_libraries()
    
    # Pulls list of databases within a given library (CRSP)
    data2 = db.list_tables(library='crsp')
    
    # Obtains variables from a database (DSF) within a library (CRSP)
    # for the first 10 observations but SAS SQL not being recognized
    data3 = db.raw_sql('select * from CRSP.DSF (obs=10)')
    
    # Pulls a subset of variables from a database (DSF) 
    # within a library (CRSP), limited to 10 observations
    # but SAS SQL not being recognized
    data4 = db.raw_sql('select cusip,permno,date,bidlo,askhi from CRSP.DSF (obs=10)')
    
    # Refines previous query (but SAS SQL query not being recognized)
    data5 = db.raw_sql("select cusip,permno,date,bidlo,askhi from CRSP.DSF where date = '04jan2013'd")
    
    # Refines previous query 
    data6 = db.raw_sql("select cusip,permno,date,bidlo,askhi from CRSP.DSF where askhi > 2500 and bidlo < 2000")