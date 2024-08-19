
with NoNull as (
select Date,Time,Day,Station,Min_Delay,Min_Gap,Bound,Line,Vehicle,a.Code, b.Code_description
 from delays a
left join delay_codes b on a.Code = b.Code
where b.code is not Null and vehicle != 0
)
,
Final as (
select *, year(date) as Year, IF(month(date) <= 6, 'Lower', 'Higher') as PartOfYear  from NoNull
where Code in ('SUAE', 'SUAP', 'SUBT', 'SUDP', 'SUPOL', 'SUROB', 'SUSA', 'SUSP', 'SRAE', 'SRAP', 'SRBT', 'SRDP', 'SRSA', 'SRSP')
)
select * from Final
;