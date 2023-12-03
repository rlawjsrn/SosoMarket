package com.tbk.prj.member;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import common.DAO;


public class MemberDAO extends DAO {
	// 비밀번호 암호화
	public String encryptPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes("UTF-8"));
            
            StringBuilder sb = new StringBuilder();
            for (byte b : hash) {
                sb.append(String.format("%02x", b));
            }
            
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        
        return null;
    }
	
	// 비밀번호 일치 여부 확인
	private boolean checkPassword(String password, String storedPassword) {
	    // 입력된 비밀번호를 암호화하여 암호화된 비밀번호와 비교합니다.
	    String encryptedPassword = encryptPassword(password);
	    return storedPassword.equals(encryptedPassword);
	}


	String sql;
	
	// 아이디 중복 체크
	public int idCheck(String memberId) {
		if (memberId.isEmpty()) {
	        return -1; // 비어있는 ID
	    }

	    connect();
	    psmt = null;
	    rs = null;
	    sql = "SELECT * FROM MEMBER WHERE member_id = ?";
	    
	    try {
	        psmt = conn.prepareStatement(sql);
	        psmt.setString(1, memberId);
	        rs = psmt.executeQuery();
	        
	        if (rs.next()) {
	            return 0; // 이미 존재하는 회원
	        } else {
	            return 1; // 가입 가능한 회원
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 오류 처리
	    } finally {
	        disconnect();
	    }
	    return -2;  // 데이터베이스 오류
	}
	
	// 닉네임 중복 체크
		public int nicknameCheck(String nickname) {
			if (nickname.isEmpty()) {
		        return -1; // 비어있는 ID
		    }

		    connect();
		    psmt = null;
		    rs = null;
		    sql = "SELECT * FROM MEMBER WHERE nickname = ?";
		    
		    try {
		        psmt = conn.prepareStatement(sql);
		        psmt.setString(1, nickname);
		        rs = psmt.executeQuery();
		        
		        if (rs.next()) {
		            return 0; // 이미 존재하는 회원
		        } else {
		            return 1; // 가입 가능한 회원
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        // 오류 처리
		    } finally {
		        disconnect();
		    }
		    return -2;  // 데이터베이스 오류
		}

	// 회원의 전체 조회
	public ArrayList<MemberVO> getMemberList(){
		ArrayList<MemberVO> memberlist = new ArrayList<MemberVO>();
		sql = "select * from member";
		try {
			connect();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setMemberId(rs.getString("member_id"));
				vo.setPassword(rs.getString("password"));
				vo.setMemberRole(rs.getString("member_role"));
				vo.setPhoneNumber(rs.getString("phone_number"));
				vo.setEmailVrf(rs.getString("email_vrf"));
				vo.setNickname(rs.getString("nickname"));
				vo.setRatingScore(rs.getInt("rating_score"));
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return memberlist;
		
	}
	
	//회원 가입
		public int insertMember(MemberVO vo) {
			connect();
			psmt = null;
			rs = null;
			sql = "INSERT INTO MEMBER(member_id, password, member_role, phone_number, email_vrf, nickname, rating_score,email) VALUES(?,?,?,?,?,?,?,?)";
			
			// 이메일 인증 "" 일때 시퀀스 어쩌구
			if (vo.getEmailVrf().equals("")) {
				sql = "INSERT INTO MEMBER("
						+ "member_id, password, member_role, phone_number, email_vrf, nickname, rating_score,email) "
						+ "VALUES(?,?,?,?,memseq.nextval,?,?,?)";
				try {
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, vo.getMemberId());
					
					// 비밀번호 암호화 적용
			        String encryptedPassword = encryptPassword(vo.getPassword());
			        
			        psmt.setString(2, encryptedPassword);
					psmt.setString(3, vo.getMemberRole());
					psmt.setString(4, vo.getPhoneNumber());
					psmt.setString(5, vo.getNickname());
					psmt.setInt(6, vo.getRatingScore());
					psmt.setString(7, vo.getEmail());
					return psmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					disconnect();
				}
				
			// 이메일 인증 "" 아닐 때
			} else {
				sql = "INSERT INTO MEMBER("
						+ "member_id, password, member_role, phone_number, email_vrf, nickname, rating_score,email) "
						+ "VALUES(?,?,?,?,?,?,?,?)";
				
				try {
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, vo.getMemberId());
					
					// 비밀번호 암호화 적용
			        String encryptedPassword = encryptPassword(vo.getPassword());
			        
			        psmt.setString(2, encryptedPassword);
					psmt.setString(3, vo.getMemberRole());
					psmt.setString(4, vo.getPhoneNumber());
					psmt.setString(5, vo.getEmailVrf());
					psmt.setString(6, vo.getNickname());
					psmt.setInt(7, vo.getRatingScore());
					psmt.setString(8, vo.getEmail());
					return psmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					disconnect();
				}
			}
			
			
			return -1;  // 데이터 베이스 오류
		}
		
		

		
	// 로그인
		public MemberVO loginmember(String memberId, String password) {
		    connect();
		    psmt = null;
		    rs = null;
		    sql = "SELECT * FROM MEMBER WHERE member_id = ? AND password = ?";
		    try {
		        psmt = conn.prepareStatement(sql);
		        psmt.setString(1, memberId);
		        
		        // 입력받은 비밀번호를 암호화하여 쿼리에 넣습니다.
		        String encryptedPassword = encryptPassword(password);
		        
		        // 암호화한 비밀번호 확인
		        System.out.println(encryptedPassword);
		        
		        psmt.setString(2, encryptedPassword);
		        
		        rs = psmt.executeQuery();
		        
		        System.out.println("Executing SQL query: " + sql);
		        
		        if (rs.next()) {
		            MemberVO vo = new MemberVO();
		            vo.setMemberId(rs.getString("member_id"));
		            vo.setNickname(rs.getString("nickname"));
		            return vo;
		        } else {
		            return null;
		        }
		    } catch (Exception e) {
		        e.printStackTrace(); // 예외 정보를 출력합니다.
		    } finally {
		        disconnect();
		    }
		    return null;
		}
// 인증번호 생성 6자리 영어대문자, 숫자		
		public String authCodeMaker() {
		    String authCode = null;
		    
		    StringBuffer temp = new StringBuffer();
		    Random rnd = new Random();
		    for (int i = 0; i < 6; i++) { // 6자리로 수정
		        int rIndex = rnd.nextInt(2); // 0 또는 1만 선택하도록 수정
		        switch (rIndex) {
		            case 0:
		                // A-Z
		                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
		                break;
		            case 1:
		                // 0-9
		                temp.append((rnd.nextInt(10)));
		                break;
		        }
		    }
		    
		    authCode = temp.toString();
		    System.out.println(authCode);
		    
		    return authCode;
		}
		
		public boolean sendVerificationEmail(String email, String authCode) {
	        // SMTP settings for sending email
			String host = "smtp.gmail.com";
	        String username = "zhdzhdvksvks@gmail.com";
	        String password = "onbf dduh yumf xkqd";

	        // Email content and delivery settings
	        String subject = "이메일 인증";
	        String content = "인증번호: " + authCode;

	        Properties props = new Properties();
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.starttls.enable", "true"); // Enable TLS connection

	        // Additional properties for SSL
	        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
	        props.put("mail.smtp.socketFactory.port", "465"); // Use port 465 for SSL
	        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

	        try {
	            // Create a session with the properties
	            Session emailSession = Session.getInstance(props, new Authenticator() {
	                protected PasswordAuthentication getPasswordAuthentication() {
	                    return new PasswordAuthentication(username, password);
	                }
	            });

	            // Set additional properties for the Transport object
	            Transport transport = emailSession.getTransport("smtp");
	            transport.connect(host, username, password);

	            // Send email
	            MimeMessage message = new MimeMessage(emailSession);
	            message.setFrom(new InternetAddress(username));
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
	            message.setSubject(subject);
	            message.setContent(content, "text/html;charset=utf-8");
	            transport.sendMessage(message, message.getAllRecipients());
	            transport.close();

	            return true; // Email sent successfully
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	            }
	    }
		
		
		
//		송다희 수정
//		마이페이지 - 닉네임 수정 
		public int updateNic(MemberVO vo) {
			int n = 0;
			try {
				connect();
				sql = "UPDATE member set nickname = ?, phone_number = ? where member_id = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, vo.getNickname());
				psmt.setString(2, vo.getPhoneNumber());
				psmt.setString(3, vo.getMemberId());
				n = psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();                                                               
			} finally {
				disconnect();
			}
			return n;
		}
		
//		마이페이지 - 회워정보 띄우기(한 건 조회)
		public MemberVO memberOne(MemberVO vo) {
			try {
				connect();
				sql = "select member_id, REGEXP_REPLACE(phone_number, '(.{3})(.+)(.{4})', '\\1-\\2-\\3') tel_no2 , email_vrf, nickname, email, rating_score\r\n"
						+ "from member\r\n"
						+ "where member_id = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, vo.getMemberId());
				rs = psmt.executeQuery();
				if(rs.next()) {
					vo.setMemberId(rs.getString("member_id"));
					vo.setPhoneNumber(rs.getString("tel_no2"));
					vo.setEmailVrf(rs.getString("email_vrf"));
					vo.setNickname(rs.getString("nickname"));
					vo.setEmail(rs.getString("email"));
					vo.setRatingScore(rs.getInt("rating_score"));
					// while 안 쓰는 건 어차피 값이 하나라 확인만 하면 됨.
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				disconnect();
			}
			return vo;
		}
		
		// 마이페이지 회원 비밀번호 변경
		public int updatePwd(MemberVO vo, String pwd,String newPwd) {
			int result = 0;
			
			try {
				connect();
				sql = "update member\r\n"
						+ "set password = ?"
						+ "where member_id=? AND password = ?";
				psmt = conn.prepareStatement(sql);
				
				
				// 입력받은 비밀번호를 암호화하여 쿼리에 넣습니다.
				String encryptedPassword = encryptPassword(pwd);
				String newencryptedPassword = encryptPassword(newPwd);

				// 암호화한 비밀번호 확인
				System.out.println(encryptedPassword);
				psmt.setString(1, newencryptedPassword);
				psmt.setString(2, vo.getMemberId());
				psmt.setString(3, encryptedPassword);
			
				result = psmt.executeUpdate();
				System.out.println(vo.getMemberId() + "비밀번호 업데이트~!~!");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}

			return result;
		}
}

