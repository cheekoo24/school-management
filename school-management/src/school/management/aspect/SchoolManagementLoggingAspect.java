package school.management.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.jboss.logging.Logger;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class SchoolManagementLoggingAspect {
	
	
	// logger setup
	private Logger theLogger = Logger.getLogger(getClass().getName());
	
	// pointcut declarations for controller, dao, and service
	
	@Pointcut("execution(* school.management.controller.*.*(..))")
	public void forControllerPackage() {}
	
	@Pointcut("execution(* school.management.dao.*.*(..))")
	public void forDAOPackage() {}
	
	@Pointcut("execution(* school.management.service.*.*(..))")
	public void forServicePackage() {}
	
	@Pointcut("forControllerPackage() || forDAOPackage() || forServicePackage()")
	public void forAppFlow() {}

	// add @Before advice
	@Before("forAppFlow()")
	public void before(JoinPoint theJoinPoint) {
		String theMethod = theJoinPoint.getSignature().toShortString();
		theLogger.info("====|>> @Before: calling method: " + theMethod);
		
		// display the arguments to the method
		
		// get the arguments
		Object[] args = theJoinPoint.getArgs();
		
		// loop thru and display args
		for (Object tempArg: args) {
			theLogger.info("====|>> @Before: argument: " + tempArg);
		}
	}
	
	@AfterReturning(
			pointcut="forAppFlow()",
			returning="theResult"
			)
	public void after(JoinPoint theJoinPoint, Object theResult) {
		
		// display method we are returning from
		String theMethod = theJoinPoint.getSignature().toShortString();
		theLogger.info("====|>> in @AfterReturning: from method: " + theMethod);
				
				
		// display data returned
		theLogger.info("====|>> result: " + theResult);
	}
}
