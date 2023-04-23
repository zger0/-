package com.kh.admin.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.post.model.dao.PostDao;
import com.kh.post.model.vo.Post;

public class AdminDao {

    private Properties prop = new Properties();
	
	public AdminDao() {
		String fileName = PostDao.class.getResource("/sql/admin/admin-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Post> selectAdminPostList(Connection conn) {
		
        ArrayList<Post> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAdminPostList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Post po = new Post();

                po.setPostNo(rset.getInt("POST_NO"));
                po.setPostTitle(rset.getString("POST_TITLE"));
                po.setPostContent(rset.getString("POST_CONTENT"));
                po.setMemberNickname(rset.getString("MEMBER_NICKNAME"));
                po.setPostView(rset.getInt("POST_VIEW"));
                po.setPostDate(rset.getDate("POST_DATE"));
				
				list.add(po);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
}
