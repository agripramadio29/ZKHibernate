package org.zkoss.ZKHibernate.tests;

import org.zkoss.ZKHibernate.Geometry;


import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class GeometryTest {
	

	
	
	Geometry geometry = new Geometry();
	
	@Test
	public void givenRadius_circleArea() {
		double result = geometry.circleArea(70);
		double expectedResult = 15393.804002589986;
		assertEquals(expectedResult, result, Math.abs(expectedResult));
	}
	
	@Test
	public void givenLength_squareArea() {
		double result = geometry.squareArea(16);
		double expectedResult = 256;
		assertEquals(expectedResult, result, Math.abs(expectedResult));
	}

	public Geometry getGeometry() {
		return geometry;
	}

	public void setGeometry(Geometry geometry) {
		this.geometry = geometry;
	}


	
	
	

}
