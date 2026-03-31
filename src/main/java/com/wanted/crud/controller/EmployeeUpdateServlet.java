package com.wanted.crud.controller;

import com.wanted.crud.dto.EmployeeDTO;
import com.wanted.crud.service.EmployeeService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

// [요구사항 충족] GET /employees/edit, POST /employees/update
@WebServlet({"/employees/edit", "/employees/update"})
public class EmployeeUpdateServlet extends HttpServlet {

    private EmployeeService empService = new EmployeeService();

    // [GET 요청 처리] 기존 정보를 조회하여 폼에 채운다.
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String empId = request.getParameter("empId");
        EmployeeDTO targetEmp = empService.selectOneByEmpId(empId);

        if (targetEmp != null) {
            request.setAttribute("emp", targetEmp);
            request.getRequestDispatcher("/view/employee/update.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/employees");
        }
    }

    // [POST 요청 처리] update를 수행한다.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        EmployeeDTO updateEmp = new EmployeeDTO();
        updateEmp.setEmpId(request.getParameter("empId"));
        updateEmp.setEmail(request.getParameter("email"));
        updateEmp.setPhone(request.getParameter("phone"));
        updateEmp.setDeptCode(request.getParameter("deptCode"));
        updateEmp.setJobCode(request.getParameter("jobCode"));

        String salaryStr = request.getParameter("salary");
        updateEmp.setSalary((salaryStr != null && !salaryStr.isEmpty()) ? Integer.parseInt(salaryStr) : 0);

        String hireDateStr = request.getParameter("hireDate");
        if (hireDateStr != null && !hireDateStr.isEmpty()) {
            updateEmp.setHireDate(java.sql.Date.valueOf(hireDateStr));
        }

        updateEmp.setEntYn(request.getParameter("entYn"));

        // update 수행
        int result = empService.updateEmployee(updateEmp);

        if (result > 0) {
            // [요구사항 충족] 성공 흐름: 수정 성공 후 redirect:/employees/detail?empId={empId}
            response.sendRedirect(request.getContextPath() + "/employees/detail?empId=" + updateEmp.getEmpId());
        } else {
            response.sendRedirect(request.getContextPath() + "/employees");
        }
    }
}