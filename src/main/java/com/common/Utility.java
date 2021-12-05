package com.common;

import java.util.Date;

public class Utility {
	public static String displayRe(int step) {
		//답변글인 경우 단계별로 이미지 보여주기
		String result="";
		if(step>0){  //답변글
			for(int k=0;k<step;k++){ 
				result+= "&nbsp;";
			}//for 
			
			result+= "<img src='../images/re.gif'>";	
		}//if 
		
		return result;
	}
	
	public static String cutString(String title, int len) {		
		// 제목이 긴 경우 일부만 보여주기 - 30자
		String result=title;
		if(title.length()>len) {
			result=title.substring(0,len)+"...";
		}
		
		return result;
	}
	
	public static String displayNew(Date regdate) {
		//24시간 이내의 글인 경우 new 이미지 보여주기
		Date today = new Date();
		long gap=(today.getTime() - regdate.getTime())/1000;
		gap = gap/(60*60); //시간
		
		String result="";
		if(gap<24) {
			result="<img src='../images/new.gif' alt='new이미지'>";
		}
		
		return result;
	}
	
}
