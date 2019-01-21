package StudentInfoManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class StudentManagement {
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private StudentView studentView;

	public StudentManagement() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationsentermanagementsystem", "root",
					"1492");
			stmt = con.createStatement();

		} catch (Exception e) {
			System.out.println("db연결실패s");
		}
	}

	public void regStudent(Student student) {

		String id = student.getID();
		String name = student.getName();
		String password = student.getPassword();
		String sex = student.getSex();
		String address = student.getAddress();
		String email = student.getEmail();
		String phoneNum = student.getPhone();
		String company = student.getCompany();
		String department = student.getDepartment();
		String position = student.getPosition();
		String job = student.getJob();

		String qurry = "insert into educationsentermanagementsystem.student (id, password, name, sex, address, email, phoneNum, company, department, position, job) values ('"
				+ id + "', '" + password + "', '" + name + "', '" + sex + "', '" + address + "', '" + email + "', '"
				+ phoneNum + "', '" + company + "', '" + department + "', '" + position + "', '" + job + "')";
		try {
			stmt.executeUpdate(qurry);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateStudent(Student student) {

		String id = student.getID();
		String name = student.getName();
		String password = student.getPassword();
		String sex = student.getSex();
		String address = student.getAddress();
		String email = student.getEmail();
		String phoneNum = student.getPhone();
		String company = student.getCompany();
		String department = student.getDepartment();
		String position = student.getPosition();
		String job = student.getJob();

		String teString = "update educationsentermanagementsystem.student set " + "name='" + name + "', sex='" + sex
				+ "' where id='" + id + "'";

		String qurry = "update educationsentermanagementsystem.student set name='" + name + "', sex='" + sex + "', address='" + address + "', email='" + email + "', phoneNum=' " + phoneNum + "', company='" + company + "', department='" + department + "', position='" + position + "', job='" + job + "' where id='" + 3 + "'";
		
		try {
			stmt.executeUpdate(qurry);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void delStudent(String del_id) {
		String qurry = "delete from educationsentermanagementsystem.student where id='" + del_id + "'";
		try {
			stmt.executeUpdate(qurry);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
