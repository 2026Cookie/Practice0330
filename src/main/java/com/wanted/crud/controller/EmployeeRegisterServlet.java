package com.wanted.crud.controller;

import com.wanted.crud.dto.EmployeeDTO;
import com.wanted.crud.service.EmployeeService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/employees/new")
public class EmployeeRegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String path = "/WEB-INF/views/employee/register.jsp";

        RequestDispatcher rd = req.getRequestDispatcher(path); // getRequestDispatcher(path) 목적지

        rd.forward(req, resp); //이동할 곳
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 한글 깨짐 방지 (필수)
        req.setCharacterEncoding("UTF-8");

        // list 못 쓰는 이유
        // 2 화면에서 보낸 데이터 꺼내기 사번, 이름, 이메일, 전화번호, 부서코드, 부서명, 직급코드, 직급명, 급여, 입사일, 퇴직여부
        String empId = req.getParameter("empId");
        String empname = req.getParameter("empName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String deptcode = req.getParameter("deptCode");
        String deptname = req.getParameter("deptname");
        String jobcode = req.getParameter("jobCode");
        String jobname = req.getParameter("jobname");
        String salary = req.getParameter("salary");
        String hiredate = req.getParameter("hireDate");
        String entyn = req.getParameter("entyn");

        EmployeeDTO newEmployee = new EmployeeDTO();

        newEmployee.setEmpId(empId);
        newEmployee.setEmpName(empname);
        newEmployee.setEmail(email);
        newEmployee.setPhone(phone);
        newEmployee.setDeptCode(deptcode);
        newEmployee.setDeptName(deptname);
        newEmployee.setJobCode(jobcode);
        newEmployee.setJobName(jobname);
        newEmployee.setSalary(Integer.parseInt(salary)); // salary는 정수형이여서 parseInt로 형변환 해주기
        newEmployee.setHireDate(java.sql.Date.valueOf(hiredate)); // 글자형태의 날짜를 진짜 날짜 객체로 변환해주는 것
        newEmployee.setEntYn(entyn);

        EmployeeService employeeService = new EmployeeService();
        int result = employeeService.EmployeeRegister(newEmployee);
        if(result > 0 ){
            resp.sendRedirect(req.getContextPath()+ "/employees");
        } else {

            req.setAttribute("message", "등록 실패 ");
        }
    }
}
