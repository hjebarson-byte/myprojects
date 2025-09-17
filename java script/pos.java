import java.util.Scanner;

public class pos {

  public static void main(String [] args)
  {
    Scanner scan  = new Scanner(System.in);
    
    System.out.print("Enter a number : ");
    int num = scan.nextInt();

    if(num > 0){
        System.out.println( num + " This is a positive number");
    } else if(num < 0){
        System.out.println( num + " This is a negative number");
    }else {
        System.out.println("This number is zero");
    }

  }
}
