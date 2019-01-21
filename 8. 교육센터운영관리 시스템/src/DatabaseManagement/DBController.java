package DatabaseManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBController {
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	public DBController() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationsentermanagementsystem", "root",
					"1492");
			stmt = con.createStatement();

		} catch (Exception e) {
			System.out.println("db연결실패s");
		}
	}
	
	public ResultSet studentInfoOfID(int curriculumNumber) {
		ResultSet studentRS = null;
		Connection con1 = null;
		Statement stmt1 = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationsentermanagementsystem", "root",
					"1492");
			stmt1 = con1.createStatement();

		} catch (Exception e) {
			System.out.println("db연결실패s");
		}
		
		
		try {
			String query = "select course.id, student.`*` from course inner join student on course.id = student.id where curriculumNumber = '" + curriculumNumber + "'";
			studentRS = stmt1.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return studentRS;
	}
	
	public ResultSet employeeInfoOfID(int curriculumNumber) {
		ResultSet employeeRS = null;
		Connection con2 = null;
		Statement stmt2 = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationsentermanagementsystem", "root",
					"1492");
			stmt2 = con2.createStatement();

		} catch (Exception e) {
			System.out.println("db연결실패s");
		}
		
		
		try {
			String query = "select course.id, employee.`*` from course inner join employee on course.id = employee.id where curriculumNumber = '" + curriculumNumber + "'";
			employeeRS = stmt2.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return employeeRS;
	}

	public ResultSet chkStudentID(String id) {
		ResultSet studentID = null;
		Connection scon = null;
		Statement sstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			scon = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationsentermanagementsystem", "root",
					"1492");
			sstmt = scon.createStatement();

		} catch (Exception e) {
			System.out.println("db연결실패s");
		}		
		try {
			String query = "select id from student where id=" +"'" + id + "'";
			studentID = sstmt.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return studentID;
	}
	
	public ResultSet chkEmployeeID(String id) {
		ResultSet employeeID = null;
		Connection econ = null;
		Statement estmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			econ = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationsentermanagementsystem", "root",
					"1492");
			estmt = econ.createStatement();

		} catch (Exception e) {
			System.out.println("db연결실패s");
		}
		
		
		try {
			String query = "select id from employee where id=" +"'" + id + "'";
			employeeID = estmt.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return employeeID;
	}

	public ResultSet chkCourseNumberOfID(String id, int curriculumNumber) {
		ResultSet courseRS = null;
		Connection ccon = null;
		Statement cstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			ccon = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationsentermanagementsystem", "root",
					"1492");
			cstmt = ccon.createStatement();

		} catch (Exception e) {
			System.out.println("db연결실패s");
		}
		
		
		try {
			String query = "select courseNumber from course where curriculumNumber = '" + curriculumNumber + "' and id = '" + id + "'";
			courseRS = cstmt.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return courseRS;
	}
}
