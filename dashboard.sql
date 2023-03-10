SELECT SUM(S_PRICE) FROM SERV RIGHT OUTER JOIN RESERVE USING (S_NUM);

select *
from serv
where s_num = (select s_num
from (select s_num, count(s_num)
from reserve
where s_num in (7,8)
group by s_num
order by 2 desc
fetch first 1 rows only
));

select s_num, count(s_num), round(count(s_num)/ (select sum(count(s_num))from reserve where s_num in(6,7) group by s_num)*100,2)AS percentage
from reserve
where s_num in(6,7)
group by s_num
order by 1;


select *
from serv
where s_num = (select s_num
from (select s_num, count(s_num)
from reserve
where s_num in (1,2,4,5,8)
group by s_num
order by 2 desc
fetch first 1 rows only
));

SELECT part_name
FROM partners
WHERE part_id = (SELECT part_id
FROM (SELECT part_id, COUNT(DISTINCT reserve_num) cnt
GROUP BY part_id
ORDER BY cnt DESC
FETCH FIRST 1 ROWS ONLY));


SELECT COUNT(*)
FROM RESERVE
WHERE RESERVE_DAY LIKE '2023-04%';

SELECT TO_CHAR(TO_DATE(RESERVE_DAY, 'YYYY/MM/DD'), 'YYYY/MM') AS year_month, COUNT(*)
FROM RESERVE
GROUP BY TO_CHAR(TO_DATE(RESERVE_DAY, 'YYYY/MM/DD'), 'YYYY/MM')
ORDER BY TO_CHAR(TO_DATE(RESERVE_DAY, 'YYYY/MM/DD'), 'YYYY/MM') DESC;

SELECT TO_CHAR(TO_DATE(RESERVE_DAY, 'YYYY/MM/DD'), 'YYYY/MM') AS year_month, COUNT(*) AS total FROM RESERVE GROUP BY TO_CHAR(TO_DATE(RESERVE_DAY, 'YYYY/MM/DD'), 'YYYY/MM') ORDER BY TO_CHAR(TO_DATE(RESERVE_DAY, 'YYYY/MM/DD'), 'YYYY/MM') ASC;

SELECT COUNT(*) FROM USERS;

SELECT COUNT(*) FROM RESERVE;

select s_num, count(s_num) AS service_count
from reserve
where s_num in(1,2,4,5,8)
group by s_num
order by 1;


select s_num, count(s_num), round(count(s_num)/ (select sum(count(s_num))from reserve where s_num in(6,7) group by s_num)*100,2)AS percentage
from reserve
where s_num in(6,7)
group by s_num
order by 1;


SELECT
part_id,
COUNT(DISTINCT reserve_num) AS cnt,
ROUND(COUNT(DISTINCT reserve_num) / (SELECT COUNT(DISTINCT reserve_num) FROM reserve) * 100, 2) AS percentage
FROM reserve
GROUP BY part_id
ORDER BY cnt DESC;


SELECT PARTNERS.PART_ID, PARTNERS.PART_NAME, COUNT(DISTINCT RESERVE.RESERVE_NUM) AS CNT
FROM PARTNERS 
INNER JOIN RESERVE ON PARTNERS.PART_ID = RESERVE.PART_ID 
GROUP BY P.PART_ID, P.PART_NAME
ORDER BY CNT DESC;
