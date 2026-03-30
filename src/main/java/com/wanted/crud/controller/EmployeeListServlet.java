package com.wanted.crud.controller;

import com.wanted.crud.dto.EmployeeDTO;
import com.wanted.crud.service.EmployeeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/employees")
public class EmployeeListServlet extends HttpServlet {

    // 비즈니스 로직을 처리할 Service 객체 생성
    private EmployeeService employeeService = new EmployeeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 1. Service를 호출하여 사원 목록 데이터 조회
        List<EmployeeDTO> empList = employeeService.getEmployeeList();

        // 2. JSP 화면에서 사용할 수 있도록 request 객체에 데이터 저장
        // ("empList"라는 이름표를 붙여서 담습니다)
        // 서블릿에서 request.setAttribute 할 때 쓴 이름과
        request.setAttribute("employeeList", empList);

        // 3. 목록을 보여줄 JSP 페이지 지정 및 Forward 이동
        // ⚠️ 주의: 본인 프로젝트의 실제 jsp 파일 경로로 수정해 주세요!
        String path = "/view/employee/list.jsp";;

        request.getRequestDispatcher(path).forward(request, response);
    }
}