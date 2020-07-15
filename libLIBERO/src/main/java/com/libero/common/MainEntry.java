package com.libero.common;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MainEntry {
    public static void main(String[] args) {
        Connection con = null;
        PreparedStatement pstmt = null;   
        ResultSet rs = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
			
            con = DriverManager.getConnection(
                "jdbc:mariadb://192.168.0.70:3306/liblibero",
                "root",
                "1234");
						
            pstmt = con.prepareStatement("select * from user");
			
            rs = pstmt.executeQuery();
			
            while(rs.next()) {
                //.
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) {
                    rs.close(); // ���� ����
                }
				
                if(pstmt != null) {
                    pstmt.close(); // ���û��������� ȣ�� ��õ
                }
			
                if(con != null) {
                	System.out.println("success");
                    con.close(); // �ʼ� ����
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}