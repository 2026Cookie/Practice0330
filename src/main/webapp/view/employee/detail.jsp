<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 26. 3. 30.
  Time: 오후 1:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.wanted.crud.dto.EmployeeDTO" %>
<%
    EmployeeDTO emp = (EmployeeDTO) request.getAttribute("emp");
%>
<html>
<head>
    <title>사원 상세 정보</title>
    <style>
        body { font-family: sans-serif; padding: 40px; background: #f5f5f5; }
        .card { background: white; border-radius: 8px; padding: 30px; max-width: 600px; margin: 0 auto; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        h2 { margin-bottom: 24px; color: #333; }
        table { width: 100%; border-collapse: collapse; }
        td { padding: 10px 12px; border-bottom: 1px solid #eee; }
        td:first-child { color: #888; width: 140px; }
        td:last-child { font-weight: 500; color: #222; }
        .back-btn { display: inline-block; margin-top: 20px; padding: 8px 16px; background: #4a90e2; color: white; border-radius: 4px; text-decoration: none; }
    </style>
</head>
<body>
<div class="card">
    <h2>사원 상세 정보</h2>
    <table>
        <tr><td>사번</td><td><%= emp.getEmpId() %></td></tr>
        <tr><td>이름</td><td><%= emp.getEmpName() %></td></tr>
        <tr><td>이메일</td><td><%= emp.getEmail() %></td></tr>
        <tr><td>전화번호</td><td><%= emp.getPhone() %></td></tr>
        <tr><td>부서명</td><td><%= emp.getDeptName() %></td></tr>
        <tr><td>직급명</td><td><%= emp.getJobName() %></td></tr>
        <tr><td>급여</td><td><%= emp.getSalary() %>원</td></tr>
        <tr><td>재직여부</td><td><%= emp.getEntYn().equals("N") ? "재직중" : "퇴직" %></td></tr>
    </table>
    <a class="back-btn" href="/employees">목록으로</a>
</div>
</body>
</html>