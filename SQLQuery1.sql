SELECT  * FROM [dbo].[dimPatient]

SELECT top 10 * FROM dbo.dimPatient
SELECT DISTINCT City FROM dbo.dimPatient

SELECT DISTINCT FirstName FROM dbo.dimPatient
WHERE FirstName like 'le%'

SELECT count(*) as 'total mich'
From dbo.dimPatient
WHERE PatientAge<=30 and FirstName like'Mich%'


SELECT pat.dimPatientPK, pat.FirstName, pat.LastName, pat.PatientAge,
loc.dimLocationPK, loc.LocationName,
dat.dimDatePostPK, dat.DATE
FROM Facttable as fact
LEFT join dimPatient as pat
on fact.dimPatientPK = pat.dimPatientPK
join dimLocation as loc
on fact.dimLocationPK = loc.dimLocationPK
join dimDate as dat
on fact.dimDatePostPK= dat.dimDatePostPK;

SELECT p.ProviderName,p.ProviderSpecialty, p.ProviderFTE, Fact.GrossCharge
from FactTable as fact
join dimPhysician as p
on fact.dimPhysicianPK=p.dimPhysicianPK

select count(*) as nmbre_lignes
from FactTable
where GrossCharge> 100;

select count(distinct PatientNumber)
from dimPatient;

select CptGrouping,count( distinct CptCode ) as nbre_code
from dimCptCode
group by CptGrouping
order by nbre_code desc;

select  count( distinct fact.dimPhysicianPK) as nbre_medicare
from  FactTable as fact
join dimPayer as pa
on fact.dimPayerPK=pa.dimPayerPK
where  pa.PayerName = 'Medicare'

SELECT pa.PayerName, COUNT(*) AS Total
FROM FactTable fact
JOIN dimPayer pa
    ON fact.dimPayerPK = pa.dimPayerPK
WHERE pa.PayerName = 'Medicare'
GROUP BY pa.PayerName;













