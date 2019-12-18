package org.south.itms.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@Entity
@Table(name = "marquee")
public class Marquee implements Serializable{
	
	private static final long serialVersionUID = -4164691477062386988L;
	private String mid;
	private String materialId;
	private String marqName;
	private String fileName;
	private String filePath;
	private String fileType;
	private String size;
	private String resolution;
	private String terminalId;
	private String md5;
	private String mark;
	private String userName;
	private String periodId;
	private String statusId;
	private int opacity;
	private Date createTime;
	private Date startDate;
	private Date endDate;
	private int deleted;
	private String firstcheckName;
	private String secondcheckName;
	private int positionX;
	private int positionY;
	@Id
	@Column(name = "mid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	@Column(name = "mark")
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	@Column(name = "terminal_id")
	public String getTerminalId() {
		return terminalId;
	}
	public void setTerminalId(String terminalId) {
		this.terminalId = terminalId;
	}
	@Column(name = "user_name")
	public String getUserName() {
		return userName;
	}
	@Column(name = "opacity")
	public int getOpacity() {
		return opacity;
	}
	public void setOpacity(int opacity) {
		this.opacity = opacity;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Column(name = "start_date")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	@Column(name = "end_date")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	@Column(name = "material_id")
	public String getMaterialId() {
		return materialId;
	}
	public void setMaterialId(String materialId) {
		this.materialId = materialId;
	}
	@Column(name = "marq_name")
	public String getMarqName() {
		return marqName;
	}
	public void setMarqName(String marqName) {
		this.marqName = marqName;
	}
	@Column(name = "file_name")
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Column(name = "file_path")
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	@Column(name = "file_type")
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	@Column(name = "size")
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	@Column(name = "resolution")
	public String getResolution() {
		return resolution;
	}
	public void setResolution(String resolution) {
		this.resolution = resolution;
	}
	
	@Column(name = "md5")
	public String getMd5() {
		return md5;
	}
	public void setMd5(String md5) {
		this.md5 = md5;
	}
	
	@Column(name = "period_id")
	public String getPeriodId() {
		return periodId;
	}
	public void setPeriodId(String periodId) {
		this.periodId = periodId;
	}
	@Column(name = "status_id")
	public String getStatusId() {
		return statusId;
	}
	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}
	@Column(name = "create_time")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Column(name = "deleted")
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	@Column(name = "firstcheck_name")
	public String getFirstcheckName() {
		return firstcheckName;
	}
	public void setFirstcheckName(String firstcheckName) {
		this.firstcheckName = firstcheckName;
	}
	@Column(name = "secondcheck_name")
	public String getSecondcheckName() {
		return secondcheckName;
	}
	public void setSecondcheckName(String secondcheckName) {
		this.secondcheckName = secondcheckName;
	}
	@Column(name = "position_x")
	public int getPositionX() {
		return positionX;
	}
	public void setPositionX(int positionX) {
		this.positionX = positionX;
	}
	@Column(name = "position_y")
	public int getPositionY() {
		return positionY;
	}
	public void setPositionY(int positionY) {
		this.positionY = positionY;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Marquee [mid=" + mid + ", materialId=" + materialId + ", marqName=" + marqName + ", fileName="
				+ fileName + ", filePath=" + filePath + ", fileType=" + fileType + ", size=" + size + ", resolution="
				+ resolution + ", terminalId=" + terminalId + ", md5=" + md5 + ", userName=" + userName + ", periodId="
				+ periodId + ", statusId=" + statusId + ", opacity=" + opacity + 
				", createTime=" + createTime + ", startDate=" + startDate + ", endDate=" + endDate + ", deleted="
				+ deleted + ", firstcheckName=" + firstcheckName + ", secondcheckName=" + secondcheckName
				+ ", positionX=" + positionX + ", positionY=" + positionY + "]";
	}

	
}
