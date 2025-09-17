import java.util.Scanner;


public class vote {
    public static void main(String [] args)
    {
        Scanner scan = new Scanner(System.in);
        System.out.print("Enter the age :");
        int age = scan.nextInt();

        if(age>18){
            System.out.println("eligible for voting");
            System.out.print("eligible");
        }else {
            int ageleft = 18 - age;
            System.out.println(" Not eligible for voting ");
            System.out.print(" you have "+ ageleft + " years left for voting ");
        }
    }
}
