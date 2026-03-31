package com.wanted.crud.controller;

import com.wanted.crud.dto.EmployeeDTO;
import com.wanted.crud.service.EmployeeService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/employees/detail")
public class EmployeeDetailServlet extends HttpServlet {

    private EmployeeService service = new EmployeeService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String empId = req.getParameter("empId");

        if (empId == null || empId.isEmpty()) {
            resp.sendRedirect("/view/common/errorpage.jsp");
            return;
        }

        EmployeeDTO emp = service.getEmployeeById(empId);

        if (emp == null) {
            resp.sendRedirect("/view/common/errorpage.jsp");
            return;
        }

        req.setAttribute("emp", emp);
        req.getRequestDispatcher("/view/employee/detail.jsp").forward(req, resp);
    }
}