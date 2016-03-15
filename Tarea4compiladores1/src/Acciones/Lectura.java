/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import java.io.BufferedReader;
import java.io.FileReader;
import javax.swing.JOptionPane;

/**
 *
 * @author User
 */
public class Lectura {
    
    String texto="";
int c ;
public void leerTxt(String path) { //direccion del archivo
	String linea;
        try{
            FileReader fr= new FileReader(path);
            BufferedReader bufer = new BufferedReader(fr); 
            while((linea = bufer.readLine())!= null){//haz el ciclo, mientras bfReader tiene dato
                if (c>0){
                texto=texto+"\n"+linea;
                }
                else{
                texto=texto+linea;
                }
                c++;
            }
            fr.close();
            bufer.close();
            JOptionPane.showMessageDialog(null,"El Archivo se cargo con Exito","Aviso", JOptionPane.INFORMATION_MESSAGE);
            }catch(Exception e){ 
             JOptionPane.showMessageDialog(null,"El Archivo Incorrecto,se cerrara el programa","Error", JOptionPane.INFORMATION_MESSAGE);
             }        
    }

    public String getTexto() {
        return texto;
    }
    
    
}
