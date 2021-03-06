package com.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.github.pagehelper.PageInterceptor;
import org.apache.ibatis.logging.stdout.StdOutImpl;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.servlet.Filter;
import javax.sql.DataSource;
import java.nio.charset.Charset;
import java.util.Collections;
import java.util.List;
import java.util.Properties;

@Configuration
@PropertySource(value = "classpath:db.properties",encoding = "UTF-8")//读取外部文件
@MapperScan("com.dao")
@ComponentScan({"com.service","com.control"})//扫描业务类
@EnableTransactionManagement()
@EnableWebMvc
public class ProjectConfig  implements WebMvcConfigurer{
    @Value("${usernames}")
    private String username;
    @Value("${password}")

    private String password;
    @Value("${url}")
    private  String url;

    //注册dataSource' s Bean
    @Bean
    public DataSource dataSource(){
        DruidDataSource druidDataSource = new DruidDataSource();
        druidDataSource.setUrl(url);
        druidDataSource.setUsername(username);
        druidDataSource.setPassword(password);
        return druidDataSource;
    }
    /**
     * 默认
     * transactionManager
     * txManager
     * tm
     *
     * **/
//    事务管理
    @Bean
    public DataSourceTransactionManager transactionManager(){
        DataSourceTransactionManager transactionManager = new DataSourceTransactionManager();
        transactionManager.setDataSource(dataSource());
        return transactionManager;
    }

    //sql日志-->sqlsessionFactory
    //不需要加bean注解,因为它不需要注册到spring中.跟下同理
    private org.apache.ibatis.session.Configuration configuration(){
        org.apache.ibatis.session.Configuration configuration = new org.apache.ibatis.session.Configuration();
        configuration.setLogImpl(StdOutImpl.class);
        //下划线转换为驼峰命名
        configuration.setMapUnderscoreToCamelCase(true);
        return configuration;
    }
    //分页插件-->sqlsessionFactory
    //分页插件不需要注册到spring,可执行但没必要，只需定义方法即可
    //原因：如果注册，会给spring带来不必要的"负担"
    private PageInterceptor pageInterceptor(){
        PageInterceptor pageInterceptor = new PageInterceptor();
        Properties properties = new Properties();
        //不要直接写true,如果直接写true，会判断true为布尔类型，故会报错，其值必须是字符串,
        properties.put("supportMethodsArguments", "true");
        properties.put("reasonable", "true");
        pageInterceptor.setProperties(properties);
        return pageInterceptor;
    }


    //注册SqlSessionFactory's Bean --①需要Mapper ②需要dataSource  可选③分页插件、sql日志功能
    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource());
        //获取mapper配置文件
        PathMatchingResourcePatternResolver patternResolver = new PathMatchingResourcePatternResolver();
        Resource[] resources = patternResolver.getResources("classpath*:mappers/*Mapper.xml");
        sqlSessionFactoryBean.setMapperLocations(resources);
        //分页插件
        sqlSessionFactoryBean.setPlugins(pageInterceptor());
        //日志
        sqlSessionFactoryBean.setConfiguration(configuration());
        return  sqlSessionFactoryBean.getObject();
    }
//    视图解析
    @Bean
    public InternalResourceViewResolver internalResourceViewResolver (){
        InternalResourceViewResolver resourceViewResolver = new InternalResourceViewResolver();
        resourceViewResolver.setSuffix(".jsp");
        resourceViewResolver.setPrefix("/WEB-INF/");
        return  resourceViewResolver;
    }
//    静态文件
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        ResourceHandlerRegistration registration
                = registry.addResourceHandler("/static/**");
        registration.addResourceLocations("classpath:/static/");
    }
//前传后  时间格式转换
    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addFormatter(new DateFormatter("yyyy-MM-dd HH:mm:ss"));
    }

//文件上传
    @Bean(name = "multipartResolver")
    public MultipartResolver multipartResolver(){
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
        resolver.setDefaultEncoding("UTF-8");
        //resolveLazily属性启用是为了推迟文件解析，以在在UploadAction中捕获文件大小异常
        resolver.setResolveLazily(true);
        resolver.setMaxInMemorySize(40960);
        return resolver;
    }
//    等同于xml里配置
    @Bean
    public Filter characterEncodingFilter() {
        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceEncoding(true);
        return characterEncodingFilter;
    }


    @Bean
    public HttpMessageConverter<String> responseBodyConverter() {
        StringHttpMessageConverter stringHttpMessageConverter = new StringHttpMessageConverter(Charset.forName("UTF-8"));
        stringHttpMessageConverter.setSupportedMediaTypes(Collections.singletonList(MediaType.APPLICATION_JSON_UTF8));
        return stringHttpMessageConverter;
    }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(responseBodyConverter());
    }


//    //    后传前 时间格式转换
//    @Override
//    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        ObjectMapper objectMapper = new ObjectMapper();
//        objectMapper.setDateFormat(sdf);
//        MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter(objectMapper);
//        converters.add(converter);
//    }




}
