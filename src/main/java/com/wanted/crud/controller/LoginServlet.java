package com.wanted.crud.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 인코딩 설정 (한글 깨짐 방지)
        request.setCharacterEncoding("UTF-8");

        // 2. 전달받은 파라미터 추출
        String userId = request.getParameter("userId");
        String userPwd = request.getParameter("userPwd");

        // 3. 비즈니스 로직 (ID/PW 검증)
        // 실제로는 DAO를 통해 DB 조회를 해야 하지만, 테스트를 위해 하드코딩 예시를 사용합니다.
        if ("admin".equals(userId) && "1234".equals(userPwd)) {

            // [핵심] 4. 로그인 성공 시 세션 생성 및 정보 저장
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", userId); // JSP에서 확인하는 key값

            // 5. 성공 후 메인 페이지로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/");

        } else {
            // 6. 로그인 실패 시 처리
            // 경고창을 띄우거나 다시 로그인 페이지(메인)로 보냄
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.'); history.back();</script>");
        }
    }
}
