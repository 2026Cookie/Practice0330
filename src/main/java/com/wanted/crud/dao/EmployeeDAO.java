package com.wanted.crud.dao;

import com.wanted.crud.dto.EmployeeDTO;
import com.wanted.crud.global.JDBCTemplate;
import com.wanted.crud.utils.QueryUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    public List<EmployeeDTO> selectEmployeeList(Connection con) throws SQLException {
        List<EmployeeDTO> list = new ArrayList<>();
        // QueryUtil을 사용한다고 가정
        String query = QueryUtil.getQuery("select employee list");

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            try (ResultSet rset = pstmt.executeQuery()) {

                while (rset.next()) {
                    EmployeeDTO emp = new EmployeeDTO();

                    // JSP에서 사용하는 getter 이름과 매칭되도록 set
                    emp.setEmpId(rset.getString("EMP_ID"));
                    emp.setEmpName(rset.getString("EMP_NAME"));
                    emp.setEmail(rset.getString("EMAIL"));
                    emp.setPhone(rset.getString("PHONE"));
                    emp.setDeptName(rset.getString("DEPT_NAME"));
                    emp.setJobName(rset.getString("JOB_NAME"));
                    emp.setSalary(rset.getInt("SALARY"));
                    emp.setEntYn(rset.getString("ENT_YN"));

                    list.add(emp);
                }
            }
        }
        return list;
    }

    // 회원 정보 수정
    // 1. 단건 조회 (기존 메서드를 이것으로 교체하세요)
    public EmployeeDTO selectOneByEmpId(Connection conn, String empId) {
        EmployeeDTO emp = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        // QueryUtil 사용
        String sql = QueryUtil.getQuery("selectOneEmployee");

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, empId);
            rset = pstmt.executeQuery();

            if (rset.next()) {
                emp = new EmployeeDTO();
                emp.setEmpId(rset.getString("EMP_ID"));
                emp.setEmpName(rset.getString("EMP_NAME"));
                emp.setEmail(rset.getString("EMAIL"));
                emp.setPhone(rset.getString("PHONE"));
                emp.setDeptCode(rset.getString("DEPT_CODE"));
                emp.setJobCode(rset.getString("JOB_CODE"));
                emp.setSalary(rset.getInt("SALARY"));
                emp.setHireDate(rset.getDate("HIRE_DATE"));
                emp.setEntYn(rset.getString("ENT_YN"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }
        return emp;
    }

    // 2. 사원 정보 수정 (기존 메서드를 이것으로 교체하세요)
    public int updateEmployee(Connection conn, EmployeeDTO emp) {
        int result = 0;
        PreparedStatement pstmt = null;
        // QueryUtil 사용
        String sql = QueryUtil.getQuery("updateEmployee");

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, emp.getEmail());
            pstmt.setString(2, emp.getPhone());
            pstmt.setString(3, emp.getDeptCode());
            pstmt.setString(4, emp.getJobCode());
            pstmt.setInt(5, emp.getSalary());
            pstmt.setDate(6, emp.getHireDate());
            pstmt.setString(7, emp.getEntYn());
            pstmt.setString(8, emp.getEmpId());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        return result;
    }

}
