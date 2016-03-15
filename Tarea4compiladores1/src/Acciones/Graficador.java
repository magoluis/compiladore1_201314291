package Acciones;

import Analizadores.Nodo;
import java.awt.Desktop;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Joaquin
 */
public class Graficador 
{
    int contador;
    public void graficarAST(Nodo raiz)
    {
        String ruta_dot = System.getProperty("user.home") + File.separator +"Desktop"+File.separator+"ars.dot"; 
        String ruta_png = System.getProperty("user.home") + File.separator +"Desktop"+File.separator+"ars.png"; 
        
        this.armar_Cuerpo_dot(raiz, ruta_dot);        
        
        this.crearGrafo(ruta_dot, ruta_png);
        
        this.autoAbrir(ruta_png);        
    }
        
    private void crearGrafo(String ruta_dot, String ruta_png)
    {
        String tParam = "-Tpng";    String tOParam = "-o";        
        String[] cmd = new String[5];
        cmd[0] = "C:\\Program Files (x86)\\Graphviz2.38\\bin\\dot.exe";   cmd[1] = tParam;    cmd[2] = ruta_dot;
        cmd[3] = tOParam;   cmd[4] = ruta_png;
        Runtime rt = Runtime.getRuntime();
        
        try 
        {
            rt.exec( cmd );                                    
        } 
        catch (IOException ex) 
        {Logger.getLogger(Compilador.class.getName()).log(Level.SEVERE, null, ex);}
    }
    
    private void autoAbrir(String ruta)
    {
        try
        {
            if(new File(ruta).exists())
            {
                Desktop.getDesktop().open(new File(ruta));
            }
        }
        catch (IOException ex) 
        {Logger.getLogger(Compilador.class.getName()).log(Level.SEVERE, null, ex);}
    }
    
    private void armar_Cuerpo_dot(Nodo raiz, String ruta_dot)
    {
        contador=0;
        StringBuffer buffer=new StringBuffer();
        buffer.append("\ndigraph G {\r\nnode [shape=doublecircle, style=filled, color=khaki1, fontcolor=black];\n");        
        this.listarNodos(raiz, buffer);
        this.enlazarNodos(raiz, buffer);        
        buffer.append("}");
        this.creararchivo(ruta_dot, buffer.toString());
    }
    
    private void listarNodos(Nodo praiz, StringBuffer buffer)
    {        
        //graphviz+="node"+contador+"[label=\""+praiz.valor+"\"];\n";
        buffer.append("node").append(contador).append("[label=\"").append(praiz.valor).append("\"];\n");
        praiz.id=contador;  contador++;        
        for(Nodo temp:praiz.hijos)
        {
            listarNodos(temp,buffer);
        }
    }    
    
    private void enlazarNodos(Nodo praiz, StringBuffer bufffer)
    {        
        for(Nodo temp:praiz.hijos)
        {            
            String relacion="\"node"+praiz.id+"\"->";
            relacion+="\"node"+temp.id+"\";\n";
            bufffer.append(relacion);
            enlazarNodos(temp, bufffer);
        }
    } 
    
    public synchronized void creararchivo(String pfichero,String pcontenido)
    {   
        FileWriter archivo = null;
   
        try{archivo = new FileWriter(pfichero);} 
        catch (IOException ex) 
        {Logger.getLogger(Compilador.class.getName()).log(Level.SEVERE, null, ex);}

        File a = new File(pfichero);        
        if (!a.exists()){return;}   
        
        try(PrintWriter printwriter = new PrintWriter(archivo)) 
        {
            printwriter.print(pcontenido);
            printwriter.close();
        }
    }
}
