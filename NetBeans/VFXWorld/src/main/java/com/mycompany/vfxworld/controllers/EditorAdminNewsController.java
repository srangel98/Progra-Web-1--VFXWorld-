/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.vfxworld.controllers;

import com.mycompany.vfxworld.dao.newsDAO;
import com.mycompany.vfxworld.models.news;
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
@WebServlet(name = "EditorAdminNewsController", urlPatterns = {"/EditorAdminNewsController"})
public class EditorAdminNewsController extends HttpServlet {

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
            out.println("<title>Servlet EditorAdminNewsController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditorAdminNewsController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
        String tituloNoticia = request.getParameter("tituloNoticia");//
        String descripcionNoticia = request.getParameter("descripcionNoticia");//
        String categoriaNoticia = request.getParameter("categoriaNoticia");//
        String imagenMiniatura = "Imagenes/" + request.getParameter("imagenMiniatura");
        String imagenEncabezado = "Imagenes/" +request.getParameter("imagenEncabezado");
        String cuerpoNoticia = request.getParameter("cuerpoNoticia");//
        String imagenCuerpo = "Imagenes/" +request.getParameter("imagenCuerpo");
        String videoNoticia = "Videos/" +request.getParameter("videoNoticia");//
        news Noticia = new news(tituloNoticia, descripcionNoticia, cuerpoNoticia, categoriaNoticia, videoNoticia, imagenMiniatura, imagenEncabezado, imagenCuerpo, (String)session.getAttribute("name")); //user de página
        
         if(newsDAO.createApprovedNews(Noticia) == 1){
            response.sendRedirect("ProfileController");
         }
         else {
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
