/**
 * @description the aspect class 
 * @function  add log to record the method weather be executed and execution completed
 * @time 11/13
 * @author ashin
 */
package com.wlayteam.utils;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class TribuneAspect {
	/**
	 * proxy  all the method under the 'com.wlayteam' package
	 * @param proceedingJoinPoint
	 * @return 
	 * @throws Throwable
	 */
	@Around(value = "execution (* com.wlayteam..*.*(..))")
	public Object aroundMethodExecute(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
		System.out.println("the method will be executed: " + proceedingJoinPoint);
		Object object = proceedingJoinPoint.proceed();
		System.out.println("the method has executed: " + proceedingJoinPoint);
		return object;
	}

}
