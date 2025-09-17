import java.util.Scanner;


public class max {
    public static void main(String [] args)
    {
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter the number :");
        int a  = scan.nextInt();
        System.out.println("Enter the number :");
        int b = scan.nextInt();
        System.out.println("Enter the number :");
        int c = scan.nextInt();

        if(a >= b && a >=c){
            System.out.print(a + " is a greater number");
        }
        else if(b >=c && b >= a ){
            System.out.print(b + " is a greater number");
        }
        else{
            System.out.print(c + " is a greater number");
        }

    }
}
