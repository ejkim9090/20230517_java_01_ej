package kh.lclass.openapi.model.vo;

public class EvInfoVo {
//	private static String resultCode;
//	private static String resultMsg;
//	private static String numOfRows;
//	private static String pageNo;
	private static String totalCount;
	//
	private String addr;
	private Integer chargeTp;
	private String cpId;
	private String cpNm;
	private String cpStat;
	private String cpTp;
	private String csId;
	private String csNm;
	private String lat;
	private String longi;
	private String statUpdateDatetime;
	@Override
	public String toString() {
		return "EvInfoVo [addr=" + addr + ", chargeTp=" + chargeTp + ", cpId=" + cpId + ", cpNm=" + cpNm + ", cpStat="
				+ cpStat + ", cpTp=" + cpTp + ", csId=" + csId + ", csNm=" + csNm + ", lat=" + lat + ", longi=" + longi
				+ ", statUpdateDatetime=" + statUpdateDatetime + "]";
	}
	public static String getTotalCount() {
		return totalCount;
	}
	public static void setTotalCount(String totalCount) {
		EvInfoVo.totalCount = totalCount;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Integer getChargeTp() {
		return chargeTp;
	}
	public void setChargeTp(Integer chargeTp) {
		this.chargeTp = chargeTp;
	}
	public String getCpId() {
		return cpId;
	}
	public void setCpId(String cpId) {
		this.cpId = cpId;
	}
	public String getCpNm() {
		return cpNm;
	}
	public void setCpNm(String cpNm) {
		this.cpNm = cpNm;
	}
	public String getCpStat() {
		return cpStat;
	}
	public void setCpStat(String cpStat) {
		this.cpStat = cpStat;
	}
	public String getCpTp() {
		return cpTp;
	}
	public void setCpTp(String cpTp) {
		this.cpTp = cpTp;
	}
	public String getCsId() {
		return csId;
	}
	public void setCsId(String csId) {
		this.csId = csId;
	}
	public String getCsNm() {
		return csNm;
	}
	public void setCsNm(String csNm) {
		this.csNm = csNm;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLongi() {
		return longi;
	}
	public void setLongi(String longi) {
		this.longi = longi;
	}
	public String getStatUpdateDatetime() {
		return statUpdateDatetime;
	}
	public void setStatUpdateDatetime(String statUpdateDatetime) {
		this.statUpdateDatetime = statUpdateDatetime;
	}
	
}
