-- 1
SELECT EMPNO, LASTNAME, WORKDEPT
  FROM EMPLOYEE, DEPARTMENT
  WHERE WORKDEPT = DEPTNO AND EMPNO NOT IN (SELECT EMPNO
                                               FROM EMP_ACT);
                                               
-- 2
SELECT WORKDEPT, EMPNO, SALARY
  FROM EMPLOYEE E
  WHERE SALARY > (SELECT AVG(SALARY)
                    FROM EMPLOYEE
                    WHERE E.WORKDEPT = WORKDEPT)
  ORDER BY WORKDEPT, EMPNO;
  
-- 3
SELECT WORKDEPT, COUNT (*) AS EMP_COUNT
  FROM EMPLOYEE
  WHERE WORKDEPT <> 'A00'
  GROUP BY WORKDEPT
  HAVING COUNT (*) = (SELECT COUNT (*)
                        FROM EMPLOYEE
                        WHERE WORKDEPT = 'A00');
                        
-- 4
SELECT EMPNO, LASTNAME, SALARY, WORKDEPT
  FROM EMPLOYEE         
  WHERE WORKDEPT <> 'D11' AND SALARY > ANY (SELECT SALARY 
                                              FROM EMPLOYEE
                                              WHERE WORKDEPT = 'D11')
  ORDER BY EMPNO;
  
-- An alternate solution:
SELECT EMPNO, LASTNAME, SALARY, WORKDEPT
  FROM EMPLOYEE
  WHERE WORKDEPT <> 'D11' AND SALARY > (SELECT MIN(SALARY)
                                          FROM EMPLOYEE
                                          WHERE WORKDEPT = 'D11')
  ORDER BY EMPNO;
  
-- 5
SELECT EMPNO, LASTNAME, SALARY, WORKDEPT
  FROM EMPLOYEE
  WHERE WORKDEPT <> 'D11' AND SALARY > ALL (SELECT SALARY
                                              FROM EMPLOYEE
                                              WHERE WORKDEPT = 'D11')
  ORDER BY EMPNO;
  
-- An alternate solution:
SELECT EMPNO, LASTNAME, SALARY, WORKDEPT
  FROM EMPLOYEE
  WHERE WORKDEPT <> 'D11' AND SALARY > (SELECT MAX(SALARY)
                                          FROM EMPLOYEE
                                          WHERE WORKDEPT = 'D11')
  ORDER BY EMPNO;
  
-- 6
SELECT E.EMPNO, LASTNAME, COUNT (*) AS COUNT_ACT
  FROM EMPLOYEE E, EMP_ACT EA
  WHERE E.EMPNO = EA.EMPNO
  GROUP BY E.EMPNO, LASTNAME
  HAVING COUNT (*) >= ALL (SELECT COUNT (*)
                             FROM EMP_ACT
                             GROUP BY EMPNO);
  
-- 7
SELECT DISTINCT E.EMPNO, LASTNAME, ACTNO
  FROM EMPLOYEE E, EMP_ACT EA
  WHERE E.EMPNO = EA.EMPNO AND EXISTS (SELECT *
                                         FROM EMP_ACT
                                         WHERE 1982 BETWEEN YEAR(EMSTDATE) AND YEAR(EMENDATE));
  