

--------------former EDA
/*
Q1 remove duplicates from each table
Q2 check the crucial value where income = null or occupation = null, make no sense 
Q3 check the status where status = c/x or 0
Q4 final touch data cleaning for powerbi, join two tables, and select the ppl with potential with good paying 
*/
















---------------select everything from application record

-- select *
-- from credit_card_approval.dbo.application_record



---------------select everything from credit record
-- select *
-- from credit_card_approval.dbo.credit_record



/*inner join and give status = c/x and 0 free pass*/
-- select *
-- from credit_card_approval.dbo.credit_record as cr
-- left JOIN credit_card_approval.dbo.application_record as ar
-- on cr.ID=ar.ID

/* when status  = C , put these customers as priorities*/
/* when status  = X , put these customers as no.2 */
/* when status  = 0 , put these customers as no.3 */


/*select non-free pass customers. filer later*/
-- select *
-- from credit_card_approval.dbo.credit_record as cr 
-- right JOIN credit_card_approval.dbo.application_record as ar
-- on cr.ID=ar.ID
-- where cr.MONTHS_BALANCE is null and cr.[STATUS] is null

/*avg income value with no free pass customer ID = 190376.45*/

-- select *
--     from credit_card_approval.dbo.credit_record as cr 
--     right JOIN credit_card_approval.dbo.application_record as ar
--     on cr.ID=ar.ID
-- where cr.MONTHS_BALANCE is null and cr.[STATUS] is null
-- group by OCCUPATION_TYPE
-- having AMT_INCOME_TOTAL >= 190376
-- order by AMT_INCOME_TOTAL DESC

/* 标准1 收入大于avg收入*/
-- select *
--     from credit_card_approval.dbo.credit_record as cr 
--     right JOIN credit_card_approval.dbo.application_record as ar
--     on cr.ID=ar.ID
-- where cr.MONTHS_BALANCE is null and cr.[STATUS] is null
-- and AMT_INCOME_TOTAL >= 190376

/* 标准2 有稳定工作的*/
-- select *
--     from credit_card_approval.dbo.credit_record as cr 
--     right JOIN credit_card_approval.dbo.application_record as ar
--     on cr.ID=ar.ID
-- where cr.MONTHS_BALANCE is null and cr.[STATUS] is null
-- and AMT_INCOME_TOTAL >= 190376
-- and name_income_type is not null

/*
-----------思路powerbi 从这个1万2之后  计算出 每种职业的收入的均值，选出高于均值的人
*/


/* 标准3 岁数小于50岁 大于18 */
/* 
18* 365 = 6570
50 * 365 = 18250
*/



-- ALTER TABLE credit_card_approval.dbo.application_record 
-- ALTER COLUMN DAYS_BIRTH FLOAT

-- select DAYS_BIRTH* -1
-- from credit_card_approval.dbo.application_record


/* 标准3 家庭成员小于3个人*/

-- select *
--     from credit_card_approval.dbo.credit_record as cr 
--     right JOIN credit_card_approval.dbo.application_record as ar
--     on cr.ID=ar.ID
-- where cr.MONTHS_BALANCE is null and cr.[STATUS] is null
-- and AMT_INCOME_TOTAL >= 190376
-- and CNT_Fam_members < 3

/*第一次alter table错误范例*/

-- ALTER TABLE credit_card_approval.dbo.application_record 
-- ALTER COLUMN Flag_mobil 

/*alter table change data type 正确范例*/
-- ALTER TABLE  credit_card_approval.dbo.application_record 
-- ALTER COLUMN Flag_mobil nvarchar(max) NULL

-- ALTER TABLE  credit_card_approval.dbo.application_record 
-- ALTER COLUMN flag_phone nvarchar NULL

-- ALTER TABLE  credit_card_approval.dbo.application_record 
-- ALTER COLUMN FLAG_EMAIL nvarchar NULL



/* 标准4 有mobil 有phone 有email*/
-- select *
--     from credit_card_approval.dbo.credit_record as cr 
--     right JOIN credit_card_approval.dbo.application_record as ar
--     on cr.ID=ar.ID
-- where cr.MONTHS_BALANCE is null and cr.[STATUS] is null
-- and AMT_INCOME_TOTAL >= 190376
-- and CNT_Fam_members < 3
-- and FLAG_EMAIL=1 and FLAG_MOBIL=1 and FLAG_PHONE=1
/*选出了399个数据*/
