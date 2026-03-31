package com.wanted.crud.controller;

import com.wanted.crud.service.EmployeeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/employees/delete")
public class EmployeeDeleteServlet extends HttpServlet {

    private EmployeeService employeeService = new EmployeeService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String empId = request.getParameter("empId");

        // empId 예외 처리
        if (empId == null || empId.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/employees");
            return;
        }


        int result = employeeService.deleteEmployee(empId);


        if (result > 0) {
            // 성공: 사원 목록 페이지로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/employees");
        } else {
            // 실패: 에러 페이지로 포워딩
            request.setAttribute("errorMsg", "사원 삭제에 실패했습니다.");
            request.getRequestDispatcher("/view/common/errorpage.jsp").forward(request, response);
        }
    }
}