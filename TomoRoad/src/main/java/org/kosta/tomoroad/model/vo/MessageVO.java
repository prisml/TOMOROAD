package org.kosta.tomoroad.model.vo;

public class MessageVO {

	private int no;
	private String sender;
	private String receiver;
	private String time;
	private String text;
	private int checked;

 
public MessageVO() {
	super();
}


public MessageVO(int no, String sender, String receiver, String time, String text, int checked) {
	super();
	this.no = no;
	this.sender = sender;
	this.receiver = receiver;
	this.time = time;
	this.text = text;
	this.checked = checked;
}


public int getNo() {
	return no;
}


public void setNo(int no) {
	this.no = no;
}


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


public String getTime() {
	return time;
}


public void setTime(String time) {
	this.time = time;
}


public String getText() {
	return text;
}


public void setText(String text) {
	this.text = text;
}


public int getChecked() {
	return checked;
}


public void setChecked(int checked) {
	this.checked = checked;
}


@Override
public String toString() {
	return "MessageVO [no=" + no + ", sender=" + sender + ", receiver=" + receiver + ", time=" + time + ", text=" + text
			+ ", checked=" + checked + "]";
}



}