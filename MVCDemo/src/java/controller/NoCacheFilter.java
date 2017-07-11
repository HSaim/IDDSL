package controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/WEB-INF/view/*")
public class NoCacheFilter implements Filter {

     @Override
    public void init(FilterConfig config) throws ServletException {
        // If you have any <init-param> in web.xml, then you could get them
        // here by config.getInitParameter("name") and assign it as field.
        System.out.println("init in Filter called");
    }
    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        
        HttpServletResponse response = (HttpServletResponse) res;
        HttpServletRequest request = (HttpServletRequest) req;    
        HttpSession session = request.getSession(false);       
        
        response.setHeader("Cache-Control","no-cache");  //Forces caches to obtain a new copy of the page from the origin server
        response.setHeader("Cache-Control","no-store");  //Directs caches not to store the page under any circumstance
        response.setHeader("Cache-Control", "must-revalidate"); 
        response.setDateHeader("Expires",-1);            //Causes the proxy cache to see the page as "stale"
        response.setHeader("Pragma","no-cache");         //HTTP 1.0 backward compatibility
    
        if(session.getAttribute("CurrentSessionUser")== null){
    
            response.sendRedirect("Home.jsp");
        }
        
        chain.doFilter(request, response);
       
    }

    @Override
    public void destroy() {
        // If you have assigned any expensive resources as field of
        // this Filter class, then you could clean/close them here.
    }

   
}