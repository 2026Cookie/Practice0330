package com.wanted.crud.dto; // ⚠️ 본인 프로젝트의 실제 패키지 이름으로 꼭 수정해 주세요!

import java.sql.Date;

public class EmployeeDTO {

    // 데이터베이스 컬럼과 매칭되는 변수들
    private String empId;       // EMP_ID (사번)
    private String empName;     // EMP_NAME (사원명)
    private String empNo;       // EMP_NO (주민번호 등)
    private String email;       // EMAIL (이메일)
    private String phone;       // PHONE (전화번호)
    private String deptCode;    // DEPT_CODE (부서코드)
    private String jobCode;     // JOB_CODE (직급코드)
    private String salLevel;    // SAL_LEVEL (급여등급)
    private int salary;         // SALARY (급여 - 소수점 없는 숫자라 int 사용)
    private double bonus;       // BONUS (보너스 - 실수형이라 double 사용)
    private String managerId;   // MANAGER_ID (관리자사번)
    private Date hireDate;      // HIRE_DATE (입사일 - java.sql.Date 사용)
    private Date entDate;       // ENT_DATE (퇴사일)
    private String entYn;       // ENT_YN (퇴사여부/재직상태)

    // 조인(JOIN) 결과를 담기 위해 추가한 변수들
    private String deptName;    // 부서명
    private String jobName;     // 직급명

    // 기본 생성자 (필수)
    public EmployeeDTO() {}

    // 값들을 넣고(Set) 꺼내기(Get) 위한 Getter/Setter 메서드들입니다.
    public String getEmpId() { return empId; }
    public void setEmpId(String empId) { this.empId = empId; }

    public String getEmpName() { return empName; }
    public void setEmpName(String empName) { this.empName = empName; }

    public String getEmpNo() { return empNo; }
    public void setEmpNo(String empNo) { this.empNo = empNo; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getDeptCode() { return deptCode; }
    public void setDeptCode(String deptCode) { this.deptCode = deptCode; }

    public String getJobCode() { return jobCode; }
    public void setJobCode(String jobCode) { this.jobCode = jobCode; }

    public String getSalLevel() { return salLevel; }
    public void setSalLevel(String salLevel) { this.salLevel = salLevel; }

    public int getSalary() { return salary; }
    public void setSalary(int salary) { this.salary = salary; }

    public double getBonus() { return bonus; }
    public void setBonus(double bonus) { this.bonus = bonus; }

    public String getManagerId() { return managerId; }
    public void setManagerId(String managerId) { this.managerId = managerId; }

    public Date getHireDate() { return hireDate; }
    public void setHireDate(Date hireDate) { this.hireDate = hireDate; }

    public Date getEntDate() { return entDate; }
    public void setEntDate(Date entDate) { this.entDate = entDate; }

    public String getEntYn() { return entYn; }
    public void setEntYn(String entYn) { this.entYn = entYn; }

    public String getDeptName() { return deptName; }
    public void setDeptName(String deptName) { this.deptName = deptName; }

    public String getJobName() { return jobName; }
    public void setJobName(String jobName) { this.jobName = jobName; }
}