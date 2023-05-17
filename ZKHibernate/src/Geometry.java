package org.zkoss.ZKHibernate;



public class Geometry {

	public double circleArea(double radius) {
		return Math.PI * radius * radius;
	}
	
	public double squareArea(double length) {
		return Math.pow(length, 2);
	}
	
	public double triangleArea(double length, double height) {
		return length * height * 0.5;
	}
	
}
