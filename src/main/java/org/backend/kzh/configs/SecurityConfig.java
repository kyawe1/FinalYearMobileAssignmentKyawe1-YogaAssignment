package org.backend.kzh.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class SecurityConfig {

	@Bean
	public SecurityFilterChain filter(HttpSecurity security) throws Exception {
		security.authorizeHttpRequests(request -> request.anyRequest()
			.anonymous())
			.csrf(p -> p.disable());
		return security.build();
	}
	
	@Bean 
	public WebMvcConfigurer configurer() {
		return new WebMvcConfigurer() {
			@Override
			public void addCorsMappings(CorsRegistry registry) {
				registry.addMapping("/api/**").allowedOrigins("*").allowedHeaders("*").allowedMethods("*");
			}
		};
	}

}
