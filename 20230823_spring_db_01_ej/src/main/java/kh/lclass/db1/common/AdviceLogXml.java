package kh.lclass.db1.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

public class AdviceLogXml {
	private static final Logger logger = LoggerFactory.getLogger(AdviceLogXml.class);
	public Object aroundDaoLog(ProceedingJoinPoint pjp) throws Throwable {
		logger.debug("▷▷▷["+pjp.getThis()+":"+pjp.getSignature().getName()+"]");
		
		// 타겟메소드로 전달되는 매개인자들
		Object[] args = pjp.getArgs();
		for(int i=0; i<args.length; i++) {
			logger.debug("▷▷▷-args["+i+"] "+args[i]+"");
		}
		Object robj = null; // 타겟메소드로부터 return 값을 받아 저장할 공간
		robj = pjp.proceed();  // 타겟메소드 실행 !!! Around 중요메소드
		logger.debug("▷▷▷[Dao ▷]"+robj);
		return robj; // 타겟메소드를 호출한 메소드에 return함
	}
	public Object aroundSrvLog(ProceedingJoinPoint pjp) throws Throwable {
		logger.debug("▷▷["+pjp.getThis()+":"+pjp.getSignature().getName()+"]");
		// 타겟메소드로 전달되는 매개인자들
		Object[] args = pjp.getArgs();
		for(int i=0; i<args.length; i++) {
			logger.debug("▷▷-args["+i+"] "+args[i]+"");
		}
		Object robj = null; // 타겟메소드로부터 return 값을 받아 저장할 공간
		robj = pjp.proceed();  // 타겟메소드 실행 !!! Around 중요메소드
		logger.debug("▷▷[Srv ▷]"+robj);
		return robj; // 타겟메소드를 호출한 메소드에 return함
	}
	public Object aroundCtrLog(ProceedingJoinPoint pjp) throws Throwable {
		Object robj = null; // 타겟메소드로부터 return 값을 받아 저장할 공간
		
		logger.debug("▷["+pjp.getThis()+":"+pjp.getSignature().getName()+"]");
		// 타겟메소드로 전달되는 매개인자들
		Object[] args = pjp.getArgs();
		for(int i=0; i<args.length; i++) {
			logger.debug("▷-args["+i+"] "+args[i]+"");
		}
		robj = pjp.proceed();  // 타겟메소드 실행 !!! Around 중요메소드
		logger.debug("▷[Ctr ▷]"+robj);
		return robj; // 타겟메소드를 호출한 메소드에 return함
	}
	
}
