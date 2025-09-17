import java.util.*;

public class q4 {
    public static void main(String [] args)
    {
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter your Salary :");
        int salary = scan.nextInt();
        System.out.println("Enter your age :");
        int age = scan.nextInt();

        if(salary>=20000 || age<=25){
            System.out.println("Eligible for loan");
            System.out.println("How much loan do you want?");
            int loan = scan.nextInt();
            if(loan<50000){
                System.out.print("loan available");
            }
            else {
                System.err.print("Loan not available");
            }
            
        }
        else
        {
            System.out.print("no loan");
        }
    }
}
