package org.zkoss.ZKHibernate;

import org.zkoss.ZKHibernate.Geometry;


import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;
import static org.junit.Assert.assertEquals;

public class GeometryTest {
	

	
	
	Geometry geometry = new Geometry();
	
	@Test
	public void givenRadius_circleArea() {
		double result = geometry.circleArea(70);
		double expectedResult = 15393.804002589986;
		Assertions.assertEquals(expectedResult, result, Math.abs(expectedResult));
	}
	
	@Test
	public void givenLength_squareArea() {
		double result = geometry.squareArea(16);
		double expectedResult = 256;
		Assertions.assertEquals(expectedResult, result, Math.abs(expectedResult));
	}
	
	@Test
	public void givenParameter_triangleArea(){
		double result = geometry.triangleArea(2, 4);
		double expectedResult = 8;
		Assertions.assertEquals(expectedResult, result, Math.abs(expectedResult));
	}

	public Geometry getGeometry() {
		return geometry;
	}

	public void setGeometry(Geometry geometry) {
		this.geometry = geometry;
	}


	
	
	

}
