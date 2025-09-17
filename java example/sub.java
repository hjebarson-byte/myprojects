import java.util.Scanner;

// public class demo {
//     public static void main(String [] args)
//     {
     
//      Scanner scan = new Scanner(System.in);
//      String meghana = scan.nextLine();
       

//        if(meghana.equals("win"))
//        {
//         System.out.print("Surya meets Ramya");
//        }
//        else{
//         System.out.print("Surya weds meghana");
//        }
//     }
// }

// public class demo1{
//     public static void main(String [] args)
//     {
//         Scanner scan = new Scanner(System.in);
//         int mark = scan.nextInt();
//         if(mark>35)
//         {
//             System.out.print("Pass");
//         }
//         else{
//             System.out.print("Fail");
//         }

//     }
// }

// public class demo3{
//     public static void main(String [] args)
//     {
//         Scanner scan = new Scanner(System.in);
//         int income = scan.nextInt();

//         if(income>7000)
//         {
//             System.out.print("scholarship is available");
//         }
//         else{
//             System.out.print("not Eligible for scholership");
//         }

//      }
// }

// public class math{
//     public static void main(String [] args)
//     {
//        int num = 15;
       
//        if(num % 3 == 0 && num % 5 == 0)
//        {
//         System.out.print("yes");
//        }
//        else {
//         System.out.print("no");
//        }

      
//     }

     
// }

// public class odd{
//     public static void main(String [] args)
//     {
//         Scanner scan = new Scanner(System.in);
//         System.out.print("Enter a number :");
//         int num = scan.nextInt();

//         if(num % 2 == 0)
//         {
//             System.out.print("Number is odd");
//         }
//         else
//         {
//             System.out.print("Number is even");
//         }
//     }
// }


// public class  demo4{
//     public static void main(String [] args)
//     {
//         boolean kfc = true;
//         boolean chicken = true;

//         if(kfc)
//         {
//             System.out.print("Enter into kfc");

//             if(chicken)
//             {
//                 System.out.print("Eating Chicken");
//             }


//         }

//     }
// }


// public class score{
//     public static void main(String [] args)
//     {
//         int score = 56;


//         if(score<50){
//             System.out.print(" need to improve");
        
//         }
//         else if(score>=50 && score<=70){
//             System.out.print("Good job");
//         }
//         else
//         {
//             System.out.println("Excellent");
//         }

//     }
// }

public class sub{
    public static void main(String [] args)
    {
        Scanner scan = new Scanner(System.in);
        System.out.print("Enter the subjects marks :" );

        int T = scan.nextInt();
        int E = scan.nextInt();
        int M = scan.nextInt();
        int sc = scan.nextInt();
        int so = scan.nextInt();
        int total = (T+E+M+sc+so);

        int avg = total/5;


        if(avg<35){
            System.out.print("Additional class is required");
        }
        else
        {
            System.out.print("you are good to go");
        }



    }
}
