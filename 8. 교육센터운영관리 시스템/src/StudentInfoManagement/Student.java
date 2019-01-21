package StudentInfoManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Student {
	private String id;
	private String password;
	private String name;
	private String sex;
	private String address;
	private String email;
	private String phoneNum;
	private String company;
	private String department;
	private String position;
	private String job;
	
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	public Student() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationsentermanagementsystem", "root",
					"1492");
			stmt = con.createStatement();

		} catch (Exception e) {
			System.out.println("db연결실패s");
		}
	}
		
	public void setId(String id) {
		this.id = id;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getID() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}

	public String getSex() {
		return sex;
	}

	public String getAddress() {
		return address;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phoneNum;
	}

	public String getCompany() {
		return company;
	}

	public String getDepartment() {
		return department;
	}

	public String getPosition() {
		return position;
	}

	public String getJob() {
		return job;
	}
	
	public void setStudent(String input_id)
	{
		String id = "";
		String password = "";
		String name = "";
		String sex = "";
		String address = "";
		String email = "";
		String phoneNum = "";
		String company = "";
		String department = "";
		String position = "";
		String job = "";

		String qurry = "select * from student where id ='" + input_id + "'";
		try {
			rs = stmt.executeQuery(qurry);

			if (rs.next()) {
				id = input_id;
				setId(id);
				
				password = rs.getString("password");
				setPassword(password);

				name = rs.getString("name");
				setName(name);

				sex = rs.getString("sex");
				setSex(sex);

				address = rs.getString("address");
				setAddress(address);

				email = rs.getString("email");
				setEmail(email);

				phoneNum = rs.getString("phoneNum");
				setPhoneNum(phoneNum);

				company = rs.getString("company");
				setCompany(company);

				department = rs.getString("department");
				setDepartment(department);

				position = rs.getString("position");
				setPosition(position);
				
				job = rs.getString("job");
				setJob(job);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ResultSet getAllStudentRS() {
		try {
			String query = "select * from student";
			rs = stmt.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet getInfoOfName(String name) {
		try {
			String query = "select * from student where name = '" + name + "'";
			
			rs = stmt.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
}
