package org.south.itms.dto;

import java.sql.Time;
import java.util.Date;

/**
 * @author jan
 * @date 2018年1月15日 下午2:38:51
 * @version V1.0 
 */
public class PtableDto {

	private String pid;
	
	private String terminalName;
	
	private String statusId;
	
	private String playTotalTime;
	
	private Date playDate;
	
	private String screenRate;
	
	private String allTime;
	
	private String ptableName;
	
	private String createName;
	
	private Date createTime;
	
	private Date modifyTime;
	
	private String periodName;
	
	private String periodTime;
	
	private String mark;
	
	private int insertFlag;
	
	private int min;
	
	private int state;
	
    private Time startTime;
	
	private Time endTime;
	
	private String tid;
	
	private int duraTime;

	private String checkName;

	private Date checkTime;

	private String checkSecondName;

	private Date checkSecondTime;

	private String unAccessReason;

	private String periodSName;

	private Time startInterval;

	private Time endInterval;


	public String getCheckName() {
		return checkName;
	}

	public void setCheckName(String checkName) {
		this.checkName = checkName;
	}

	public Date getCheckTime() {
		return checkTime;
	}

	public void setCheckTime(Date checkTime) {
		this.checkTime = checkTime;
	}

	public void setCheckSecondName(String checkSecondName) {
		this.checkSecondName = checkSecondName;
	}

	public void setCheckSecondTime(Date checkSecondTime) {
		this.checkSecondTime = checkSecondTime;
	}

	public String getCheckSecondName() {
		return checkSecondName;
	}

	public Date getCheckSecondTime() {
		return checkSecondTime;
	}

	public void setUnAccessReason(String unAccessReason) {
		this.unAccessReason = unAccessReason;
	}

	public String getUnAccessReason() {
		return unAccessReason;
	}

	public int getDuraTime() {
		return duraTime;
	}

	public void setDuraTime(int duraTime) {
		this.duraTime = duraTime;
	}

	public int getInsertFlag() {
		return insertFlag;
	}

	public void setInsertFlag(int insertFlag) {
		this.insertFlag = insertFlag;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getTerminalName() {
		return terminalName;
	}

	public void setTerminalName(String terminalName) {
		this.terminalName = terminalName;
	}

	public String getStatusId() {
		return statusId;
	}

	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}

	public String getPlayTotalTime() {
		return playTotalTime;
	}

	public void setPlayTotalTime(String playTotalTime) {
		this.playTotalTime = playTotalTime;
	}

	public Date getPlayDate() {
		return playDate;
	}

	public void setPlayDate(Date playDate) {
		this.playDate = playDate;
	}

	public String getScreenRate() {
		return screenRate;
	}

	public void setScreenRate(String screenRate) {
		this.screenRate = screenRate;
	}

	public String getAllTime() {
		return allTime;
	}

	public void setAllTime(String allTime) {
		this.allTime = allTime;
	}

	public String getPtableName() {
		return ptableName;
	}

	public void setPtableName(String ptableName) {
		this.ptableName = ptableName;
	}

	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}

	public Date getCreateTime() {
		return createTime;
	}
	
	public Date getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getPeriodName() {
		return periodName;
	}

	public void setPeriodName(String periodName) {
		this.periodName = periodName;
	}

	public String getPeriodTime() {
		return periodTime;
	}

	public void setPeriodTime(String periodTime) {
		this.periodTime = periodTime;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Time getStartTime() {
		return startTime;
	}

	public void setStartTime(Time startTime) {
		this.startTime = startTime;
	}

	public Time getEndTime() {
		return endTime;
	}

	public void setEndTime(Time endTime) {
		this.endTime = endTime;
	}

	public String getPeriodSName() {
		return periodSName;
	}

	public void setPeriodSName(String periodSName) {
		this.periodSName = periodSName;
	}

	public Time getStartInterval() {
		return startInterval;
	}

	public void setStartInterval(Time startInterval) {
		this.startInterval = startInterval;
	}

	public Time getEndInterval() {
		return endInterval;
	}

	public void setEndInterval(Time endInterval) {
		this.endInterval = endInterval;
	}

	public String gettid() {
		return tid;
	}

	public void settid(String terminalId) {
		this.tid = terminalId;
	}

	public PtableDto() {
		super();
	}

	public PtableDto(String TerminalId,String pid, String statusId, String playTotalTime, Date playDate, String screenRate,
			String allTime, String ptableName, Date createTime, Date modifyTime, int min, int insertFlag, int state, String checkName, Date checkTime, String checkSecondName, Date checkSecondTime, String unAccessReason, String periodSName,Time startInterval, Time endInterval) {
		super();
		this.tid=TerminalId;
		this.pid = pid;
		this.statusId = statusId;
		this.playTotalTime = playTotalTime;
		this.playDate = playDate;
		this.screenRate = screenRate;
		this.allTime = allTime;
		this.ptableName = ptableName;
		this.createTime = createTime;
		this.modifyTime = modifyTime;
		this.min = min;
		this.insertFlag = insertFlag;
		this.state = state;
		this.checkName = checkName;
		this.checkTime = checkTime;
		this.checkSecondName = checkSecondName;
		this.checkSecondTime = checkSecondTime;
		this.unAccessReason = unAccessReason;

		this.periodSName = periodSName;
		this.startInterval = startInterval;
		this.endInterval = endInterval;
	}

	/*@Override
	public String toString() {
		return "PtableDto [pid=" + pid + ", terminalName=" + terminalName + ", statusId=" + statusId
				+ ", playTotalTime=" + playTotalTime + ", playDate=" + playDate + ", screenRate=" + screenRate
				+ ", allTime=" + allTime + ", ptableName=" + ptableName + ", createName=" + createName + ", createTime="
				+ createTime + ", periodName=" + periodName + ", periodTime=" + periodTime + "]";
	}*/



	@Override
	public String toString() {
		return "PtableDto [pid=" + pid + ", terminalName=" + terminalName + ", statusId=" + statusId
				+ ", playTotalTime=" + playTotalTime + ", playDate=" + playDate + ", screenRate=" + screenRate
				+ ", allTime=" + allTime + ", ptableName=" + ptableName + ", createName=" + createName + ", createTime="
				+ createTime + ", periodName=" + periodName + ", periodTime=" + periodTime + ", mark=" + mark
				+ ", insertFlag=" + insertFlag + ", min=" + min + ", state=" + state + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", tid=" + tid + ", checkName=" + checkName + ", checkTime=" + checkTime
				+ ", checkSecondName=" + checkSecondName + ", checkSecondTime=" + checkSecondTime + ", unAccessReason=" + unAccessReason
				+ ", periodSName=" + periodSName + ", startInterval=" + startInterval + ", endInterval=" + endInterval + "]";
	}
	

	
}
