package ams.db;

public class StudentLeave 
{
		private String regdno;
		private String emailid;
		private String to;
		private String from;
		private String message,status;
		
		
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getRegdno() {
			return regdno;
		}
		public void setRegdno(String regdno) {
			this.regdno = regdno;
		}
		public String getEmailid() {
			return emailid;
		}
		public void setEmailid(String emailid) {
			this.emailid = emailid;
		}
		public String getTo() {
			return to;
		}
		public void setTo(String to) {
			this.to = to;
		}
		public String getFrom() {
			return from;
		}
		
		public void setFrom(String from) {
			this.from = from;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		
		
}
