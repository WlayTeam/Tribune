package com.wlayteam.utils;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class TribuneAspect {
	
	@Before(value="exectuion(* com.wlayteam.controller.IndexPageController.toIndex(..)")
	public void beforefMthodExecute(){
		System.out.println("method executed");
	}
}
