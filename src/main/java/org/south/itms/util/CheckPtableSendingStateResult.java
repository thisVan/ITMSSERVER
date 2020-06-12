package org.south.itms.util;

/**
 * 播表自检重要信息的结果集
 * @author bobo
 * 2020/6/9
 */
public class CheckPtableSendingStateResult {

    private String pid;
    private String ptableName;
    private String terminalId;
    private String terminalName;
    private int sendingState;

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPtableName() {
        return ptableName;
    }

    public void setPtableName(String ptableName) {
        this.ptableName = ptableName;
    }

    public String getTerminalId() {
        return terminalId;
    }

    public void setTerminalId(String terminalId) {
        this.terminalId = terminalId;
    }

    public String getTerminalName() {
        return terminalName;
    }

    public void setTerminalName(String terminalName) {
        this.terminalName = terminalName;
    }

    public int getSendingState() {
        return sendingState;
    }

    public void setSendingState(int sendingState) {
        this.sendingState = sendingState;
    }

    @Override
    public String toString() {
        return "CheckPtableSendingStateResult{" +
                "pid='" + pid + '\'' +
                ", ptableName='" + ptableName + '\'' +
                ", terminalId='" + terminalId + '\'' +
                ", terminalName='" + terminalName + '\'' +
                ", sendingState=" + sendingState +
                '}';
    }
}
