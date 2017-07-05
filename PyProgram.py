import wrds
result = wrds.sql('select distinct permno from CRSP.DSF where askhi > 175000')
print(result.to_string())
