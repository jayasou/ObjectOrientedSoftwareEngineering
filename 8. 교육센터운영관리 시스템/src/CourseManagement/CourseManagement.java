package CourseManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CourseManagement {
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	public CourseManagement() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationsentermanagementsystem", "root",
					"1492");
			stmt = con.createStatement();

		} catch (Exception e) {
			System.out.println("db?곌껐?ㅽ뙣s");
		}
	}

	public void regCourse(Course course) {
		int curriculumNumber = course.getEstablishmentCurriculumNumber();
		String id = course.getId();
		
		String qurry = "insert into educationsentermanagementsystem.course (curriculumNumber, id) values ('"
				+ curriculumNumber + "', '" + id + "')";

		try {
			stmt.executeUpdate(qurry);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delCourse(String courseNumber) {
		int course_num = Integer.parseInt(courseNumber);
		System.out.println("??젣??courseNumber : " + courseNumber);
		String qurry = "delete from educationsentermanagementsystem.course where courseNumber='"
				+ course_num + "'";
		try {
			stmt.executeUpdate(qurry);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ResultSet inqurieCurriculum() {
		try {
			String query = "select curriculumName from curriculum";
			rs = stmt.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

}
