package com.wanted.crud.service;

import com.wanted.crud.dao.EmployeeDAO;
import com.wanted.crud.dto.EmployeeDTO;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import static com.wanted.crud.global.JDBCTemplate.close;
import static com.wanted.crud.global.JDBCTemplate.getConnection;


public class EmployeeService {

    private EmployeeDAO employeeDAO = new EmployeeDAO();

    public List<EmployeeDTO> getEmployeeList() {
        // 1. Connection 생성
        Connection con = getConnection();
        List<EmployeeDTO> empList = null;

        try {
            // 2. DAO 호출하여 사원 목록 가져오기
            empList = employeeDAO.selectEmployeeList(con);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 3. 자원 반납 (Connection 닫기)
            close(con);
        }

        return empList;
    }

    // 삭제
    public int deleteEmployee(String empId) {
        Connection con = getConnection();
        int result = 0;

        try {

            result = employeeDAO.deleteEmployee(con, empId);

            // 트랜잭션 처리
            if (result > 0) {
                con.commit();
            } else {
                con.rollback();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(con);
        }

        return result;
    }
}