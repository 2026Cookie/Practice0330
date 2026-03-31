<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.wanted.crud.dto.EmployeeDTO" %>
<%
    String contextPath = request.getContextPath();
    EmployeeDTO emp = (EmployeeDTO) request.getAttribute("emp");

    // 만약 세션 검사가 필요하다면 index.jsp처럼 로그인 여부 확인 로직 추가
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>사원 정보 수정 - Employee Management</title>
    <style>
        /* index.jsp와 동일한 기본 스타일링 */
        * { box-sizing: border-box; }
        body { margin: 0; font-family: Arial, sans-serif; background: #f4f6f8; color: #222; }
        .container { width: 800px; max-width: 95%; margin: 0 auto; padding: 30px 0 60px; }
        .hero { background: linear-gradient(135deg, #1f3c88, #2563eb); color: white; border-radius: 18px; padding: 30px; margin-bottom: 24px; }
        .hero h1 { margin: 0 0 10px; font-size: 28px; }
        .hero p { margin: 0; opacity: 0.9; }

        .section { background: white; border-radius: 16px; padding: 30px; box-shadow: 0 8px 18px rgba(0,0,0,0.06); }
        .section h2 { margin-top: 0; color: #1f3c88; border-bottom: 2px solid #e5e7eb; padding-bottom: 12px; margin-bottom: 24px; }

        /* 폼 전용 스타일 */
        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        .form-group { margin-bottom: 15px; }
        .form-group.full-width { grid-column: 1 / -1; }
        .form-group label { display: block; font-weight: bold; margin-bottom: 8px; color: #374151; }
        .form-group input, .form-group select { width: 100%; padding: 12px; border: 1px solid #cbd5e1; border-radius: 8px; font-size: 15px; }
        .form-group input:focus { outline: none; border-color: #2563eb; box-shadow: 0 0 0 3px rgba(37,99,235,0.1); }
        .form-group input[readonly], .form-group input[disabled] { background-color: #f3f4f6; color: #6b7280; cursor: not-allowed; }

        .radio-group { display: flex; gap: 20px; padding: 10px 0; }
        .radio-label { display: flex; align-items: center; gap: 8px; font-weight: normal; cursor: pointer; }

        .btn-group { display: flex; justify-content: flex-end; gap: 12px; margin-top: 30px; border-top: 1px solid #e5e7eb; padding-top: 20px; }
        .btn { padding: 12px 24px; border-radius: 10px; font-weight: bold; border: none; cursor: pointer; text-decoration: none; font-size: 15px; }
        .btn-submit { background: #2563eb; color: white; }
        .btn-submit:hover { background: #1d4ed8; }
        .btn-cancel { background: #f3f4f6; color: #4b5563; border: 1px solid #d1d5db; }
        .btn-cancel:hover { background: #e5e7eb; }
    </style>
</head>
<body>

<div class="container">
    <section class="hero">
        <h1>사원 정보 수정</h1>
        <p>사원번호 <strong><%= emp.getEmpId() %></strong>님의 정보를 수정합니다.</p>
    </section>

    <section class="section">
        <h2>기본 정보 설정</h2>
        <form action="<%= request.getContextPath() %>/employees/update" method="post">

            <div class="form-grid">
                <div class="form-group">
                    <label>사번 (수정불가)</label>
                    <input type="text" name="empId" value="<%= emp.getEmpId() %>" readonly>
                </div>

                <div class="form-group">
                    <label>사원명 (수정불가)</label>
                    <input type="text" value="<%= emp.getEmpName() %>" disabled>
                </div>

                <div class="form-group">
                    <label>이메일</label>
                    <input type="email" name="email" value="<%= (emp.getEmail() != null) ? emp.getEmail() : "" %>">
                </div>

                <div class="form-group">
                    <label>전화번호</label>
                    <input type="text" name="phone" value="<%= (emp.getPhone() != null) ? emp.getPhone() : "" %>" placeholder="010-0000-0000">
                </div>

                <div class="form-group">
                    <label>부서코드</label>
                    <input type="text" name="deptCode" value="<%= (emp.getDeptCode() != null) ? emp.getDeptCode() : "" %>" placeholder="예: D1">
                </div>

                <div class="form-group">
                    <label>직급코드</label>
                    <input type="text" name="jobCode" value="<%= (emp.getJobCode() != null) ? emp.getJobCode() : "" %>" placeholder="예: J1">
                </div>

                <div class="form-group">
                    <label>급여</label>
                    <input type="number" name="salary" value="<%= emp.getSalary() %>">
                </div>

                <div class="form-group">
                    <label>입사일</label>
                    <input type="date" name="hireDate" value="<%= (emp.getHireDate() != null) ? emp.getHireDate().toString() : "" %>">
                </div>

                <div class="form-group">
                    <label>재직상태</label>
                    <div class="radio-group">
                        <label class="radio-label">
                            <input type="radio" name="entYn" value="N" <%= "N".equals(emp.getEntYn()) ? "checked" : "" %>> 재직중
                        </label>
                        <label class="radio-label">
                            <input type="radio" name="entYn" value="Y" <%= "Y".equals(emp.getEntYn()) ? "checked" : "" %>> 퇴사
                        </label>
                    </div>
                </div>
            </div>

            <div class="btn-group">
                <a href="<%= contextPath %>/employees" class="btn btn-cancel">목록으로 취소</a>
                <button type="submit" class="btn btn-submit">수정 완료 저장</button>
            </div>
        </form>
    </section>
</div>

</body>
</html>