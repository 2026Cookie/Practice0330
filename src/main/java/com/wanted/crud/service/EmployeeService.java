package com.wanted.crud.service;


import com.wanted.crud.dao.EmployeeDAO;
import com.wanted.crud.dto.EmployeeDTO;
import static com.wanted.crud.global.JDBCTemplate.*;
import java.sql.Connection;
import java.sql.SQLException;

import static com.wanted.crud.global.JDBCTemplate.close;
import static com.wanted.crud.global.JDBCTemplate.getConnection;


public class EmployeeService {

    private final EmployeeDAO employeeDAO = new EmployeeDAO();

    public int EmployeeRegister(EmployeeDTO newEmployee) {

        Connection con = getConnection();
        int result = 0;

        try{
            con.setAutoCommit(false);

            result = employeeDAO.insertEmployee(con,newEmployee);

            if(result > 0){
                commit(con);
            } else {
                rollback(con);
            }

        } catch (SQLException e) {
            rollback(con);
        } finally {
            close(con);
        }
        return result;
    }
}
