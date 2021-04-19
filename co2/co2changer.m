lon = ncread('co2_data.nc','lon');
lonb = ncread('co2_data.nc','lonb');
lat = ncread('co2_data.nc','lat');
latb = ncread('co2_data.nc','latb');
time = ncread('co2_data.nc','time');
co2 = ncread('co2_data.nc','co2');

co2 = co2*4;

ncwrite('co2_data.nc','co2',co2)
co2_new = ncread('co2_data.nc','co2');