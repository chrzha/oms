package com.oms.backend.common;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
public class CodeType implements Filter {
	String codetype="";

    public CodeType() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//		request.setCharacterEncoding(codetype);
		//通过web。xml的配置可以解决post请求的中文乱码问题，但是对于response的编码，spring默认为ISO-8859-1，所以还是要使用此编码
		response.setContentType("text/html;charset="+codetype);
//		System.out.println("设置字符编码");
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		codetype=fConfig.getInitParameter("codetype");
	}

}
