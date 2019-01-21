package CourseManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Course {
	private int courseNumber; // counter - ?ш린???덉뼱???섎굹 ?섎Ц
	private int establishmentCurriculumNumber; // 媛쒖꽕怨쇱젙 踰덊샇
	private String id; // ?섍컯??id

	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	public Course() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationsentermanagementsystem", "root",
					"1492");
			stmt = con.createStatement();

		} catch (Exception e) {
			System.out.println("db?곌껐?ㅽ뙣s");
		}
	}

	public int getCourseNumber() {
		return courseNumber;
	}

	public void setCourseNumber(int courseNumber) {
		this.courseNumber = courseNumber;
	}

	public int getEstablishmentCurriculumNumber() {
		return establishmentCurriculumNumber;
	}

	public void setEstablishmentCurriculumNumber(int establishmentCurriculumNumber) {
		this.establishmentCurriculumNumber = establishmentCurriculumNumber;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	// ?낅젰??string怨??숈씪??num??李얜뒗??-> PK
	public int curriculumNameOfNumber(String cur_name) {
		int cur_num = 0;
		try {
			String query = "select curriculumNumber from curriculum where curriculumName='" + cur_name + "'";
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				cur_num = rs.getInt("curriculumNumber");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cur_num;
	}
	
	public ResultSet idOfResultSet(String id) {
		try {
			String query = "select * from course where id='" + id + "'";
			rs = stmt.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public String numberOfCurriculumName(int curriculumNumber) {
		String name = "";
		try {
			String query = "select curriculumName from curriculum where curriculumNumber='" + curriculumNumber + "'";
			
			Statement stmt1 = con.createStatement();
			rs = stmt1.executeQuery(query);
			
			while(rs.next()) {
				name=rs.getString("curriculumName");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(name);
		return name;
	}
}
