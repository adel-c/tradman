package com.ace.tradman.frontend;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.context.annotation.Bean;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.util.Arrays;

@Component
public class BP implements BeanPostProcessor {
    @Nullable
    @Override
    public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
        if(bean instanceof FreeMarkerConfigurer c){
//            c.getConfiguration().setCustomAttribute("customAtt","customAtt");
//            System.out.println(Arrays.stream(c.getConfiguration().getCustomAttributeNames()).toList());
        }
        return bean;
    }
}
