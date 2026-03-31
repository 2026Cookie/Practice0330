<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 26. 3. 30.
  Time: 오후 1:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>신규 사원 등록</title>
</head>
<body>
<h2>신규 사원 등록</h2>
<%-- <%= request.getContextPath() %>  이건 표현식이다 --%>
<form action="<%= request.getContextPath() %>/employees/new" method="post">

    <p>사번: <input type="text" name="empId" required placeholder="사번을 입력하세요"></p>
    <p>사원명: <input type="text" name="empName" required></p>
    <p>이메일: <input type="email" name="email"></p>
    <p>전화번호: <input type="tel" name="phone"></p>
    <p>부서코드: <input type="text" name="deptCode"></p>

    <p>직급코드: <input type="text" name="jobCode" required></p>

    <p>급여: <input type="number" name="salary" value="0"></p>

    <p>입사일: <input type="date" name="hireDate" required></p>

    <button type="submit">등록</button>
    <button type="button" onclick="history.back()">취소</button>
</form>
</body>
</html>