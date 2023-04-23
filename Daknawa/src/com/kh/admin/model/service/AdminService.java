package com.kh.admin.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.model.dao.AdminDao;
import com.kh.post.model.vo.Post;
import com.kh.qna.model.vo.Qna;

public class AdminService {

	public ArrayList<Post> selectAdminPostList() {
		
		Connection conn = getConnection();
        
        ArrayList<Post> list = new AdminDao().selectAdminPostList(conn);
        
        close(conn);
        
        return list;
	}

	public ArrayList<Qna> selectQnaList() {
		
		Connection conn = getConnection();
		
		ArrayList<Qna> list = new AdminDao().selectQnaList(conn);
		
		close(conn);
		
		return list;
	}

}
