package com.mangoMusic.member.model;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("kdonghan2007@gmail.com","k73014099");

	}
	
	
	
}
