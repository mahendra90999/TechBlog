/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlet;

import static com.mysql.cj.conf.PropertyKey.USER;
import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {

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
            
            int cid = Integer.parseInt(request.getParameter("cid"));
            String pTitle =request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode = request.getParameter("pCode");
            Part part =request.getPart("pic");
            
            
//            getting current userid
            HttpSession session = request.getSession();
            User user= (User)session.getAttribute("currentUser");
            
            
//            out.println("your post title is " + pTitle);
//            out.println(part.getSubmittedFileName());
            
            Post p = new Post( pTitle,  pContent,  pCode,  part.getSubmittedFileName() ,  null,  cid, user.getId());
            
            try {
                PostDao dao = new PostDao(ConnectionProvider.getConnection());
                if(dao.savePost(p)){

//                    String path = request.getRealPath("/") + "blog_pics" + File.separator+part.getSubmittedFileName();

                    String realPath = request.getServletContext().getRealPath("/");
                    
                    File webDir = new File(realPath).getParentFile(); // This moves from "build/web" to "build"
                    
                    String uploadDir = webDir.getParent() + File.separator + "web" + File.separator + "blog_pics";

                    String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    
                    String path = uploadDir + File.separator + fileName;

                    
//                    out.println(path);
                    Helper.saveFile(part.getInputStream(), path);
                    out.println("done");
                    
                }else
                {
                    out.println("error");
                }
               
            } catch (SQLException e) {
                out.println(e);
            }
            
//            PostDao dao = new PostDao(ConnectionProvider.getConnection());
//            if(dao.savePost(p)){
//                out.println("done");
//            }else
//            {
//                out.println("error");
//            }
                    
        
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
        processRequest(request, response);
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
