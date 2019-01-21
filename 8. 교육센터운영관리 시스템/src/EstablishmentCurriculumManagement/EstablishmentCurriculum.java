package EstablishmentCurriculumManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EstablishmentCurriculum {
	private int curriculumNumber; // 과정번호
	private String curriculumName; // 개설과정명
	private String managementSubNumber; // 운영과목번호
	private String subjectName; // 과목명
	private String lectureNumber; // 강의번호
	private String lectureName; // 개설강의명

	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	public EstablishmentCurriculum() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationsentermanagementsystem", "root",
					"1492");
			stmt = con.createStatement();

		} catch (Exception e) {
			System.out.println("db연결실패e");
		}
	}

	public int geCurriculumNumber() {
		return curriculumNumber;
	}

	public void setCurriculumNumber(int curriculumNumber) {
		this.curriculumNumber = curriculumNumber;
	}

	public String getManagementSubNumber() {
		return managementSubNumber;
	}

	public void setManagementSubNumber(String managementSubNumber) {
		this.managementSubNumber = managementSubNumber;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectNamer(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getCurriculumName() {
		return curriculumName;
	}

	public void setCurriculumName(String curriculumName) {
		this.curriculumName = curriculumName;
	}

	public String getLectureName() {
		return lectureName;
	}

	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}

	public String getLectureNumber() {
		return lectureNumber;
	}

	public void setLectureNumber(String lectureNumber) {
		this.lectureNumber = lectureNumber;
	}
	
	public void setEstablishmentCurriculum(int establish_curriculum_num)
	{
		String managementSubNumber;
		String curriculumName = "";
		String subjectName = "";
		String lectureNumber = "";
		String lectureName = "";
		
		String query = "select * from curriculum where curriculumNumber ='" + establish_curriculum_num + "'";
		try {
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				setCurriculumNumber(establish_curriculum_num);
				
				curriculumName = rs.getString("curriculumName");
				setCurriculumName(curriculumName);
				
				managementSubNumber = rs.getString("managementSubNumber");
				setManagementSubNumber(managementSubNumber);
				
				subjectName = rs.getString("subjectName");
				setSubjectNamer(subjectName);
				
				lectureNumber = rs.getString("lectureNumber");
				setLectureNumber(lectureNumber);
				
				lectureName = rs.getString("lectureName");
				setLectureName(lectureName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
