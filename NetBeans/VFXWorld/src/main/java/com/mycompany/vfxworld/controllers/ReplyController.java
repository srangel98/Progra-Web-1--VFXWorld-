/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.vfxworld.controllers;

import com.mycompany.vfxworld.dao.commentDAO;
import com.mycompany.vfxworld.models.comment;
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
@WebServlet(name = "ReplyController", urlPatterns = {"/ReplyController"})
public class ReplyController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReplyController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReplyController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        HttpSession session = request.getSession();
        int idComment = Integer.parseInt(request.getParameter("idCommentforReply"));
        String userName;
        boolean isAnon = false;
        String bodyReply = request.getParameter("respuesta");
        
        if(session.getAttribute("userType").equals("0")){
          userName = "Usuario Anonimo";
          
          isAnon = true;
          
          } else{
          userName = (String)session.getAttribute("name");
          }
          
          String idNoticia = request.getParameter("idNoticia");
          session.setAttribute("idNoticia", idNoticia);
          int idNews = Integer.parseInt(idNoticia);
        
        comment respuesta = new comment(bodyReply, isAnon, true, userName, idNews, idComment);
        
        
        
        if(commentDAO.insertReply(respuesta) == 1){
            response.sendRedirect("ShowNewController");
        }else{
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
