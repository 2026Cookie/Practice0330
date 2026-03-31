package com.wanted.crud.service;

import com.wanted.crud.dao.EmployeeDAO;
import com.wanted.crud.dto.EmployeeDTO;
import com.wanted.crud.global.JDBCTemplate;

import java.sql.Connection;
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

    // 회원 정보 수정
    // 1. 단건 조회 (수정 폼 데이터 채우기용)
    public EmployeeDTO selectOneByEmpId(String empId) {
        Connection conn = JDBCTemplate.getConnection();
        EmployeeDTO emp = employeeDAO.selectOneByEmpId(conn, empId);
        JDBCTemplate.close(conn);
        return emp;
    }

    // 2. 수정 처리 (Commit / Rollback 필수!)
    public int updateEmployee(EmployeeDTO emp) {
        Connection conn = JDBCTemplate.getConnection();
        int result = 0;

        try {
            // 💡 JDBCTemplate을 안 고치기 위해, Service에서 직접 자동 커밋을 끕니다.
            conn.setAutoCommit(false);

            // DAO 호출하여 실제 DB 수정
            result = employeeDAO.updateEmployee(conn, emp);

            // JDBCTemplate.commit() 대신 자바 기본 conn.commit() 사용
            if (result > 0) {
                conn.commit();
            } else {
                conn.rollback();
            }
        } catch (Exception e) {
            // 에러가 나면 롤백 처리
            try {
                if (conn != null) conn.rollback();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(conn);
        }
        return result;
    }
}
    public EmployeeDTO getEmployeeById(String empId) {
        Connection con = getConnection();
        EmployeeDTO emp = null;

        try {
            emp = employeeDAO.getEmployeeById(con, empId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(con);
        }

        return emp;
    }

}

