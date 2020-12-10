/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.vfxworld.controllers;

import com.mycompany.vfxworld.dao.registerDAO;
import com.mycompany.vfxworld.dao.userDAO;
import com.mycompany.vfxworld.models.register;
import com.mycompany.vfxworld.models.user;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ModifyRController", urlPatterns = {"/ModifyRController"})
public class ModifyRController extends HttpServlet {

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
        HttpSession session = request.getSession();
        String mr_aboutMe = request.getParameter("mr_aboutMe");
        String mr_email = request.getParameter("mr_email");
        String mr_photo = "Imagenes/" + request.getParameter("mr_photo");
        String mr_name = (String)session.getAttribute("name");
         user User = new user(mr_name); //user de página
         user modifyUser = userDAO.findModifyUser(mr_name); //user de la base de datos
         register modifyReg = registerDAO.getRegisteredID(mr_name);
         if(userDAO.modifUserReg(modifyUser.getName(), modifyReg.getId(), mr_email, mr_photo, mr_aboutMe)==1){
             session.setAttribute("photo", mr_photo);
             session.setAttribute("email", mr_email);
             session.setAttribute("registered_aboutMe", mr_aboutMe);
            response.sendRedirect("ProfileController");

        } else {
            response.sendRedirect("error.jsp");
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
