/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import Modelo.Conexion;
/**
 *
 * @author eriki
 */
public class marcas {
    private int idMarca;
    private String Marca;
    private Conexion cn;

    public marcas() {
    }

    public marcas(int idMarca, String Marca) {
        this.idMarca = idMarca;
        this.Marca = Marca;
    }
    

      public HashMap Listado(){
    HashMap<String,String>drop= new HashMap();
    try{
            cn=new Conexion();
            String Query="SELECT idmarca as id,marca FROM marcas;";
            cn.abrirConcexion();
            ResultSet consulta=cn.conexionDB.createStatement().executeQuery(Query);
            while(consulta.next()){
                drop.put(consulta.getString("id"),consulta.getString("marca"));
            }
            cn.cerrarConecion();
    }catch(SQLException ex){
        System.out.println("ERROR: "+ex.getMessage());
    }
        return drop;
}

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public String getMarca() {
        return Marca;
    }

    public void setMarca(String Marca) {
        this.Marca = Marca;
    }
}
