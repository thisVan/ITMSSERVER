/* author:bobo    
 * time:2019-10-31
 */
package org.south.itms.entity;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "action_log")
public class UserActionLog {
	
	private String actionLogId;
	private String userName;
	private String roleName;
	private String operationTime;
	private String operation;
	private String modifyObjectType;
	private String modifyObjectName;
	private String modifyObjectId;
	
	
	
	public UserActionLog(){
		
	}
	
	public UserActionLog(String userName,String roleName,String operationTime,
			String operation,String modifyObjectName,String modifyObjectType,String modifyObjectId){
		
		this.userName = userName;
		this.roleName = roleName;
		this.operationTime = operationTime;
		this.operation = operation;
		this.modifyObjectName = modifyObjectName;
		this.modifyObjectType = modifyObjectType;
		this.modifyObjectId = modifyObjectId;
	}

	@Id
	@Column(name = "action_log_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public String getActionLogId() {
		return actionLogId;
	}

	public void setActionLogId(String actionLogId) {
		this.actionLogId = actionLogId;
	}
	
	@Column(name = "role_name")
	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	@Column(name = "modify_object_type")
	public String getModifyObjectType() {
		return modifyObjectType;
	}

	public void setModifyObjectType(String modifyObjectType) {
		this.modifyObjectType = modifyObjectType;
	}

	@Column(name = "modify_object_name")
	public String getModifyObjectName() {
		return modifyObjectName;
	}

	public void setModifyObjectName(String modifyObjectName) {
		this.modifyObjectName = modifyObjectName;
	}
	
	@Column(name = "user_name")
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Column(name = "operation_time")
	public String getOperationTime() {
		return operationTime;
	}
	
	public void setOperationTime(String operationTime) {
		this.operationTime = operationTime;
	}
	
	@Column(name = "operation")
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	@Column(name = "modify_object_id")
	public String getModifyObjectId() {
		return modifyObjectId;
	}

	public void setModifyObjectId(String modifyObjectId) {
		this.modifyObjectId = modifyObjectId;
	}

	
	@Override
	public String toString() {
		return 	" userName=" + userName + ", userRole=" + roleName
				+ ", operationTime=" + operationTime + ", operation=" + operation
				+ ", modifyObjectType=" + modifyObjectType
				+ ", modifyObjectName=" + modifyObjectName
				+ ", modifyObjectId="   + modifyObjectId; 
	}
}
