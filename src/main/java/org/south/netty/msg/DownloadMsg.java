package org.south.netty.msg;

import java.util.Arrays;

/**
 * @author: yezilong
 */

public class DownloadMsg extends ResultMsg { //

	private String fileName;
	private byte[] attachment;
	
	public DownloadMsg() {
		super();
		setReplyType(MsgType.Download);
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public byte[] getAttachment() {
		return attachment;
	}

	public void setAttachment(byte[] attachment) {
		this.attachment = attachment;
	}
	

}
