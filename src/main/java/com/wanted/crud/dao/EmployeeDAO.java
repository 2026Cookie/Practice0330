package com.wanted.crud.dao;


import com.wanted.crud.dto.EmployeeDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static com.wanted.crud.global.JDBCTemplate.close;

public class EmployeeDAO {
    public int insertEmployee(Connection con, EmployeeDTO emp){
        int result = 0;
        PreparedStatement pstmt = null;

        String query = "INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, EMAIL, PHONE, DEPT_CODE, DEPT_NAME, JOB_CODE, JOB_NAME, SALARY, HIRE_DATE, ENT_YN) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try{
            pstmt = con.prepareStatement(query);

            pstmt.setString(1, emp.getEmpId());
            pstmt.setString(2, emp.getEmpName());
            pstmt.setString(3, emp.getEmail());
            pstmt.setString(4, emp.getPhone());
            pstmt.setString(5, emp.getDeptCode());
            pstmt.setString(6, emp.getDeptName());
            pstmt.setString(7, emp.getJobCode());
            pstmt.setString(8, emp.getJobName());
            pstmt.setInt(9, emp.getSalary());        // 숫자는 setInt
            pstmt.setDate(10, emp.getHireDate());    // 날짜는 setDate
            pstmt.setString(11, emp.getEntYn());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(pstmt);
        }
        return result;
        }
    }

