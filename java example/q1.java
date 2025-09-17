import java.util.Scanner;



public class q1 {
    public static void main(String [] args)
    {
        Scanner scan = new Scanner(System.in);
        String name = scan.nextLine();
        int Age = scan.nextInt();
        scan.nextLine();
        String address = scan.nextLine();
        System.out.println("My name is " + name);
        System.out.println("My age is " + Age);
        System.out.print("My address is " + address);
    }
    }
    
