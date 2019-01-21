package EstablishmentCurriculumManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EstablishmentCurriculumManagement {
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	EstablishmentCurriculum establishmentCurriculm;
	
	public EstablishmentCurriculumManagement() {
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
	
	public void regEstablishmentCurriculum(EstablishmentCurriculum establishmentCurriculm) {
		String curriculumName = establishmentCurriculm.getCurriculumName();
		String managementSubNumber = establishmentCurriculm.getManagementSubNumber();
		String subjectName = establishmentCurriculm.getSubjectName();
		String lectureNumber = establishmentCurriculm.getLectureNumber();
		String lectureName = establishmentCurriculm.getLectureName();
		
		String query = "insert into educationsentermanagementsystem.curriculum (curriculumName, managementSubNumber, subjectName, lectureNumber, lectureName) values ('"
				+ curriculumName + "', '" + managementSubNumber + "', '" + subjectName + "', '" + lectureNumber
				+ "', '" + lectureName + "')";
		try {
			stmt.executeUpdate(query);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void updateEstablishmentCurriculum(EstablishmentCurriculum establishmentCurriculm, String establishment_curriculum_num_str) {
		int establishment_curriculum_num = Integer.parseInt(establishment_curriculum_num_str);
		String curriculumName = establishmentCurriculm.getCurriculumName();
		String managementSubNumber = establishmentCurriculm.getManagementSubNumber();
		String subjectName = establishmentCurriculm.getSubjectName();
		String lectureNumber = establishmentCurriculm.getLectureNumber();
		String lectureName = establishmentCurriculm.getLectureName();
		
		try {
			String query = "update educationsentermanagementsystem.curriculum set curriculumName='"
					+ curriculumName + "', managementSubNumber='" + managementSubNumber + "', subjectName='" + subjectName
					+ "', lectureNumber='" + lectureNumber + "', lectureName='" + lectureName + "' where curriculumNumber='"
					+ establishment_curriculum_num + "'";

			stmt.executeUpdate(query);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void delEstablishmentCurriculum(String del_index) {
		int establishment_curriculum_num = Integer.parseInt(del_index);
		String qurry = "delete from educationsentermanagementsystem.curriculum where curriculumNumber='"
				+ establishment_curriculum_num + "'";
		try {
			stmt.executeUpdate(qurry);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ResultSet inqurieEstablishmentCurriculum() {
		try {
			String query = "select curriculumNumber, curriculumName, lectureName, subjectName from curriculum";
			rs = stmt.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public String subjectOfLectureName(String lectureName, int index)
	{
		if(index == 0)
		{
			try {
				String query = "select subjectName from lecture where lectureName ='" + lectureName + "'";
				rs = stmt.executeQuery(query);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			String subject_name = "";
			try {
				while (rs.next())
				{
					subject_name = rs.getString("subjectName"); 
				}
			} catch (SQLException e) {e.printStackTrace();}
			return subject_name;
		}
		
		if(index == 1)
		{
			String query2 = "select managementSubNumber from lecture where lectureName ='" + lectureName + "'";
			try {
				rs = stmt.executeQuery(query2);
			} catch (SQLException e1) {	e1.printStackTrace();}
			int subject_number = 0;
			try {
				while (rs.next())
				{
					subject_number = rs.getInt("managementSubNumber"); 
				}
			} catch (SQLException e) {e.printStackTrace();}
			
			String str_subject_number = Integer.toString(subject_number);
			return str_subject_number;
		}
		
		String query3 = "select lectureNumber from lecture where lectureName ='" + lectureName + "'";
		try {
			rs = stmt.executeQuery(query3);
		} catch (SQLException e1) {	e1.printStackTrace();}
		int lecture_number = 0;
		try {
			while (rs.next())
			{
				lecture_number = rs.getInt("lectureNumber"); 
			}
		} catch (SQLException e) {e.printStackTrace();}
		
		String str_lecture_number = Integer.toString(lecture_number);
		return str_lecture_number;
		
	}
}
