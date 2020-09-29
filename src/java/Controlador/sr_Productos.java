/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.productos;

/**
 *
 * @author eriki
 */
public class sr_Productos extends HttpServlet {

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
            out.println("<title>Servlet sr_Productos</title>");
            out.println("</head>");
            out.println("<body>");
                if("Agregar".equals(request.getParameter("btn_Agregar"))){
               productos producto=new productos(0,Integer.parseInt(request.getParameter("ListaMarca")),Integer.parseInt(request.getParameter("txt_existencias")),request.getParameter("txt_producto"),request.getParameter("txt_descripcion"),Double.parseDouble(request.getParameter("txt_preciocosto")),Double.parseDouble(request.getParameter("txt_precioventa")));
               if(producto.Agregar()>0){
                    response.sendRedirect("index.jsp"); 
               }else{
                   out.println("<script>alert('Error');</script>");
               }
           }
            if("Modificar".equals(request.getParameter("btn_Modificar"))){
               productos producto=new productos(Integer.parseInt(request.getParameter("txt_ID")),Integer.parseInt(request.getParameter("ListaMarca")),Integer.parseInt(request.getParameter("txt_existencias")),request.getParameter("txt_producto"),request.getParameter("txt_descripcion"),Double.parseDouble(request.getParameter("txt_preciocosto")),Double.parseDouble(request.getParameter("txt_precioventa")));
               if(producto.Modificar()>0){
                    response.sendRedirect("index.jsp"); 
               }else{
                   out.println("<script>alert('Error');</script>");
               }
           }
            if("Eliminar".equals(request.getParameter("btn_Eliminar"))){
               productos producto=new productos(Integer.parseInt(request.getParameter("txt_ID")),Integer.parseInt(request.getParameter("ListaMarca")),Integer.parseInt(request.getParameter("txt_existencias")),request.getParameter("txt_producto"),request.getParameter("txt_descripcion"),Double.parseDouble(request.getParameter("txt_preciocosto")),Double.parseDouble(request.getParameter("txt_precioventa")));
               if(producto.Eliminar()>0){
                    response.sendRedirect("index.jsp"); 
               }else{
                   out.println("<script>alert('Error');</script>");
               }
           }

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
