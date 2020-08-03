package com.covid.bean;

public class CovidBean {
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public int getCured() {
		return cured;
	}
	public void setCured(int cured) {
		this.cured = cured;
	}
	
	private String name;
	private int active;
	private int cured;
	
	
	
}
