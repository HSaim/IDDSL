/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.LoginUserBean;
import model.UserBean;
import model.UserDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 *
 * @author Habiba Saim
 */
public class LoginController extends HttpServlet {

    private String host;
    private String port;
    private String kmatUsername;
    private String kmatPassword;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //To delete all sessions created while a user was logged-in
        HttpSession session=request.getSession(); 
        session.removeAttribute("CurrentSessionUser");
        request.logout();
        session.invalidate();          
        response.sendRedirect("Home.jsp");  
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action =request.getParameter("action");
        ArrayList userLevels = new ArrayList();
        //Handles user login request
        if (action.equals("login")){
            try{
                LoginUserBean user = new LoginUserBean();
                user.setUserName(request.getParameter("username"));
                user.setPassword(request.getParameter("password"));

                user = UserDAO.login(user);

                if (user.isValid()){
                    HttpSession session = request.getSession(true);
                    session.setAttribute("CurrentSessionUser", user); 
                    response.sendRedirect("home");

                }
                else{
                    response.setContentType("text/html;charset=UTF-8");
                    try {
                        PrintWriter out = response.getWriter();
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Invalid username or password');");
                        out.println("location='Home.jsp#name';");
                        out.println("</script>");                    
                    }
                    catch (Exception e){
                        System.out.println("Alert could not be generated. Error: " + e);
                    }
                  
                }
            }
            catch (Throwable theException){ 	    

               theException.printStackTrace(); 
            }
            finally{

            }
        }
        
        /*Handles user account recovery request
        else if (action.equals("recover-account")){
            String newPassword = "kmat_user";
            UserBean user = new UserBean();
            user.setUserName(request.getParameter("username"));
            user.setPriEmail(request.getParameter("pri-email"));
            Object data = "You will shortly receive an email.";            
            
            newPassword = new String(RandomPasswordGenerator.generatePswd(6, 6, 2, 2, 2));  //A new password is generated randomly
            user = UserDAO.recoverAccount(user, newPassword );
            //Send updated password to the user.
            if (user.isValidUser()){
               
                ServletContext context = getServletContext();
                setEmailHeader(context);
                String recipientEmail = user.getPriEmail();
                String recipientName = user.getFirstName();
                String subject = "Account recovery successful";
                String content = "Dear " + recipientName + 
                    ",\n\nYour password has been reset." +
                    "\nYour new password is: "+ newPassword +
                    "\n\nBest Regards,\n\nKMAT Team" +
                    "\n\n\n_________________________________________________________" +
                    "\nThis is an autogenerated email, kindly do not reply.";
                
                
                try{
                    EmailUtility.sendEmail(host, port, kmatUsername, kmatPassword, recipientEmail, subject,
                    content);                    
                }
                catch (Exception e){
                    e.printStackTrace();
                }
            }
            else{
                data = "User name or primary email is wrong. Try again. Or meet Knowledge Engineer for your account recovery";
                
            }
            
            request.setAttribute("data", data);
            request.getRequestDispatcher("RecoverAccount.jsp").forward(request, response);
        }*/
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    
}
