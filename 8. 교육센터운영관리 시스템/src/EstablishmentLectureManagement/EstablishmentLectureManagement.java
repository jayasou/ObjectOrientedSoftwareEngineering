package EstablishmentLectureManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import ManageSubjectManagement.ManageSubject;
import javafx.beans.binding.StringBinding;

public class EstablishmentLectureManagement {
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	EstablishmentLecture establishmentLecture;

	public EstablishmentLectureManagement() {
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

	public void regEstablishmentLecture(EstablishmentLecture establishmentLecture) {
		int management_sub_num = establishmentLecture.getManagementSubNumber();
		String subjectName = establishmentLecture.getSubjectName();
		String lecturerName = establishmentLecture.getLecturerName();
		String lectureName = establishmentLecture.getLectureName();
		String classRoom = establishmentLecture.getClassRoom();

		String qurry = "insert into educationsentermanagementsystem.lecture (managementSubNumber, subjectName, lecturerName, lectureName, classRoom) values ('"
				+ management_sub_num + "', '" + subjectName + "', '" + lecturerName + "', '" + lectureName + "', '"
				+ classRoom + "')";

		try {
			stmt.executeUpdate(qurry);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateEstablishmentLecture(String establishment_lecture_num_str,
			EstablishmentLecture establishmentLecture) {

		int establishment_lecture_num = Integer.parseInt(establishment_lecture_num_str);
		int managementSubNumber = establishmentLecture.getManagementSubNumber();
		String subjectName = establishmentLecture.getSubjectName();
		String lecturerName = establishmentLecture.getLecturerName();
		String lectureName = establishmentLecture.getLectureName();
		String classRoom = establishmentLecture.getClassRoom();
		
		try {
			String query = "update educationsentermanagementsystem.lecture set managementSubNumber='"
					+ managementSubNumber + "', subjectName='" + subjectName + "', lecturerName='" + lecturerName
					+ "', lectureName='" + lectureName + "', classRoom='" + classRoom + "' where lectureNumber='"
					+ establishment_lecture_num + "'";

			stmt.executeUpdate(query);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delEstablishmentLecture(String del_index) {
		int establishment_lecture_num = Integer.parseInt(del_index);
		String qurry = "delete from educationsentermanagementsystem.lecture where lectureNumber='"
				+ establishment_lecture_num + "'";
		try {
			stmt.executeUpdate(qurry);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ResultSet inqurieEstablishmentLecture() {
		try {
			String query = "select lectureNumber, managementSubNumber, subjectName, lecturerName, lectureName, classRoom from lecture";
			rs = stmt.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	/*
	public ResultSet subjectNameOfEstablishmentLecture(String subjectName) {
		try {
			System.out.println("뿌엥!!!받아온 과목명 : " + subjectName + "★");
			String query = "select lectureName from lecture where subjectName='" + subjectName + "'";
			rs = stmt.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}*/
}
