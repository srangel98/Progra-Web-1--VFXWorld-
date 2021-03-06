/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.vfxworld.controllers;

import com.mycompany.vfxworld.dao.categoryDAO;
import com.mycompany.vfxworld.dao.newsDAO;
import com.mycompany.vfxworld.models.category;
import com.mycompany.vfxworld.models.news;
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
@WebServlet(name = "ProfileController", urlPatterns = {"/ProfileController"})
public class ProfileController extends HttpServlet {

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
            out.println("<title>Servlet ProfileController</title>");            
            out.println("</head>");
            
            out.println("<body>");
            out.println("<h1>Servlet ProfileController at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       HttpSession session = request.getSession();
       List<category> categories = categoryDAO.getCategories();
       request.setAttribute("Categories", categories);
       List<news> idNewsFav = newsDAO.getFavNewsID((String)session.getAttribute("name"));
       request.setAttribute("idNewsFav", idNewsFav);
       List<news> allNews = newsDAO.getAllNews();
        
        request.setAttribute("allNews", allNews);
       if(session.getAttribute("userType").equals("C") || session.getAttribute("userType").equals("E") || session.getAttribute("userType").equals("A")){
       List<news> noticiasAutor = newsDAO.getNewsAutor((String)session.getAttribute("name"));
       request.setAttribute("NoticiasAutor", noticiasAutor);
       }
       if (session.getAttribute("userType").equals("C") || session.getAttribute("userType").equals("R")){
           
           request.getRequestDispatcher("profile.jsp").forward(request, response);
           
       }
       else{
           List<news> todasNoticias = newsDAO.getAllNews();
           request.setAttribute("TodasNoticias", todasNoticias);
           request.getRequestDispatcher("profile_AE.jsp").forward(request, response);
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
        processRequest(request, response);
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
