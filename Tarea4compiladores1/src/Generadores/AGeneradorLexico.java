package Generadores;

import java.io.File;

/**
 *
 * @author Joaquin
 */
public class AGeneradorLexico 
{
    
    public static void main(String[] args) 
    {
        String path="src\\Analizadores\\lexicoT.jflex";
        generarLexer(path);
    }    
    public static void generarLexer(String path)
    {
        File file=new File(path);
        JFlex.Main.generate(file);
    } 
    
}
