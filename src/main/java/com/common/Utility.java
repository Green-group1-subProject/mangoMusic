package com.common;

import java.util.Date;

public class Utility {
	public static String displayRe(int step) {
		//�亯���� ��� �ܰ躰�� �̹��� �����ֱ�
		String result="";
		if(step>0){  //�亯��
			for(int k=0;k<step;k++){ 
				result+= "&nbsp;";
			}//for 
			
			result+= "<img src='../images/re.gif'>";	
		}//if 
		
		return result;
	}
	
	public static String cutString(String title, int len) {		
		// ������ �� ��� �Ϻθ� �����ֱ� - 30��
		String result=title;
		if(title.length()>len) {
			result=title.substring(0,len)+"...";
		}
		
		return result;
	}
	
	public static String displayNew(Date regdate) {
		//24�ð� �̳��� ���� ��� new �̹��� �����ֱ�
		Date today = new Date();
		long gap=(today.getTime() - regdate.getTime())/1000;
		gap = gap/(60*60); //�ð�
		
		String result="";
		if(gap<24) {
			result="<img src='../images/new.gif' alt='new�̹���'>";
		}
		
		return result;
	}
	
}
