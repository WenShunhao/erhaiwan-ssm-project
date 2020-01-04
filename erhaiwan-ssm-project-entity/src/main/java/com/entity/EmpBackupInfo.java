package com.entity;

public class EmpBackupInfo  {
    private Integer eId;
    private String eName;
    private String eBirthday;
    private String ePhone;
    private String eGender;
    private String eIdcard;
    private Double eSalary;
    private String eHiredate;
    private String eLeavedate;
    private String eDept;
    private String eCondition;
    private String eAddress;
    private String eRemark;

    public EmpBackupInfo() {
    }

    public EmpBackupInfo(Integer eId, String eName, String eBirthday, String ePhone, String eGender, String eIdcard, Double eSalary, String eHiredate, String eLeavedate, String eDept, String eCondition, String eAddress, String eRemark) {
        this.eId = eId;
        this.eName = eName;
        this.eBirthday = eBirthday;
        this.ePhone = ePhone;
        this.eGender = eGender;
        this.eIdcard = eIdcard;
        this.eSalary = eSalary;
        this.eHiredate = eHiredate;
        this.eLeavedate = eLeavedate;
        this.eDept = eDept;
        this.eCondition = eCondition;
        this.eAddress = eAddress;
        this.eRemark = eRemark;
    }

    public Integer geteId() {
        return eId;
    }

    public void seteId(Integer eId) {
        this.eId = eId;
    }

    public String geteName() {
        return eName;
    }

    public void seteName(String eName) {
        this.eName = eName;
    }

    public String geteBirthday() {
        return eBirthday;
    }

    public void seteBirthday(String eBirthday) {
        this.eBirthday = eBirthday;
    }

    public String getePhone() {
        return ePhone;
    }

    public void setePhone(String ePhone) {
        this.ePhone = ePhone;
    }

    public String geteGender() {
        return eGender;
    }

    public void seteGender(String eGender) {
        this.eGender = eGender;
    }

    public String geteIdcard() {
        return eIdcard;
    }

    public void seteIdcard(String eIdcard) {
        this.eIdcard = eIdcard;
    }

    public Double geteSalary() {
        return eSalary;
    }

    public void seteSalary(Double eSalary) {
        this.eSalary = eSalary;
    }

    public String geteHiredate() {
        return eHiredate;
    }

    public void seteHiredate(String eHiredate) {
        this.eHiredate = eHiredate;
    }

    public String geteLeavedate() {
        return eLeavedate;
    }

    public void seteLeavedate(String eLeavedate) {
        this.eLeavedate = eLeavedate;
    }

    public String geteDept() {
        return eDept;
    }

    public void seteDept(String eDept) {
        this.eDept = eDept;
    }

    public String geteCondition() {
        return eCondition;
    }

    public void seteCondition(String eCondition) {
        this.eCondition = eCondition;
    }

    public String geteAddress() {
        return eAddress;
    }

    public void seteAddress(String eAddress) {
        this.eAddress = eAddress;
    }

    public String geteRemark() {
        return eRemark;
    }

    public void seteRemark(String eRemark) {
        this.eRemark = eRemark;
    }
}
