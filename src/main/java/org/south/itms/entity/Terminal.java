package org.south.itms.entity;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * @author: yezilong
 */

@Entity  
@Table(name = "terminal")  
public class Terminal implements java.io.Serializable{// 终端类
	
	private static final long serialVersionUID = 7882532137562534977L;
	
	private String terminalId;
	private String serialNumber;
	private String terminalName;
	private String terminalDescribe;
	private String ip;
	private String macAddr;
	private int resolutionLength;
	private int resolutionWidth;
	private int ledLength;
	private int ledWidth;
	private int startSpotTop;
	private int startSpotLeft;
	private Date runStartTime;
	private Date runEndTime;
	private String areaCode;
	private String areaName;
	private String detailAddress;
	private String state;
	private int deleted;
	
	
	
	//逻辑外键关联
	//private String pid;
	//private String pname;
	
	//连接密码(用于终端连接时的校验)
	private String connectPassword;

	@Id
	@Column(name = "terminal_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public String getTerminalId() {
		return terminalId;
	}

	public void setTerminalId(String terminalId) {
		this.terminalId = terminalId;
	}

	@Column(name = "serial_number")
	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	@Column(name = "terminal_name")
	public String getTerminalName() {
		return terminalName;
	}

	public void setTerminalName(String terminalName) {
		this.terminalName = terminalName;
	}

	@Column(name = "terminal_describe")
	public String getTerminalDescribe() {
		return terminalDescribe;
	}

	public void setTerminalDescribe(String terminalDescribe) {
		this.terminalDescribe = terminalDescribe;
	}

	@Column(name = "ip")
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Column(name = "mac_addr")
	public String getMacAddr() {
		return macAddr;
	}

	public void setMacAddr(String macAddr) {
		this.macAddr = macAddr;
	}

	@Column(name = "resolution_length")
	public int getResolutionLength() {
		return resolutionLength;
	}

	public void setResolutionLength(int resolutionLength) {
		this.resolutionLength = resolutionLength;
	}

	@Column(name = "resolution_width")
	public int getResolutionWidth() {
		return resolutionWidth;
	}

	public void setResolutionWidth(int resolutionWidth) {
		this.resolutionWidth = resolutionWidth;
	}

	@Column(name = "led_length")
	public int getLedLength() {
		return ledLength;
	}

	public void setLedLength(int ledLength) {
		this.ledLength = ledLength;
	}

	@Column(name = "led_width")
	public int getLedWidth() {
		return ledWidth;
	}

	public void setLedWidth(int ledWidth) {
		this.ledWidth = ledWidth;
	}

	@Column(name = "start_spot_top")
	public int getStartSpotTop() {
		return startSpotTop;
	}

	public void setStartSpotTop(int startSpotTop) {
		this.startSpotTop = startSpotTop;
	}

	@Column(name = "start_spot_left")
	public int getStartSpotLeft() {
		return startSpotLeft;
	}

	public void setStartSpotLeft(int startSpotLeft) {
		this.startSpotLeft = startSpotLeft;
	}

	@Column(name = "area_code")
	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	@Column(name = "area_name")
	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	@Column(name = "detail_address")
	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	@Column(name = "state")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "deleted")
	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

	@Column(name = "run_start_time")
	@Temporal(TemporalType.TIME) 
	public Date getRunStartTime() {
		return runStartTime;
	}

	public void setRunStartTime(Date runStartTime) {
		this.runStartTime = runStartTime;
	}

	@Column(name = "run_end_time")
	@Temporal(TemporalType.TIME) 
	public Date getRunEndTime() {
		return runEndTime;
	}

	public void setRunEndTime(Date runEndTime) {
		this.runEndTime = runEndTime;
	}
	
//	@Column(name = "pid")
//	public String getPid() {
//		return pid;
//	}
//
//	public void setPid(String pid) {
//		this.pid = pid;
//	}
//
//	@Column(name = "pname")
//	public String getPname() {
//		return pname;
//	}
//
//	public void setPname(String pname) {
//		this.pname = pname;
//	}
	

	@Column(name = "connect_password")
	public String getConnectPassword() {
		return connectPassword;
	}

	public void setConnectPassword(String connectPassword) {
		this.connectPassword = connectPassword;
	}
	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((areaCode == null) ? 0 : areaCode.hashCode());
		result = prime * result + ((areaName == null) ? 0 : areaName.hashCode());
		result = prime * result + ((connectPassword == null) ? 0 : connectPassword.hashCode());
		result = prime * result + deleted;
		result = prime * result + ((detailAddress == null) ? 0 : detailAddress.hashCode());
		result = prime * result + ((ip == null) ? 0 : ip.hashCode());
		result = prime * result + ledLength;
		result = prime * result + ledWidth;
		result = prime * result + ((macAddr == null) ? 0 : macAddr.hashCode());
		result = prime * result + resolutionLength;
		result = prime * result + resolutionWidth;
		result = prime * result + ((runEndTime == null) ? 0 : runEndTime.hashCode());
		result = prime * result + ((runStartTime == null) ? 0 : runStartTime.hashCode());
		result = prime * result + ((serialNumber == null) ? 0 : serialNumber.hashCode());
		result = prime * result + startSpotLeft;
		result = prime * result + startSpotTop;
		result = prime * result + ((state == null) ? 0 : state.hashCode());
		result = prime * result + ((terminalDescribe == null) ? 0 : terminalDescribe.hashCode());
		result = prime * result + ((terminalId == null) ? 0 : terminalId.hashCode());
		result = prime * result + ((terminalName == null) ? 0 : terminalName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Terminal other = (Terminal) obj;
		if (areaCode == null) {
			if (other.areaCode != null)
				return false;
		} else if (!areaCode.equals(other.areaCode))
			return false;
		if (areaName == null) {
			if (other.areaName != null)
				return false;
		} else if (!areaName.equals(other.areaName))
			return false;
		if (connectPassword == null) {
			if (other.connectPassword != null)
				return false;
		} else if (!connectPassword.equals(other.connectPassword))
			return false;
		if (deleted != other.deleted)
			return false;
		if (detailAddress == null) {
			if (other.detailAddress != null)
				return false;
		} else if (!detailAddress.equals(other.detailAddress))
			return false;
		if (ip == null) {
			if (other.ip != null)
				return false;
		} else if (!ip.equals(other.ip))
			return false;
		if (ledLength != other.ledLength)
			return false;
		if (ledWidth != other.ledWidth)
			return false;
		if (macAddr == null) {
			if (other.macAddr != null)
				return false;
		} else if (!macAddr.equals(other.macAddr))
			return false;
		if (resolutionLength != other.resolutionLength)
			return false;
		if (resolutionWidth != other.resolutionWidth)
			return false;
		if (runEndTime == null) {
			if (other.runEndTime != null)
				return false;
		} else if (!runEndTime.equals(other.runEndTime))
			return false;
		if (runStartTime == null) {
			if (other.runStartTime != null)
				return false;
		} else if (!runStartTime.equals(other.runStartTime))
			return false;
		if (serialNumber == null) {
			if (other.serialNumber != null)
				return false;
		} else if (!serialNumber.equals(other.serialNumber))
			return false;
		if (startSpotLeft != other.startSpotLeft)
			return false;
		if (startSpotTop != other.startSpotTop)
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		if (terminalDescribe == null) {
			if (other.terminalDescribe != null)
				return false;
		} else if (!terminalDescribe.equals(other.terminalDescribe))
			return false;
		if (terminalId == null) {
			if (other.terminalId != null)
				return false;
		} else if (!terminalId.equals(other.terminalId))
			return false;
		if (terminalName == null) {
			if (other.terminalName != null)
				return false;
		} else if (!terminalName.equals(other.terminalName))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Terminal [terminalId=" + terminalId + ", serialNumber=" + serialNumber + ", terminalName="
				+ terminalName + ", terminalDescribe=" + terminalDescribe + ", ip=" + ip + ", macAddr=" + macAddr
				+ ", resolutionLength=" + resolutionLength + ", resolutionWidth=" + resolutionWidth + ", ledLength="
				+ ledLength + ", ledWidth=" + ledWidth + ", startSpotTop=" + startSpotTop + ", startSpotLeft="
				+ startSpotLeft + ", runStartTime=" + runStartTime + ", runEndTime=" + runEndTime + ", areaCode="
				+ areaCode + ", areaName=" + areaName + ", detailAddress=" + detailAddress + ", state=" + state
				+ ", deleted=" + deleted + ", connectPassword=" + connectPassword
				+ "]";
	}

}
