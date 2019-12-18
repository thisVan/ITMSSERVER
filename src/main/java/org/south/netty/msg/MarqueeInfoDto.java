package org.south.netty.msg;

import java.io.Serializable;
import java.util.List;

public class MarqueeInfoDto implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -263404056072350042L;

	private String start;
	
	private String end;
	
	private int positionX;
	
	private int positionY;
	
	private List<FileDto> file;
		
	private String periodId;  //时段id
	
	private String marqueeName;     

	private String mid;        //该时段对应的播表id

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public int getPositionX() {
		return positionX;
	}

	public void setPositionX(int i) {
		this.positionX = i;
	}

	public int getPositionY() {
		return positionY;
	}
	
	public void setPositionY(int positionY) {
		this.positionY = positionY;
	}


	public String getPeriodId() {
		return periodId;
	}

	public void setPeriodId(String periodId) {
		this.periodId = periodId;
	}

	public String getMarqueeName() {
		return marqueeName;
	}

	public void setMarqueeName(String marqueeName) {
		this.marqueeName = marqueeName;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}



	public List<FileDto> getFile() {
		return file;
	}

	public void setFile(List<FileDto> file) {
		this.file = file;
	}

	public MarqueeInfoDto() {
		super();
	}

	
	public MarqueeInfoDto(String start, String end, int positionX, int positionY, List<FileDto> file, String periodId,
			String marqueeName, String mid) {
		super();
		this.start = start;
		this.end = end;
		this.positionX = positionX;
		this.positionY = positionY;
		this.file = file;
		this.periodId = periodId;
		this.marqueeName = marqueeName;
		this.mid = mid;
	}

	@Override
	public String toString() {
		return "MarqueeInfoDto [start=" + start + ", end=" + end + ", positionX=" + positionX + ", positionY="
				+ positionY + ", file=" + file + ", periodId=" + periodId + ", marqueeName=" + marqueeName + ", mid="
				+ mid + "]";
	}
	
	
	
	
	
	
}
