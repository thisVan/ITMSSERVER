package org.south.itms.dto;

import org.south.itms.entity.Marquee;

public class MarqueeDto extends Marquee
{
	private String terminalName;
	private String playDate;
	private String periodName;
	public String getPeriodName() {
		return periodName;
	}

	public void setPeriodName(String periodName) {
		this.periodName = periodName;
	}

	public String getPlayDate() {
		return playDate;
	}

	public void setPlayDate(String playDate) {
		this.playDate = playDate;
	}

	public String getTerminalName() {
		return terminalName;
	}

	public void setTerminalName(String terminalName) {
		this.terminalName = terminalName;
	}
	
	public MarqueeDto(String terminalName,String playDate,String priodName) {
		super();
		this.terminalName=terminalName;
		this.playDate=playDate;
		this.periodName=priodName;
	}
	
	public MarqueeDto() {}

	@Override
	public String toString() {
		return "MarqueeDto [terminalName=" + terminalName +"toString:"+super.toString()+ "]";
	}

	

}
