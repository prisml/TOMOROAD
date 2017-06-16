package org.kosta.tomoroad.model.vo;

public class ConnectionVO {
	private StationVO depart;
	private StationVO arrived;
	private int spendTime;

	public ConnectionVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ConnectionVO(StationVO depart, StationVO arrived, int spendTime) {
		super();
		this.depart = depart;
		this.arrived = arrived;
		this.spendTime = spendTime;
	}

	public StationVO getDepart() {
		return depart;
	}

	public void setDepart(StationVO depart) {
		this.depart = depart;
	}

	public StationVO getArrived() {
		return arrived;
	}

	public void setArrived(StationVO arrived) {
		this.arrived = arrived;
	}

	public int getSpendTime() {
		return spendTime;
	}

	public void setSpendTime(int spendTime) {
		this.spendTime = spendTime;
	}

	@Override
	public String toString() {
		return depart.getName()+arrived.getName();
	}

}
