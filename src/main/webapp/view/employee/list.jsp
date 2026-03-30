<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.wanted.crud.dto.EmployeeDTO" %>
<%
    // Servlet에서 넘겨준 "employeeList" 데이터를 꺼냅니다.
    List<EmployeeDTO> list = (List<EmployeeDTO>) request.getAttribute("employeeList");
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>사원 목록 - Employee Management</title>
    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            color: #222;
        }

        .container {
            width: 1180px;
            max-width: 95%;
            margin: 0 auto;
            padding: 30px 0 60px;
        }

        /* 상단 히어로 배너 스타일 */
        .hero {
            background: linear-gradient(135deg, #1f3c88, #2563eb);
            color: white;
            border-radius: 18px;
            padding: 36px;
            margin-bottom: 24px;
        }

        .hero h1 {
            margin: 0 0 10px;
            font-size: 34px;
        }

        .hero p {
            margin: 8px 0;
            line-height: 1.7;
            opacity: 0.9;
        }

        /* 메인 컨텐츠 영역 스타일 */
        .section {
            background: white;
            border-radius: 16px;
            padding: 28px;
            box-shadow: 0 8px 18px rgba(0,0,0,0.06);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .section-header h2 {
            margin: 0;
            color: #1f3c88;
        }

        /* 테이블 스타일 (index.jsp의 role-table 활용) */
        .role-table {
            width: 100%;
            border-collapse: collapse;
        }

        .role-table th, .role-table td {
            border: 1px solid #d1d5db;
            padding: 14px 12px;
            text-align: center;
            font-size: 14px;
        }

        .role-table th {
            background: #f3f4f6;
            color: #1f2937;
            font-weight: bold;
        }

        .role-table tbody tr:hover {
            background: #f8fbff;
            transition: background 0.2s;
        }

        /* 버튼 스타일 */
        .btn {
            display: inline-block;
            text-decoration: none;
            background: #2563eb;
            color: white;
            padding: 8px 12px;
            border-radius: 8px;
            font-weight: bold;
            font-size: 13px;
            border: none;
            cursor: pointer;
            transition: all 0.2s;
        }

        .btn:hover { opacity: 0.85; }
        .btn.green { background: #10b981; }
        .btn.red { background: #dc2626; }
        .btn.gray { background: #6b7280; }

        .btn-group {
            display: flex;
            justify-content: center;
            gap: 6px;
        }

        .mini-form {
            display: inline;
            margin: 0;
        }

        .empty-row {
            padding: 40px !important;
            color: #6b7280;
            font-size: 15px;
        }
    </style>
</head>
<body>

<div class="container">
    <section class="hero">
        <h1>사원 목록 조회</h1>
        <p>등록된 전체 사원의 정보를 확인하고 관리할 수 있습니다.</p>
    </section>

    <section class="section">
        <div class="section-header">
            <h2>전체 사원 목록</h2>
            <div>
                <a href="<%= contextPath %>/" class="btn gray">메인으로</a>
                <a href="<%= contextPath %>/employees/new" class="btn green">새 사원 등록</a>
            </div>
        </div>

        <table class="role-table">
            <thead>
            <tr>
                <th>사번</th>
                <th>사원명</th>
                <th>이메일</th>
                <th>전화번호</th>
                <th>부서명</th>
                <th>직급명</th>
                <th>급여</th>
                <th>재직상태</th>
                <th>관리</th>
            </tr>
            </thead>
            <tbody>
            <%
                // 데이터가 없으면 없다고 출력합니다.
                if (list == null || list.size() == 0) {
            %>
            <tr>
                <td colspan="9" class="empty-row">등록된 사원 정보가 없습니다.</td>
            </tr>
            <%
            } else {
                // 데이터가 있으면 for문을 돌면서 한 줄씩 표를 그립니다.
                for (int i = 0; i < list.size(); i++) {
                    EmployeeDTO emp = list.get(i);
            %>
            <tr>
                <td><strong><%= emp.getEmpId() %></strong></td>
                <td><%= emp.getEmpName() %></td>
                <td><%= (emp.getEmail() != null) ? emp.getEmail() : "-" %></td>
                <td><%= (emp.getPhone() != null) ? emp.getPhone() : "-" %></td>
                <td><%= (emp.getDeptName() != null) ? emp.getDeptName() : "<span style='color:#9ca3af;'>부서없음</span>" %></td>
                <td><%= (emp.getJobName() != null) ? emp.getJobName() : "-" %></td>
                <td><%= String.format("%,d", emp.getSalary()) %> 원</td> <td>
                <% if("Y".equals(emp.getEntYn())) { %>
                <span style="color: #dc2626; font-weight: bold;">퇴사</span>
                <% } else { %>
                <span style="color: #10b981; font-weight: bold;">재직</span>
                <% } %>
            </td>
                <td>
                    <div class="btn-group">
                        <a href="<%= contextPath %>/employees/detail?empId=<%= emp.getEmpId() %>" class="btn">상세</a>
                        <a href="<%= contextPath %>/employees/edit?empId=<%= emp.getEmpId() %>" class="btn green">수정</a>

                        <form action="<%= contextPath %>/employees/delete" method="post" class="mini-form" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                            <input type="hidden" name="empId" value="<%= emp.getEmpId() %>">
                            <button type="submit" class="btn red">삭제</button>
                        </form>
                    </div>
                </td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </section>
</div>

</body>
</html>