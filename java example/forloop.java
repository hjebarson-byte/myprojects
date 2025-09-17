import java.util.Scanner;

public class forloop {
    // public static void main(String [] args)
    // {

    //     int evencount = 0;

    //     // Scanner scan = new Scanner(System.in);
    //     // System.out.println("Enter the number");
    //     // int a = scan.nextInt();
    //     // System.out.println("Enter the number");
    //     // int b = scan.nextInt();

    //     for(int i = 1;i<=10;i = i+1)
    //     {
    //         if(i % 2 == 0){
    //             evencount = evencount + 1;
    //         }
            
    //     }
    //     System.out.println(evencount);
    // }

    // public static void main(String [] args)
    // {
        
    //     for(int i = 1;i <= 100 ;i = i+1)
    //     {
    //       if(i % 3 == 0 && i % 5 == 0){
    //         System.out.println( i );
    //       }
    //     }
    // }

    // public static void main(String [] args)
    // {
    //   for(int i = 1;i <= 5; i = i+1){

    //     for(int j = 1; j <= i; j++)
    //     {
    //       System.out.print("*");
    //     }
    //     System.out.println();
        
    //   }
    // }
    // public static void main(String [] args)
    // {
    //   int ncount = 0;

    //   for(int i = 1; i<=10; i = i+1)
    //   {
    //     ncount = ncount + 1;
    //   }
    //   System.out.print(ncount);
    // }

    // public static void main(String [] args)
    // {
    //   int evencount = 0;
    //   for(int i = 1; i<=100; i = i+1){
    //     evencount = evencount + 1;
    //     if(i % 2 == 0)
    //     {
    //       System.out.println(i);
    //     }
    //     System.out.println(evencount);

    //   }
    // }

    // public static void main(String [] args)
    // {
    //   int num = 5;
    //   for(int i = 1;i<=10 ; i++)
    //   {
    //     System.out.println(num + "x" + i +"=" +(num * i));
    //   }
    // }

    // public static void main(String [] args)
    // {
    //   Scanner scan = new Scanner(System.in);
    //   System.out.print("Enter the number: ");

    //   int num = scan.nextInt();
    //   int fact = 1;

    //   for(int i = 1; i<=num; i++)
    //   {
    //     fact = fact * 1;
    //   }
    //   System.out.println("Factorial of "+ num + "is:" + fact);
    // }

    // public static void main(String [] args)
    // {
    //   Scanner scan = new Scanner(System.in);
    //   System.out.print("Enter a number: ");
    //   int num = scan.nextInt();

    //  for(int i = 1;i < num;i = i+1)
    //  {
    //   if(num % i == 0){
    //     System.out.println("Not a prime number");
    //     return;
    //   }
    //   else{
    //     System.out.println("Its a prime number");
    //   }
    //  }
    // }

   


    // public static void main(String[] args) {
    //     int rows = 5;

    //     for (int i =1; i <= rows; i++) {
    //         for (int j = i; j < rows; j++) {
    //             System.out.print(" ");
    //         }
    //         for (int k = 1; k <= 4 * i -8; k++) {
    //             System.out.print("*");
    //         }
    //         System.out.println(); 
    //     }
    // }

    public static void main(String [] args)
    {
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter a word");
        String word = scan.nextLine();
        String wordrev = "";
        System.out.println("Original String is: " + word);

        for(int i = 0 ; i < word.length();i++)
        {
            wordrev = word.charAt(i) + wordrev;
        }
        System.out.println("Reversed String is: " + wordrev);
        
    }
}



