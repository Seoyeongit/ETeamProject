package com.forpets.biz;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {
//	@Autowired
//	private ServletContext servletContext;
//	
//	String resourcePath = servletContext.getRealPath("/resource");
//
//		@Value("${file.upload.directory}")
//		private String path = resourcePath + "/assts/upload";
//		
//		@Bean
//		public MultipartConfigElement multipartConfigElement() {
//			String location = path + "/temp";
//			return new MultipartConfigElement(location, 20971520, 41943040, 20971520);
//		}
}
