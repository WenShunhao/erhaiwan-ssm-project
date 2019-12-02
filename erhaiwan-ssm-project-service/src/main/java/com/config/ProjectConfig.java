package com.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.github.pagehelper.PageInterceptor;
import org.apache.ibatis.logging.stdout.StdOutImpl;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@PropertySource(value = "classpath:db.properties",encoding = "UTF-8")//读取外部文件
@MapperScan("com.dao")
@ComponentScan({"com.service"})//扫描业务类
//@EnableAspectJAutoProxy(proxyTargetClass = true)
@EnableTransactionManagement()
public class ProjectConfig {
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
        Resource[] resources = patternResolver.getResources("classpath*:*Mapper.xml");
        sqlSessionFactoryBean.setMapperLocations(resources);
        //分页插件
        sqlSessionFactoryBean.setPlugins(pageInterceptor());
        //日志
        sqlSessionFactoryBean.setConfiguration(configuration());
        return  sqlSessionFactoryBean.getObject();
    }
}
