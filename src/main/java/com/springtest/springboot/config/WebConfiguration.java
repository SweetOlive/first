package com.springtest.springboot.config;

import java.util.Locale;
import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

/**
 * spring web 全局配置
 *
 */
@Configuration("webConfig")
@Primary
public class WebConfiguration implements WebMvcConfigurer {

	@Bean
	public PropertiesFactoryBean configProperties() throws Exception {
		PropertiesFactoryBean propertiesFactoryBean = new PropertiesFactoryBean();
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		propertiesFactoryBean.setLocations(resolver.getResources("classpath*:application.properties"));
		return propertiesFactoryBean;
	}


	@Bean
	public LocaleResolver localeResolver() {
		SessionLocaleResolver slr = new SessionLocaleResolver();
		slr.setDefaultLocale(Locale.SIMPLIFIED_CHINESE);
		return slr;
	}

	@Bean
	public LocaleChangeInterceptor localeChangeInterceptor() {
		LocaleChangeInterceptor lci = new LocaleChangeInterceptor();
		lci.setParamName("lang");
		return lci;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(localeChangeInterceptor());
		WebMvcConfigurer.super.addInterceptors(registry);
	}

}
