import java.util.*;


// public class fib {
//     public static void main(String [] args)
//     {
//         int a = 0;
//         int b = 1;

//         for(int i = 0;i < 10; i++){
//             b = a + b;
//             a = b - a;
    
//             System.out.println(a);
//         }
//     }
// }

// public class fact{
//     public static void main(String [] args)
//     {
    
//         int a = 1;
//         int b = 2;
//         int c = 3;
        

//         for (int i = 1; i > 3; i--){
//             c = c * b * a;
            
//             System.out.print(c);
            
//         }
//     }
// }
public class Factorial {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter a number");
        int num = scan.nextInt();
        int fact = 1;

        for (int i = 1; i <= num; i++) {
            fact = fact * i;
        }
        System.out.println(fact);
    }
}




