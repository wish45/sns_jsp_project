package mysns.sns;

import java.util.ArrayList;

public class MessageDTO {
	//메시지
	private MessageVO message;
	//해당 메시지에 대한 댓글 목록.
	private ArrayList<ReplyVO> rlist=new ArrayList<ReplyVO>();
	public MessageVO getMessage() {
		return message;
	}
	public void setMessage(MessageVO message) {
		this.message=message;
	}
	public ArrayList<ReplyVO> getRlist(){
		return rlist;
	}
	public void setRlist(ArrayList<ReplyVO> rlist) {
		this.rlist=rlist;
	}
}
