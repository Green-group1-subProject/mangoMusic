package com.mangoMusic.member.model;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("hyoeunk678@gmail.com","rlahyoeun6297");

	}
	
	
	
}
