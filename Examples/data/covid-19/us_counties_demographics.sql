SELECT a.fips, b.fips as covid_fips, a.STNAME,	a.CTYNAME 
FROM us_census_fips as a
left join 
(select distinct bb.fips from covid_19.us_counties as bb) as b on a.fips = b.fips
order by a.fips;