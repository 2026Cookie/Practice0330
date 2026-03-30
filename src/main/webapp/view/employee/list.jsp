<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.wanted.crud.dto.EmployeeDTO" %> <!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>사원 목록</title>
</head>
<body>
<h1>사원 전체 목록</h1>
<hr>

<table border="1">
    <tr>
        <th>사번</th>
        <th>사원명</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>부서명</th>
        <th>직급명</th>
        <th>급여</th>
        <th>재직상태</th> <th>관리</th>
    </tr>

    <%
        // Servlet에서 넘겨준 "employeeList" 데이터를 꺼냅니다.
        List<EmployeeDTO> list = (List<EmployeeDTO>) request.getAttribute("employeeList");

        // 데이터가 없으면 없다고 출력합니다.
        if (list == null || list.size() == 0) {
    %>
    <tr>
        <td colspan="9">등록된 사원 정보가 없습니다.</td>
    </tr>
    <%
    } else {
        // 데이터가 있으면 for문을 돌면서 한 줄씩 표를 그립니다.
        for (int i = 0; i < list.size(); i++) {
            EmployeeDTO emp = list.get(i);
    %>
    <tr>
        <td><%= emp.getEmpId() %></td>
        <td><%= emp.getEmpName() %></td>
        <td><%= (emp.getEmail() != null) ? emp.getEmail() : "-" %></td> <td><%= (emp.getPhone() != null) ? emp.getPhone() : "-" %></td>
        <td><%= (emp.getDeptName() != null) ? emp.getDeptName() : "부서없음" %></td>
        <td><%= (emp.getJobName() != null) ? emp.getJobName() : "-" %></td>
        <td><%= emp.getSalary() %></td>
        <td><%= emp.getEntYn() %></td>
        <td>
            <a href="/employeeDetail?empId=<%= emp.getEmpId() %>">[상세]</a>
            <a href="/employeeUpdate?empId=<%= emp.getEmpId() %>">[수정]</a>
            <a href="/employeeDelete?empId=<%= emp.getEmpId() %>">[삭제]</a>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>
</body>
</html>