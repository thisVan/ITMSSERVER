package org.south.itms.entity;

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

/**
 * @author jan
 * @date 2018年1月20日 上午10:57:52
 * @version V1.0 
 */
@Entity
@Table(name = "material")
public class Material implements java.io.Serializable {

/** 
	 * @since JDK 1.6 
	 */ 
	private static final long serialVersionUID = -712729945398469188L;

    private String mid;
	
	private String materialName;
	
	private String fileName;
	
	private String fileType;
	
	private String filePath;
	
	private String uploadName;
	
	private Date uploadTime;
	
	private int deleted;
	
	private int duration;
	
	private String size;
	
	private String md5;
	
	private String checkName;
	
	private Date checkTime;

	private String checkSecondName;

	private Date checkSecondTime;
	
	private String statusId;
	
	private Terminal terminal;
	
	private String resolution;
	
	private String info;
	
	private int usedNum;
	
	private String tis;

	private String unAccessReason;

	@Id
	@Column(name = "mid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	@Column(name = "material_name")
	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	@Column(name = "file_name")
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Column(name = "file_type")
	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	@Column(name = "file_path")
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Column(name = "upload_name")
	public String getUploadName() {
		return uploadName;
	}

	public void setUploadName(String uploadName) {
		this.uploadName = uploadName;
	}

	@Column(name = "upload_time")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	@Column(name = "deleted")
	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

	@Column(name = "duration")
	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	@Column(name = "size")
	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	@Column(name = "md5")
	public String getMd5() {
		return md5;
	}

	public void setMd5(String md5) {
		this.md5 = md5;
	}

	@Column(name = "check_name")
	public String getCheckName() {
		return checkName;
	}

	public void setCheckName(String checkName) {
		this.checkName = checkName;
	}

	@Column(name = "check_time")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getCheckTime() {
		return checkTime;
	}

	public void setCheckTime(Date checkTime) {
		this.checkTime = checkTime;
	}

	@Column(name = "check_second_name")
	public String getCheckSecondName() {
		return checkSecondName;
	}

	public void setCheckSecondName(String checkSecondName) {
		this.checkSecondName = checkSecondName;
	}

	@Column(name = "check_second_time")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getCheckSecondTime() {
		return checkSecondTime;
	}

	public void setCheckSecondTime(Date checkSecondTime) {
		this.checkSecondTime = checkSecondTime;
	}

	@Column(name = "status_id")
	public String getStatusId() {
		return statusId;
	}

	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}

	@OneToOne
	@JoinColumn(name = "terminal_id")
	public Terminal getTerminal() {
		return terminal;
	}

	public void setTerminal(Terminal terminal) {
		this.terminal = terminal;
	}

	@Column(name = "resolution")
	public String getResolution() {
		return resolution;
	}

	public void setResolution(String resolution) {
		this.resolution = resolution;
	}

	@Column(name = "info")
	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	@Column(name = "used_num")
	public int getUsedNum() {
		return usedNum;
	}

	public void setUsedNum(int usedNum) {
		this.usedNum = usedNum;
	}

	@Column(name = "tis")
	public String getTis() {
		return tis;
	}

	public void setTis(String tis) {
		this.tis = tis;
	}

	@Column(name = "un_access_reason")
	public String getUnAccessReason() {
		return unAccessReason;
	}

	public void setUnAccessReason(String unAccessReason) {
		this.unAccessReason = unAccessReason;
	}

	public Material() {
		super();
	}

	public Material(String mid, String materialName, String fileName, String fileType, String filePath,
			String uploadName, Date uploadTime, int deleted, int duration, String size, String md5, String checkName,
			Date checkTime, String statusId, Terminal terminal, String resolution, String info, int usedNum) {
		super();
		this.mid = mid;
		this.materialName = materialName;
		this.fileName = fileName;
		this.fileType = fileType;
		this.filePath = filePath;
		this.uploadName = uploadName;
		this.uploadTime = uploadTime;
		this.deleted = deleted;
		this.duration = duration;
		this.size = size;
		this.md5 = md5;
		this.checkName = checkName;
		this.checkTime = checkTime;
		this.statusId = statusId;
		this.terminal = terminal;
		this.resolution = resolution;
		this.info = info;
		this.usedNum = usedNum;
	}
	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((checkName == null) ? 0 : checkName.hashCode());
		result = prime * result + ((checkTime == null) ? 0 : checkTime.hashCode());
		result = prime * result + deleted;
		result = prime * result + duration;
		result = prime * result + ((fileName == null) ? 0 : fileName.hashCode());
		result = prime * result + ((filePath == null) ? 0 : filePath.hashCode());
		result = prime * result + ((fileType == null) ? 0 : fileType.hashCode());
		result = prime * result + ((info == null) ? 0 : info.hashCode());
		result = prime * result + ((materialName == null) ? 0 : materialName.hashCode());
		result = prime * result + ((md5 == null) ? 0 : md5.hashCode());
		result = prime * result + ((mid == null) ? 0 : mid.hashCode());
		result = prime * result + ((resolution == null) ? 0 : resolution.hashCode());
		result = prime * result + ((size == null) ? 0 : size.hashCode());
		result = prime * result + ((statusId == null) ? 0 : statusId.hashCode());
		result = prime * result + ((terminal == null) ? 0 : terminal.hashCode());
		result = prime * result + ((tis == null) ? 0 : tis.hashCode());
		result = prime * result + ((uploadName == null) ? 0 : uploadName.hashCode());
		result = prime * result + ((uploadTime == null) ? 0 : uploadTime.hashCode());
		result = prime * result + usedNum;
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
		Material other = (Material) obj;
		if (checkName == null) {
			if (other.checkName != null)
				return false;
		} else if (!checkName.equals(other.checkName))
			return false;
		if (checkTime == null) {
			if (other.checkTime != null)
				return false;
		} else if (!checkTime.equals(other.checkTime))
			return false;
		if (deleted != other.deleted)
			return false;
		if (duration != other.duration)
			return false;
		if (fileName == null) {
			if (other.fileName != null)
				return false;
		} else if (!fileName.equals(other.fileName))
			return false;
		if (filePath == null) {
			if (other.filePath != null)
				return false;
		} else if (!filePath.equals(other.filePath))
			return false;
		if (fileType == null) {
			if (other.fileType != null)
				return false;
		} else if (!fileType.equals(other.fileType))
			return false;
		if (info == null) {
			if (other.info != null)
				return false;
		} else if (!info.equals(other.info))
			return false;
		if (materialName == null) {
			if (other.materialName != null)
				return false;
		} else if (!materialName.equals(other.materialName))
			return false;
		if (md5 == null) {
			if (other.md5 != null)
				return false;
		} else if (!md5.equals(other.md5))
			return false;
		if (mid == null) {
			if (other.mid != null)
				return false;
		} else if (!mid.equals(other.mid))
			return false;
		if (resolution == null) {
			if (other.resolution != null)
				return false;
		} else if (!resolution.equals(other.resolution))
			return false;
		if (size == null) {
			if (other.size != null)
				return false;
		} else if (!size.equals(other.size))
			return false;
		if (statusId == null) {
			if (other.statusId != null)
				return false;
		} else if (!statusId.equals(other.statusId))
			return false;
		if (terminal == null) {
			if (other.terminal != null)
				return false;
		} else if (!terminal.equals(other.terminal))
			return false;
		if (tis == null) {
			if (other.tis != null)
				return false;
		} else if (!tis.equals(other.tis))
			return false;
		if (uploadName == null) {
			if (other.uploadName != null)
				return false;
		} else if (!uploadName.equals(other.uploadName))
			return false;
		if (uploadTime == null) {
			if (other.uploadTime != null)
				return false;
		} else if (!uploadTime.equals(other.uploadTime))
			return false;
		if (usedNum != other.usedNum)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Material [mid=" + mid + ", materialName=" + materialName + ", fileName=" + fileName + ", fileType="
				+ fileType + ", filePath=" + filePath + ", uploadName=" + uploadName + ", uploadTime=" + uploadTime
				+ ", deleted=" + deleted + ", duration=" + duration + ", size=" + size + ", md5=" + md5 + ", checkName="
				+ checkName + ", checkTime=" + checkTime + ", statusId=" + statusId + ", terminal=" + terminal
				+ ", resolution=" + resolution + ", info=" + info + "]";
	}
}
