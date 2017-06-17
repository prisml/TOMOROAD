package org.kosta.tomoroad.model.vo;

import com.google.gson.Gson;

public class MessageVO {
/*
	private int no;
	private String sender;
	private String receiver;
	private String time;
	private String text;
	private int checked;

}
*/
private String message;
private String type;
private String to;

 
public MessageVO() {
	super();
}

public MessageVO(String message, String type, String to) {
	super();
	this.message = message;
	this.type = type;
	this.to = to;
}



public static MessageVO converMessage(String source) {
    MessageVO message = new MessageVO();   
    Gson gson = new Gson();
  
    message = gson.fromJson(source, MessageVO.class);
 
    return message;
}

public String getMessage() {
	return message;
}

public void setMessage(String message) {
	this.message = message;
}

public String getType() {
	return type;
}

public void setType(String type) {
	this.type = type;
}

public String getTo() {
	return to;
}

public void setTo(String to) {
	this.to = to;
}


}