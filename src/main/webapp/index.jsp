<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Object loginUser = session.getAttribute("loginUser");
    boolean isLogin = loginUser != null;
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Employee Management Mini Project</title>
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
        }

        .section {
            background: white;
            border-radius: 16px;
            padding: 28px;
            margin-bottom: 22px;
            box-shadow: 0 8px 18px rgba(0,0,0,0.06);
        }

        .section h2 {
            margin-top: 0;
            margin-bottom: 16px;
            color: #1f3c88;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 18px;
        }

        .card {
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 20px;
            background: #fafafa;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.08);
            border-color: #93c5fd;
            background: #f8fbff;
        }

        .card.static-card {
            cursor: default;
        }

        .card.static-card:hover {
            transform: none;
            box-shadow: none;
            border-color: #e5e7eb;
            background: #fafafa;
        }

        .card h3 {
            margin-top: 0;
            margin-bottom: 12px;
            color: #1f2937;
        }

        .card p {
            line-height: 1.6;
            font-size: 14px;
            margin: 6px 0;
        }

        .btn-group {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 14px;
        }

        .btn {
            display: inline-block;
            text-decoration: none;
            background: #2563eb;
            color: white;
            padding: 11px 16px;
            border-radius: 10px;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }

        .btn.green { background: #10b981; }
        .btn.gray { background: #6b7280; }
        .btn.red { background: #dc2626; }

        .flow, .notice {
            background: #f9fafb;
            border: 1px solid #d1d5db;
            border-radius: 12px;
            padding: 18px;
            line-height: 1.8;
        }

        .login-box {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .login-form {
            border: 1px solid #dbe2ea;
            border-radius: 12px;
            padding: 20px;
            background: #fbfdff;
        }

        .login-form label {
            display: block;
            font-weight: bold;
            margin-top: 12px;
            margin-bottom: 6px;
        }

        .login-form input {
            width: 100%;
            padding: 10px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
        }

        .role-table {
            width: 100%;
            border-collapse: collapse;
        }

        .role-table th, .role-table td {
            border: 1px solid #d1d5db;
            padding: 12px;
            text-align: center;
        }

        .role-table th {
            background: #f3f4f6;
        }

        .badge {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 999px;
            background: #dbeafe;
            color: #1d4ed8;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .mini-form {
            display: inline;
            margin: 0;
        }

        .code-box {
            background: #111827;
            color: #f9fafb;
            padding: 14px 16px;
            border-radius: 10px;
            font-family: Consolas, monospace;
            font-size: 14px;
            overflow-x: auto;
            line-height: 1.7;
        }

        @media (max-width: 768px) {
            .grid, .login-box {
                grid-template-columns: 1fr;
            }
        }
    </style>

    <script>
        function movePage(url, needLogin) {
            const isLogin = <%= isLogin %>;

            if (needLogin && !isLogin) {
                alert("로그인 후 이용 가능한 기능입니다.");
                return;
            }

            location.href = url;
        }

        function needPostMessage(featureName) {
            alert(featureName + " 기능은 화면에서 직접 GET으로 이동하는 기능이 아니라, form을 이용한 POST 요청 처리 중심으로 실습합니다.");
        }
    </script>
</head>
<body>
<div class="container">

    <section class="hero">
        <h1>Employee Management Mini Project</h1>
        <p>Jakarta EE + Servlet + JSP + JDBC + MySQL + GitHub 협업 실습</p>
        <p>이번 프로젝트는 Session 기반 로그인과 Employee CRUD를 함께 구현하여 웹 애플리케이션의 전체 흐름을 복습하는 것을 목표로 합니다.</p>
    </section>

    <section class="section">
        <h2>1. 프로젝트 목표</h2>
        <div class="notice">
            1) Session 기반 로그인/로그아웃 기능 구현<br>
            2) 사원 목록 조회, 상세 조회, 등록, 수정, 삭제 구현<br>
            3) Servlet → Service → DAO → DB → JSP 흐름 이해<br>
            4) 조회는 forward, 처리 후 이동은 redirect 로 구분<br>
            5) Git / GitHub 브랜치 협업 경험하기
        </div>
    </section>

    <section class="section">
        <h2>2. URL 설계 기준</h2>
        <div class="code-box">
            GET    /                          메인 페이지<br>
            POST   /login                     로그인 처리<br>
            POST   /logout                    로그아웃 처리<br><br>

            GET    /employees                 사원 목록 조회<br>
            GET    /employees/detail?empId=200       사원 상세 조회<br>
            GET    /employees/new                    사원 등록 페이지<br>
            POST   /employees                       사원 등록 처리<br>
            GET    /employees/edit?empId=200        사원 수정 페이지<br>
            POST   /employees/update                사원 수정 처리<br>
            POST   /employees/delete                사원 삭제 처리
        </div>
    </section>

    <section class="section">
        <h2>3. 로그인 상태</h2>

        <% if (!isLogin) { %>
        <div class="login-box">
            <div class="login-form">
                <span class="badge">로그인 필요</span>
                <form action="<%= contextPath %>/login" method="post">
                    <label for="userId">아이디</label>
                    <input type="text" id="userId" name="userId" placeholder="아이디 입력">

                    <label for="userPwd">비밀번호</label>
                    <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호 입력">

                    <div class="btn-group">
                        <button type="submit" class="btn">로그인</button>
                    </div>
                </form>
            </div>

            <div class="notice">
                <strong>임시 로그인 계정 예시</strong><br>
                - admin / 1234<br>
                - user / 1234<br><br>
                로그인 성공 시 session에 <strong>loginUser</strong> 정보를 저장하고,<br>
                이후 /employees 이하 기능에 접근할 수 있도록 구현합니다.<br><br>
                로그인하지 않은 사용자가 기능 페이지에 접근하면<br>
                메인 페이지 또는 에러 페이지로 이동하도록 처리합니다.
            </div>
        </div>
        <% } else { %>
        <div class="notice">
            <strong>로그인 성공</strong><br>
            현재 사용자가 session에 저장되어 있습니다.<br>
            이제 사원 관리 기능을 사용할 수 있습니다.<br><br>
            현재 로그인 사용자: <strong><%= loginUser %></strong>

            <div class="btn-group">
                <a href="<%= contextPath %>/employees" class="btn">사원 목록 보기</a>
                <a href="<%= contextPath %>/employees/new" class="btn green">사원 등록하기</a>

                <form action="<%= contextPath %>/logout" method="post" class="mini-form">
                    <button type="submit" class="btn red">로그아웃</button>
                </form>
            </div>
        </div>
        <% } %>
    </section>

    <section class="section">
        <h2>4. 기능별 요구사항</h2>
        <div class="grid">

            <div class="card" onclick="movePage('<%= contextPath %>/employees', true)">
                <h3>사원 목록 조회</h3>
                <p><strong>URL:</strong> GET /employees</p>
                <p><strong>목적:</strong> 전체 사원 목록을 조회한다.</p>
                <p><strong>출력 항목:</strong> 사번, 사원명, 이메일, 전화번호, 부서명, 직급명, 급여, 재직상태</p>
                <p><strong>처리 방식:</strong> Servlet이 DAO를 통해 목록을 조회한 뒤 request에 담아 JSP로 forward 한다.</p>
                <p><strong>구현 포인트:</strong> EMPLOYEE, DEPARTMENT, JOB 테이블을 조인하여 화면에 보여준다.</p>
                <p><strong>추가 요구사항:</strong> 각 행에서 상세 조회, 수정, 삭제 기능으로 이동할 수 있어야 한다.</p>
            </div>

            <div class="card" onclick="movePage('<%= contextPath %>/employees/detail?empId=200', true)">
                <h3>사원 상세 조회</h3>
                <p><strong>URL:</strong> GET /employees/detail?empId={empId}</p>
                <p><strong>목적:</strong> 특정 사원 1명의 상세 정보를 조회한다.</p>
                <p><strong>입력값:</strong> empId</p>
                <p><strong>출력 항목:</strong> 사번, 이름, 이메일, 전화번호, 부서코드, 부서명, 직급코드, 직급명, 급여, 입사일, 퇴직여부</p>
                <p><strong>처리 방식:</strong> empId를 파라미터로 받아 1건 조회 후 JSP로 forward 한다.</p>
                <p><strong>예외 처리:</strong> 존재하지 않는 empId가 들어오면 에러 페이지로 이동한다.</p>
            </div>

            <div class="card" onclick="movePage('<%= contextPath %>/employees/new', true)">
                <h3>사원 등록</h3>
                <p><strong>URL:</strong> GET /employees/new, POST /employees</p>
                <p><strong>목적:</strong> 신규 사원 정보를 입력받아 DB에 저장한다.</p>
                <p><strong>입력값:</strong> 사번, 사원명, 이메일, 전화번호, 부서코드, 직급코드, 급여, 입사일, 퇴직여부</p>
                <p><strong>처리 방식:</strong> GET 요청 시 등록 화면을 보여주고, POST 요청 시 insert를 수행한다.</p>
                <p><strong>검증 포인트:</strong> 사번/사원명/직급코드 필수, 급여는 숫자, 입사일은 날짜 형식이어야 한다.</p>
                <p><strong>성공 흐름:</strong> 등록 성공 후 redirect:/employees</p>
            </div>

            <div class="card" onclick="movePage('<%= contextPath %>/employees/edit?empId=200', true)">
                <h3>사원 수정</h3>
                <p><strong>URL:</strong> GET /employees/edit?empId={empId}, POST /employees/update</p>
                <p><strong>목적:</strong> 기존 사원 정보를 수정한다.</p>
                <p><strong>수정 가능 항목:</strong> 이메일, 전화번호, 부서코드, 직급코드, 급여, 입사일, 퇴직여부</p>
                <p><strong>수정 불가 항목:</strong> 사번, 사원명</p>
                <p><strong>처리 방식:</strong> GET 요청 시 기존 정보를 조회하여 폼에 채운 뒤, POST 요청 시 update를 수행한다.</p>
                <p><strong>성공 흐름:</strong> 수정 성공 후 redirect:/employees/detail?empId={empId}</p>
            </div>

            <div class="card" onclick="needPostMessage('사원 삭제')">
                <h3>사원 삭제</h3>
                <p><strong>URL:</strong> POST /employees/delete</p>
                <p><strong>목적:</strong> 특정 사원 정보를 삭제한다.</p>
                <p><strong>입력값:</strong> empId</p>
                <p><strong>처리 방식:</strong> 목록 또는 상세 화면에서 form submit 방식으로 POST 요청을 전송한다.</p>
                <p><strong>주의사항:</strong> 삭제는 GET으로 처리하지 않고 반드시 POST로 처리한다.</p>
                <p><strong>성공 흐름:</strong> 삭제 성공 후 redirect:/employees</p>
            </div>

            <div class="card static-card">
                <h3>로그인 / 로그아웃</h3>
                <p><strong>로그인 URL:</strong> POST /login</p>
                <p><strong>로그아웃 URL:</strong> POST /logout</p>
                <p><strong>목적:</strong> 세션 생성과 만료를 직접 경험한다.</p>
                <p><strong>로그인 처리:</strong> 아이디/비밀번호 검증 후 session.setAttribute("loginUser", userId)</p>
                <p><strong>로그아웃 처리:</strong> session.invalidate()</p>
                <p><strong>성공 흐름:</strong> 로그인/로그아웃 후 모두 메인 페이지로 redirect</p>

                <% if (isLogin) { %>
                <div class="btn-group">
                    <form action="<%= contextPath %>/logout" method="post" class="mini-form">
                        <button type="submit" class="btn red">로그아웃 실행</button>
                    </form>
                </div>
                <% } %>
            </div>

        </div>
    </section>

    <section class="section">
        <h2>5. 실행 단계</h2>
        <div class="flow">
            1. employee DB 및 샘플 데이터 생성 SQL 실행<br>
            2. resources의 db-connection.properties 설정 확인<br>
            3. JDBCTemplate를 이용한 DB 연결 테스트<br>
            4. 로그인/로그아웃 기능 구현 및 session 저장 확인<br>
            5. 로그인하지 않은 사용자에 대한 접근 제어 구현<br>
            6. 사원 목록 조회 기능 구현<br>
            7. 사원 상세 조회 기능 구현<br>
            8. 사원 등록 기능 구현<br>
            9. 사원 수정 기능 구현<br>
            10. 사원 삭제 기능 구현<br>
            11. forward / redirect 동작 검증<br>
            12. 예외 상황 처리 확인<br>
            13. Git branch 병합 및 최종 테스트
        </div>
    </section>

    <section class="section">
        <h2>6. 페이지 흐름</h2>
        <div class="flow">
            메인 페이지(GET /) → 로그인(POST /login) → 로그인 성공 → redirect:/<br>
            메인 페이지(GET /) → 사원 목록(GET /employees) → 상세 조회(GET /employees/detail?empId=200)<br>
            메인 페이지(GET /) → 사원 등록 화면(GET /employees/new) → 등록 처리(POST /employees) → redirect:/employees<br>
            상세 조회(GET /employees/detail?empId=200) → 수정 화면(GET /employees/edit?empId=200) → 수정 처리(POST /employees/update) → redirect:/employees/detail?empId=200<br>
            목록/상세 화면 → 삭제 처리(POST /employees/delete) → redirect:/employees<br>
            로그아웃(POST /logout) → session 무효화 → redirect:/
        </div>
    </section>

    <section class="section">
        <h2>7. Forward / Redirect 사용 기준</h2>
        <div class="notice">
            <strong>Forward</strong><br>
            - 조회 결과를 JSP로 넘길 때 사용<br>
            - request에 담은 데이터를 유지한 채 화면 출력 가능<br>
            - 예: 목록 조회, 상세 조회, 등록 화면 이동, 수정 화면 이동<br><br>

            <strong>Redirect</strong><br>
            - 등록/수정/삭제/로그인/로그아웃 처리 후 사용<br>
            - 브라우저가 새 요청을 보내므로 새로고침 시 중복 제출 문제를 줄일 수 있음<br>
            - 예: 로그인 성공 후 메인 이동, 등록 후 목록 이동, 수정 후 상세 이동, 삭제 후 목록 이동
        </div>
    </section>

    <section class="section">
        <h2>8. 팀 역할 분담 예시</h2>
        <table class="role-table">
            <thead>
            <tr>
                <th>역할</th>
                <th>담당 기능</th>
                <th>브랜치명 예시</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>팀원 A</td>
                <td>index.jsp / LoginServlet / LogoutServlet</td>
                <td>feature/login-index</td>
            </tr>
            <tr>
                <td>팀원 B</td>
                <td>EmployeeListServlet / list.jsp</td>
                <td>feature/list</td>
            </tr>
            <tr>
                <td>팀원 C</td>
                <td>EmployeeDetailServlet / detail.jsp</td>
                <td>feature/detail</td>
            </tr>
            <tr>
                <td>팀원 D</td>
                <td>EmployeeRegistServlet / regist.jsp</td>
                <td>feature/regist</td>
            </tr>
            <tr>
                <td>팀원 E</td>
                <td>EmployeeUpdateServlet / update.jsp / EmployeeDeleteServlet</td>
                <td>feature/update-delete</td>
            </tr>
            </tbody>
        </table>
    </section>

    <section class="section">
        <h2>9. 구현 체크리스트</h2>
        <div class="notice">
            - 로그인 성공 시 session에 loginUser가 저장되는가?<br>
            - 로그아웃 시 session이 제거되는가?<br>
            - 로그인하지 않은 상태에서 /employees 접근을 제한하는가?<br>
            - 목록 화면에서 상세/수정/삭제로 이동 가능한가?<br>
            - 등록/수정/삭제 후 redirect가 되는가?<br>
            - 조회 화면에서는 forward를 사용하는가?<br>
            - 잘못된 empId 요청 시 예외 처리를 하는가?<br>
            - GitHub 브랜치 전략을 지키며 협업했는가?
        </div>
    </section>
    <section class="section">
        <h2>10. 추가 구현 체크리스트</h2>
        <div class="notice">
            - filter 를 활용해서 Logging 처리를 했는가? <br>
            - filter 를 활용해서 Session 이 만료되면 메인 페이지로 rediect 되는 가? <br>
        </div>
    </section>

</div>
</body>
</html>