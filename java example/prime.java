import java.util.Scanner;
import java.util.*;

// public class prime {
//     public static void main(String[] args) {
//         int n = new Scanner(System.in).nextInt(); 

//         for (int i = 2; i < n; i++) {
            
//             if (n % i == 0) { 
//                 System.out.println("Not Prime");
//                 return; 
//             }
//         }
//         System.out.println("Prime");
//     }
// }
 public class prime {
    public static void main(String [] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("");
        int num = 29;

        for (int i = 2; i < num; i++) {
            if (num % i == 0) {
                System.out.println(num + " is NOT Prime");
                return; 
            }
        }
        System.out.println(num + " is Prime");
    }
}
