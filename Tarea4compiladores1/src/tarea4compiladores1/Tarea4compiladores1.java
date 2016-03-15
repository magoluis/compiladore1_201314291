/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tarea4compiladores1;

import Formulario.ventana;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.UnsupportedLookAndFeelException;

/**
 *
 * @author User
 */
public class Tarea4compiladores1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) 
        {
            if ("Windows".equals(info.getName())) 
            {
                try {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | UnsupportedLookAndFeelException ex) {
                    Logger.getLogger(Tarea4compiladores1.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } 
       
       ventana ven=new ventana();
       ven.setVisible(true);
    }
    
}
