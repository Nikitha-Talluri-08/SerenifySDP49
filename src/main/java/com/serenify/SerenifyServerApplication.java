package com.serenify;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
public class SerenifyServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(SerenifyServerApplication.class, args);
		System.out.println("SDP PROJECT RUNNING..........");
	}

}
