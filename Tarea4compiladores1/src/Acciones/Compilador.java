/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Analizadores.LexicoT;
import Analizadores.Nodo;
import Analizadores.SintacticoT;
import java.awt.Desktop;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTextPane;

/**
 *
 * @author Joaquin
 */
public class Compilador 
{
    
    public void Analizar(String entrada)
    {
        try 
        {
            //crear el lexico
            LexicoT lexico = new LexicoT(new StringReader(entrada));
            //crear el sintactico
            SintacticoT parser = new SintacticoT(lexico);
            
            //ejecutar el analisis
            parser.parse();
           
                                    
            JOptionPane.showMessageDialog(null, "Analisis Completo","Ejemplo 1 AST",1);
            
            //Graficar
            //this.graficarAST(parser.raiz);            
            Graficador g = new Graficador();
            g.graficarAST(parser.raiz);
            
            //Recorrido
          
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(Compilador.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, "Ocurrio un grave problema","Ejemplo 1 AST",2);
        }        
    }
        
  
    
    
}
