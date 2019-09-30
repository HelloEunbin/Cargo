package cargo.common.DTO;

import java.sql.Timestamp;
	
public class BoardqDTO {

	int no;
	String name;
	String subject;
	String content;
	int secret;
	int re_ref;
	int re_lev;
	int re_seq;
	Timestamp date;
	String email;
	int prent;
		
		
		public BoardqDTO(){}
		public BoardqDTO(int no, String name, String subject, String content, int secret, int re_ref, int re_lev, int re_seq, Timestamp date, String email, int prent){
			this.no = no;
			this.name= name;
			this.subject = subject;
			this.content = content;
			this.secret = secret;
			this.date = date;
			this.re_ref =re_ref;
			this.re_lev = re_lev;
			this.re_seq = re_lev;
			this.email = email;
			this.prent = prent;
		}
		
		
		public int getNo() {
			return no;
		}
		public void setNo(int no) {
			this.no = no;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}


	
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public int getSecret() {
			return secret;
		}
		public void setSecret(int secret) {
			this.secret = secret;
		}
		public int getRe_ref() {
			return re_ref;
		}
		public void setRe_ref(int re_ref) {
			this.re_ref = re_ref;
		}
		public int getRe_lev() {
			return re_lev;
		}
		public void setRe_lev(int re_lev) {
			this.re_lev = re_lev;
		}
		public int getRe_seq() {
			return re_seq;
		}
		public void setRe_seq(int re_seq) {
			this.re_seq = re_seq;
		}
		public Timestamp getDate() {
			return date;
		}
		public void setDate(Timestamp date) {
			this.date = date;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public int getPrent() {
			return prent;
		}
		public void setPrent(int prent) {
			this.prent = prent;
		}
	
		
		
		
		
	}
