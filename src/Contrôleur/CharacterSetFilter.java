package Contrôleur;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.sun.org.apache.xalan.internal.xsltc.dom.Filter;

public class CharacterSetFilter implements Filter{
	
 
	
	

    public void doFilter(
      ServletRequest request, 
      ServletResponse response, 
      FilterChain next) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        next.doFilter(request, response);
    
}

	@Override
	public boolean test(int arg0) {
		// TODO Auto-generated method stub
		return false;
	}
}
