package ams.db;

import java.sql.Timestamp;

public class ChatMessage {
 private String sender,receiver,message,status;
 public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
private Timestamp time;
public String getSender() {
	return sender;
}
public void setSender(String sender) {
	this.sender = sender;
}
public String getReceiver() {
	return receiver;
}
public void setReceiver(String receiver) {
	this.receiver = receiver;
}
public String getMessage() {
	return message;
}
public void setMessage(String message) {
	this.message = message;
}
public Timestamp getTime() {
	return time;
}
public void setTime(Timestamp time) {
	this.time = time;
}
}
