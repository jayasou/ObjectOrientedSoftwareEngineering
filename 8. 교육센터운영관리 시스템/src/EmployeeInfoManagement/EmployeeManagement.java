package EmployeeInfoManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EmployeeManagement {
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	Employee employee;

	public EmployeeManagement() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationsentermanagementsystem", "root",
					"1492");
			stmt = con.createStatement();
			System.out.println("디비연결성공");

		} catch (Exception e) {
			System.out.println("db연결실패e");
		}
	}

	public void regEmployee(Employee employee) {

		String id = employee.getId();
		String password = employee.getPassword();
		String employeeId = employee.getEmployeeId();
		String koreanName = employee.getKoreanName();
		String englishName = employee.getEnglishName();
		String ssn = employee.getSsn();
		String sex = employee.getSex();
		String address = employee.getAddress();
		String residenceAddress = employee.getResidenceAddress();
		String phoneHomeNum = employee.getPhoneHomeNum();
		String cellPhoneNum = employee.getCellPhoneNum();
		String emergencyCallNum = employee.getEmergencyCallNum();
		String email = employee.getEmail();
		String emailbankCode = employee.getBankCode();
		String accountNum = employee.getAccountNum();
		String accountHolder = employee.getAccountHolder();

		String qurry = "insert into educationsentermanagementsystem.employee (id, password, employeeId, koreanName, englishName, ssn, sex, address, residenceAddress, phoneNum, cellPhoneNum, emergencyCallNum, email, bankCode, accountNum, accountHolder) values ('"
				+ id + "', '" + password + "', '" + employeeId + "', '" + koreanName + "', '" + englishName + "', '"
				+ ssn + "', '" + sex + "', '" + address + "', '" + residenceAddress + "', '" + phoneHomeNum + "', '"
				+ cellPhoneNum + "', '" + emergencyCallNum + "', '" + email + "', '" + emailbankCode + "', '"
				+ accountNum + "', '" + accountHolder + "')";
		try {
			stmt.executeUpdate(qurry);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateEmployee(Employee employee) {

		String id = employee.getId();
		String password = employee.getPassword();
		String employeeId = employee.getEmployeeId();
		String koreanName = employee.getKoreanName();
		String englishName = employee.getEnglishName();
		String ssn = employee.getSsn();
		String sex = employee.getSex();
		String address = employee.getAddress();
		String residenceAddress = employee.getResidenceAddress();
		String phoneHomeNum = employee.getPhoneHomeNum();
		String cellPhoneNum = employee.getCellPhoneNum();
		String emergencyCallNum = employee.getEmergencyCallNum();
		String email = employee.getEmail();
		String bankCode = employee.getBankCode();
		String accountNum = employee.getAccountNum();
		String accountHolder = employee.getAccountHolder();

		String qurry = "update educationsentermanagementsystem.employee set password='" + password + "', employeeId='"
				+ employeeId + "', koreanName='" + koreanName + "', englishName='" + englishName + "', ssn='" + ssn
				+ "', sex='" + sex + "', address='" + address + "', residenceAddress='" + residenceAddress
				+ "', phoneNum='" + phoneHomeNum + "', cellPhoneNum='" + cellPhoneNum + "', emergencyCallNum='"
				+ emergencyCallNum + "', email='" + email + "', bankCode='" + bankCode + "', accountNum='" + accountNum
				+ "', accountHolder='" + accountHolder + "' where id='" + id + "'";

		try {
			stmt.executeUpdate(qurry);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delEmployee(String del_id) {
		String qurry = "delete from educationsentermanagementsystem.employee where id='" + del_id + "'";
		try {
			stmt.executeUpdate(qurry);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
