/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.UserBean;
import model.UserDAO;
import model.LoginUserBean;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class GetUsersController extends HttpServlet {
    private String host;
    private String port;
    private String kmatUsername;
    private String kmatPassword;
    String currentUsername;
    LoginUserBean currentUser ;
    
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
        doPost(request, response );
        
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
        //currentUsername = request.getParameter("currentuser");
        currentUser = (LoginUserBean) request.getSession(false).getAttribute("CurrentSessionUser");
        currentUsername = currentUser.getUsername();
        
        //To retrieve the users in KMAT DB for KE View
        
        //To get the profile details of logged-in user
        if(action.equals("get-current-user")){
           String data = request.getParameter("message");
            try{
                UserBean user = new UserBean();

                user = UserDAO.getUser(currentUsername);
                
                HttpSession session = request.getSession(true);

                session.setAttribute("current-user", user);
                response.sendRedirect("my-profile");
                session.setAttribute("updateData", data);
            }
             catch(Exception e){
                 e.printStackTrace();
             }
            
        }
        
        //Updates the profile of logged-in user, displays a message on the edit profile page 
        else if (action.equals("update-profile")){
            String msg = "Update successful!";
             try{
                
                UserBean user = new UserBean();
                //Get update form elements 
                String user_id = request.getParameter("userId");
                user.setUserId(( Integer.parseInt(user_id)));
                user.setUserName(request.getParameter("user_name"));              
                user.setFirstName(request.getParameter("firstname"));
                user.setLastName(request.getParameter("lastname"));
                user.setPriEmail(request.getParameter("p_email"));
                user.setSecEmail(request.getParameter("s_email"));
                user.setPosAddress(request.getParameter("postal_address"));
                user.setPerAddress(request.getParameter("per_address"));
                user.setWorkPhone(request.getParameter("w_phone"));
                user.setMobPhone(request.getParameter("m_phone"));
                user.setHomePhone (request.getParameter("h_phone"));                

                user = UserDAO.updateProfile(user);
                
                response.sendRedirect("GetUsersController?action=get-current-user&&message=" + msg);
             }
             catch(Exception e){
                 e.printStackTrace();
             }
        }
        
        //Reset password of logged-in user
        else if (action.equals("resetPassword")){
            String msg;
            int userId;
            String oldPassword;
            String newPassword;
            String savedPassword;  //Users password saved in DB
            int updateSuccessful =0;
            
            try{
                
                UserBean user = new UserBean();
                user = UserDAO.getUser(currentUsername);
                oldPassword = request.getParameter("oldPassword");
                newPassword = request.getParameter("newPassword");
                savedPassword = user.getPassword();
                userId = user.getUserId();
                HttpSession session = request.getSession(true);
                
                if (oldPassword.equals(savedPassword)){
                    
                    updateSuccessful = UserDAO.resetPassword(userId, newPassword);
                    
                    if (updateSuccessful == 1){
                        
                        msg = "Password reset successful!";
                        
                    }
                    else{
                        msg = "Password reset unsuccessful! Try again later.";
                       
                    }
                }
                else{
                    msg = "Invalid current password!";
                   
                }
                session.setAttribute("resetMessage", msg);
                response.sendRedirect("change-password");
            }
            catch(Exception e){
                 e.printStackTrace();
            }  
            
        }
        
        
        
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
