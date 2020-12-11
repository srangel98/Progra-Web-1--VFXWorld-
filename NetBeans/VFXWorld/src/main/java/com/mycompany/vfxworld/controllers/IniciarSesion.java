/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.vfxworld.controllers;

import com.mycompany.vfxworld.dao.categoryDAO;
import com.mycompany.vfxworld.dao.creatorDAO;
import com.mycompany.vfxworld.dao.registerDAO;
import com.mycompany.vfxworld.dao.userDAO;
import com.mycompany.vfxworld.models.category;
import com.mycompany.vfxworld.models.creator;
import com.mycompany.vfxworld.models.register;
import com.mycompany.vfxworld.models.user;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 52811
 */
@WebServlet(name = "IniciarSesion", urlPatterns = {"/IniciarSesion"})
public class IniciarSesion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

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
        String aboutMe = null;
        int id = 0;
        String username = request.getParameter("nombre");
        String password = request.getParameter("contrasena");
         user User = new user(username, password); //user de página
         user login = userDAO.logInUser(User); //user de la base de datos
         if(login.getUserType().equals("R")){
            register login_id = registerDAO.getRegisteredID(username);
            id = login_id.getId();
            
            aboutMe = login_id.getAboutMe();
         } else if(login.getUserType().equals("C")){
            creator login_id = creatorDAO.getCreatorID(username);
            id = login_id.getId();
         }
         
         if(login == null)
         {
             response.sendRedirect("error.jsp");
         }else{
             HttpSession session = request.getSession();
             session.setAttribute("name", login.getName());
             session.setAttribute("photo", login.getPhoto());
             session.setAttribute("email", login.getEmail());
             session.setAttribute("userType", login.getUserType());
             session.setAttribute("registered_id", id);
             session.setAttribute("registered_aboutMe", aboutMe);
             
             response.sendRedirect("MainPageController");
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
