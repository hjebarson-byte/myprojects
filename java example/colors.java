import java.util.Scanner;

public class colors {
    public static void main(String [] args)
    {
        Scanner scan = new Scanner(System.in);
        System.out.print("Select a color :");
        String c = scan.nextLine();
        
        
       if(c.equals("red")){
            System.out.print("Stop");
       }
       else if(c.equals("yellow"))
       {
        System.out.print("get ready");
       }
       else if(c.equals("green"))
       {
        System.out.print("go");
       }
       


        
    }
}
