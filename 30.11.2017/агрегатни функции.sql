-- 1
SELECT WORKDEPT, SUM(SALARY) AS SUM_SALARY
  FROM EMPLOYEE
  GROUP BY WORKDEPT;
  
-- 2
SELECT WORKDEPT, COUNT(*) AS EMP_COUNT
  FROM EMPLOYEE
  GROUP BY WORKDEPT;
  
-- 3
SELECT WORKDEPT, COUNT(*) AS EMP_COUNT
  FROM EMPLOYEE
  GROUP BY WORKDEPT
  HAVING COUNT(*) > 3;
  
-- 4
SELECT WORKDEPT, COUNT(*) AS DESIGNER
  FROM EMPLOYEE
  WHERE JOB = 'DESIGNER'
  GROUP BY WORKDEPT
  HAVING COUNT(*) > 1;
  
-- 5
SELECT WORKDEPT, SEX, DECIMAL(AVG(SALARY),8,2) AS "AVG-SALARY", DECIMAL(AVG(BONUS),8,2) AS "AVG-BONUS", 
       DECIMAL(AVG(COMM),8,2) AS "AVG-COMM", COUNT(*) AS COUNT
  FROM EMPLOYEE
  GROUP BY WORKDEPT, SEX
  HAVING COUNT(*) > 1;
  
-- 6
SELECT WORKDEPT, DECIMAL(AVG(BONUS),8,2) AS "AVG-BONUS", DECIMAL(AVG(COMM),8,2) AS "AVG-COMM"
  FROM EMPLOYEE
  GROUP BY WORKDEPT
  HAVING AVG(BONUS) > 500 AND AVG(COMM) > 2000;
  
  
  