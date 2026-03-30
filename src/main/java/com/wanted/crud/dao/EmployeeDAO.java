package com.wanted.crud.dao;

import com.wanted.crud.dto.EmployeeDTO;
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

}
