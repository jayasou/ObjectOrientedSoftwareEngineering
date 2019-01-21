package EmployeeInfoManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Employee{
	private String id;
	private String password;
	private String employeeId;
	private String koreanName;
	private String englishName;
	private String ssn;
	private String sex;
	private String address;
	private String residenceAddress;
	private String phoneHomeNum;
	private String cellPhoneNum;
	private String emergencyCallNum;
	private String email;
	private String bankCode;
	private String accountNum;
	private String accountHolder;
	
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	public Employee() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationsentermanagementsystem", "root",
					"1492");
			stmt = con.createStatement();

		} catch (Exception e) {
			System.out.println("db연결실패e");
		}
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getKoreanName() {
		return koreanName;
	}

	public void setKoreanName(String koreanName) {
		this.koreanName = koreanName;
	}

	public String getEnglishName() {
		return englishName;
	}

	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getResidenceAddress() {
		return residenceAddress;
	}

	public void setResidenceAddress(String residenceAddress) {
		this.residenceAddress = residenceAddress;
	}

	public String getPhoneHomeNum() {
		return phoneHomeNum;
	}

	public void setPhoneHomeNum(String phoneHomeNum) {
		this.phoneHomeNum = phoneHomeNum;
	}

	public String getCellPhoneNum() {
		return cellPhoneNum;
	}

	public void setCellPhoneNum(String cellPhoneNum) {
		this.cellPhoneNum = cellPhoneNum;
	}

	public String getEmergencyCallNum() {
		return emergencyCallNum;
	}

	public void setEmergencyCallNum(String emergencyCallNum) {
		this.emergencyCallNum = emergencyCallNum;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getAccountNum() {
		return accountNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}

	public String getAccountHolder() {
		return accountHolder;
	}

	public void setAccountHolder(String accountHolder) {
		this.accountHolder = accountHolder;
	}
	
	public void setEmployee(String input_id)
	{
		String id = "";
		String password = "";
		String employeeId = "";
		String koreanName = "";
		String englishName = "";
		String ssn = "";
		String sex = "";
		String address = "";
		String residenceAddress = "";
		String phoneNum = "";
		String cellPhoneNum = "";
		String emergencyCallNum = "";
		String email = "";
		String bankCode = "";
		String accountNum = "";
		String accountHolder = "";

		String qurry = "select * from employee where id ='" + input_id + "'";
		try {
			rs = stmt.executeQuery(qurry);

			if (rs.next()) {
				id = input_id;
				setId(id);
				
				password = rs.getString("password");
				setPassword(password);

				employeeId = rs.getString("employeeId");
				setEmployeeId(employeeId);

				koreanName = rs.getString("koreanName");
				setKoreanName(koreanName);

				englishName = rs.getString("englishName");
				setEnglishName(englishName);

				ssn = rs.getString("ssn");
				setSsn(ssn);

				sex = rs.getString("sex");
				setSex(sex);

				address = rs.getString("address");
				setAddress(address);

				residenceAddress = rs.getString("residenceAddress");
				setResidenceAddress(residenceAddress);

				phoneNum = rs.getString("phoneNum");
				setPhoneHomeNum(phoneNum);
				
				cellPhoneNum = rs.getString("cellPhoneNum");
				setCellPhoneNum(cellPhoneNum);
				
				emergencyCallNum = rs.getString("emergencyCallNum");
				setEmergencyCallNum(emergencyCallNum);
				
				email = rs.getString("email");
				setEmail(email);
				
				bankCode = rs.getString("bankCode");
				setBankCode(bankCode);
				
				accountNum = rs.getString("accountNum");
				setAccountNum(accountNum);
				
				accountHolder = rs.getString("accountHolder");
				setAccountHolder(accountHolder);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
