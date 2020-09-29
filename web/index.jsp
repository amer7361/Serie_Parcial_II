<%-- 
    Document   : index
    Created on : 19/09/2020, 01:02:38 PM
    Author     : eriki
--%>


<%@page import="Modelo.productos"%>
<%@page import="Modelo.marcas"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap" %>
<%@page import="Modelo.Conexion" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <script src="jquery-3.5.1.js"></script>


    </head>
    <title>Parcial 2</title>
</head>

<body>
   
    <div class="jumbotron text-center" style="margin-bottom:0;background-color:#008798;">
        <h1 style="text-align: center;color:#FFF;">Formulario De Productos</h1>
        <br>
    </div>

    <header>
        <div class="container" >       
            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="Nuevo" style="margin: 20px 0px 20px 500px;"> 
                <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-plus-square-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
                </svg>
                Nuevo
            </button>
        </div>
    </header>
    <div class="container" style="font-size: larger; max-width:1250px;">

        <h1 class="modal-title">Listado De Productos</h1><br>
        <h3>Busqueda:</h3>
        <input class="form-control" id="myInput" type="text" placeholder="Buscar" style="width: 500px;">
        <div>
            <br>Esta busqueda esta basada en el nombre de producto
            marca y descripcion.
            <b>Si desea regresar a la lista completa de los productos solo debe borrar lo
                buscado :D.</b>

        </div>
        <br>


        <table class="table table-hover" style=" text-align: center;">
            <thead class="thead-dark">
            <th>Productos</th>
            <th>Marca</th>
            <th>Descripcion</th>
            <th>Precio Costo</th>
            <th>Precio Venta</th>
            <th>Existencias</th>
            </tr>
            </thead>
            <tbody id="tbl_productos"   class="thead-light" style=" cursor : pointer;">
                <%
                   productos producto = new productos();
                                    DefaultTableModel tblModelo = new DefaultTableModel();
                                    tblModelo = producto.Lista();
                                    for (int a = 0; a < tblModelo.getRowCount(); a++) {
                                        out.println("<tr data-idproductos=" + tblModelo.getValueAt(a, 0).toString() + " data-id_marcas=" + tblModelo.getValueAt(a, 2).toString() + ">");
                                        out.println("<td >" + tblModelo.getValueAt(a, 1).toString() + "</td>");
                                        out.println("<td>" + tblModelo.getValueAt(a, 3).toString() + "</td>");
                                        out.println("<td>" + tblModelo.getValueAt(a, 4).toString() + "</td>");
                                        out.println("<td>" + tblModelo.getValueAt(a, 5).toString() + "</td>");
                                        out.println("<td>" + tblModelo.getValueAt(a, 6).toString() + "</td>");
                                        out.println("<td>" + tblModelo.getValueAt(a, 7).toString() + "</td>");
                                        out.println("</tr>");
                                    }

                %>
            </tbody>
        </table>
        <br>
    </div>


    <div class="container">


        <!-- The Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h1 class="modal-title">Formulario de Productos</h1>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">

                        <form action="sr_Productos" method="POST" class="form-group">
                            <label id="ID1"><b>ID</b></label> <input type="text" name="txt_ID" class="form-control" id="txt_ID" placeholder="ID" value="0" readonly ><br>
                                <label for="lbl_producto"><b>Producto:</b></label>
                                <input type="text" name="txt_producto" class="form-control" id="txt_producto" placeholder="Ejemplo: Chocolate" required><br>
                                 <label for="lbl_marcas "><b>Marca:</b></label>
                                <select name="ListaMarca" id="ListaMarca" class="form-control">
                                    <%         
                                        marcas marcas = new marcas();
                                        HashMap<String, String> List=marcas.Listado();
                                        out.println("<option value='0'> Elija </option>");
                                        for (String i : List.keySet()) {
                                            out.println("<option value='" + i + "'>" + List.get(i) + "</option>");
                                        }
                                    %>
                                </select>
                                <label for="lbl_descripcion"><b>Descripcion:</b></label>
                                <input type="text" name="txt_descripcion" class="form-control" id="txt_descripcion" placeholder="Ejemplo: Frasco de 150ml " required><br>
                                <label for="lbl_preciocosto"><b>Precio Costo:</b></label>
                                <input type="money" name="txt_preciocosto" class="form-control" id="txt_preciocosto" placeholder="Ejemplo: 150.80 " required><br>
                                <label for="lbl_precioventa"><b>Precio Venta:</b></label>
                                <input type="money" name="txt_precioventa" class="form-control" id="txt_precioventa" placeholder="Ejemplo: 199.90" required><br>
                                <label for="lbl_existencias"><b>Existencias:</b></label>
                                <input type="number" name="txt_existencias" class="form-control" id="txt_existencias" placeholder="Ejemplo: 320" required><br>
                                
                            <!-- Modal footer -->

                            <div class="modal-footer">
                                <button  class="btn btn-outline-success" name="btn_Agregar" id="btn_Agregar" value="Agregar" >Agregar</button> 
                                <button  class="btn btn-outline-primary" name="btn_Modificar" id="btn_Modificar" value="Modificar" >Modificar</button>
                                <button  class="btn btn-outline-danger" name="btn_Eliminar" id="btn_Eliminar" value="Eliminar" onclick="javascript:if (!confirm('¿Desea Eliminar este Producto?'))
                                            return false">Eliminar</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>


                        </form>
                    </div>


                </div>
            </div>

        </div>
    </div>
    <!-- Footer -->
    <footer class="text-center" style="background-color: #2f2f2f; /* Black Gray */
            color: #fff; font-size: 30px;" >
        <p><br>Ericka Del Rosario Gonzalez Acuta <br>1290-19-3192<br>Programacion II<br>Tarea 2</p> 
        <br>
    </footer>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
 
    <script type="text/javascript">
                                $('#tbl_productos').on('click', 'tr td', function (evt) {
                                    $("#btn_Agregar").hide();
                                    $("#btn_Modificar").show();
                                    $("#btn_Eliminar").show();
                                    $("#txt_ID").show();
                                    $("#idproductos").show();
                                    var target, idproductos, producto, descripcion, preciocosto, precioventa, existencia, ListaMarca;
                                    target = $(event.target);
                                    idproductos = target.parent().data('idproductos');
                                    ListaMarca = target.parent().data('id_marcas');
                                    producto = target.parents("tr").find("td").eq(0).html();
                                    descripcion = target.parents("tr").find("td").eq(2).html();
                                    preciocosto = target.parents("tr").find("td").eq(3).html();
                                    precioventa = target.parents("tr").find("td").eq(4).html();
                                    existencia = target.parents("tr").find("td").eq(5).html();
                                   +



                                    $("#txt_ID").val(idproductos);
                                    $("#txt_producto").val(producto);
                                    $("#txt_descripcion").val(descripcion);
                                    $("#txt_preciocosto").val(preciocosto);
                                    $("#txt_precioventa").val(precioventa);
                                    $("#txt_existencias").val(existencia);
                                    $("#ListaMarca").val(ListaMarca);
                                    $("#myModal").modal('show');






                                });
    </script>
    <script type="text/javascript">
        $('#Nuevo').click(function (evt) {
            $("#txt_ID").hide();
            $("#idEstudiante").hide();
            $("#btn_Agregar").show();
            $("#btn_Modificar").hide();
            $("#btn_Eliminar").hide();

            $("#txt_ID").val('');
            $("#txt_producto").val('');
            $("#txt_descripcion").val('');
            $("#txt_preciocosto").val('');
            $("#txt_precioventa").val('');
            $("#txt_existencia").val('');
            $("#ListaMarca").val(0);
            $("#myModal").modal('show');

        });

    </script>
    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#tbl_Estudiantes tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });
        });
    </script>
</body>
</html>
