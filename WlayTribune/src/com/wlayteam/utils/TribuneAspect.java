package com.wlayteam.utils;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class TribuneAspect {
	
	@Around(value="execution (* com.wlayteam..*.*(..))")
	public Object aroundMethodExecute(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		System.out.println("the method will be executed: "+proceedingJoinPoint);
		Object object = proceedingJoinPoint.proceed();
		System.out.println("the method has executed: "+proceedingJoinPoint);
		return object;
	}
	
}
