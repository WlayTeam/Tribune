package com.wlayteam.utils;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class TribuneAspect {
	
	@Before(value="execution (* com.wlayteam.controller..*.*(..))")
	public void beforefMthodExecute(JoinPoint joinPoint){
		System.out.println("the method will be executed: "+joinPoint);
	}
	
	@After(value="execution (* com.wlayteam.controller..*.*(..))")
	public void afterMethodExecute(JoinPoint joinPoint){
		System.out.println("the method has executed: "+joinPoint);
	}
}
