package com.kh.member.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 로그인 서비스
	public Member loginMember(Connection conn, Member m) {
		
		Member loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				loginUser = new Member(rset.getInt("MEMBER_NO")
									 , rset.getString("MEMBER_ID")
									 , rset.getString("MEMBER_PWD")
									 , rset.getString("MEMBER_NICKNAME")
									 , rset.getString("MEMBER_NAME")
									 , rset.getString("EMAIL")
									 , rset.getString("PHONE")
									 , rset.getString("BIRTH")
									 , rset.getString("GENDER")
									 , rset.getString("ADDRESS1")
									 , rset.getString("ADDRESS2")
									 , rset.getString("BLACKLIST")
									 , rset.getInt("MEMBER_POINT")
									 , rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
	}
	
	// 회원가입 서비스
	public int insertMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserNickName());
			pstmt.setString(4, m.getUserName());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getBirth());
			pstmt.setString(8, m.getGender());
			pstmt.setString(9, m.getAddress1());
			pstmt.setString(10, m.getAddress2());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}
	
	// 회원정보 변경 서비스
	public int updateMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserNickName());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getBirth());
			pstmt.setString(6, m.getGender());
			pstmt.setString(7, m.getAddress1());
			pstmt.setString(8, m.getAddress2());
			pstmt.setString(9, m.getUserId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}
	
	// 회원정보 조회 서비스
	public Member selectMember(Connection conn, String userId) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				m = new Member(rset.getInt("MEMBER_NO")
							 , rset.getString("MEMBER_ID")
							 , rset.getString("MEMBER_PWD")
							 , rset.getString("MEMBER_NICKNAME")
							 , rset.getString("MEMBER_NAME")
							 , rset.getString("EMAIL")
							 , rset.getString("PHONE")
							 , rset.getString("BIRTH")
							 , rset.getString("GENDER")
							 , rset.getString("ADDRESS1")
							 , rset.getString("ADDRESS2")
							 , rset.getString("BLACKLIST")
							 , rset.getInt("MEMBER_POINT")
							 , rset.getString("STATUS"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	
	// 아이디 중복 확인
	
	public int idCheck(Connection conn, String checkId) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
	// 닉네임 중복 확인
	
	public int nicknameCheck(Connection conn, String checkNickname) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("nicknameCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkNickname);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
	// 회원 탈퇴 서비스
	public int deleteMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(pstmt);			
		}
		
		return result;		
	}
	
	// 비밀번호 확인 서비스
	public int checkPwd(Connection conn, Member m) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("checkPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
	// 비밀번호 변경 서비스
	public int updatePwd(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getUserId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(pstmt);			
		}
		
		return result;
		
	}

	// 비밀번호 찾기 - 이메일 인증기능 서비스
	public String searchPwd(Connection conn, String userId) {

		String email = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				email = rset.getString("EMAIL");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		
			close(rset);
			close(pstmt);
		}
				
		return email;
	}

	// 회원등급 조회
	public String selectGradeName(Connection conn, int userPoint) {

		String gradeName = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectGradeName");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userPoint);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				gradeName = rset.getString("GRADE_NAME");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		
			close(rset);
			close(pstmt);
		}
		
		
		return gradeName;
	}

	// 총 회원 수(닉네임 검색 시 포함) 조회 서비스
	public int selectListCount(Connection conn, String nickName) {

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" + nickName + "%");
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				listCount = rset.getInt("COUNT"); // 별칭으로도 데이터 뽑기 가능
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<Member> selectList(Connection conn, String nickName, PageInfo pi) {

		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getPageLimit() + 1;
			int endRow = startRow + pi.getPageLimit() - 1;
			
			pstmt.setString(1, nickName);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Member(rset.getInt("MEMBER_NO")
								  , rset.getString("MEMBER_ID")
								  , rset.getString("MEMBER_PWD")
								  , rset.getString("MEMBER_NICKNAME")
								  , rset.getString("MEMBER_NAME")
								  , rset.getString("EMAIL")
								  , rset.getString("PHONE")
								  , rset.getString("BIRTH")
								  , rset.getString("GENDER")
								  , rset.getString("ADDRESS1")
								  , rset.getString("ADDRESS2")
								  , rset.getString("BLACKLIST")
								  , rset.getInt("USERPOINT")
								  , rset.getString("STATUS")
								  ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
}
