import java.util.Scanner;

public class vowel {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        
        String word = scan.nextLine();

        
        char first = word.charAt(0);

        
        if (first == 'a' || first == 'e' || first == 'i' || first == 'o' || first == 'u' ||
            first == 'A' || first == 'E' || first == 'I' || first == 'O' || first == 'U') 
            {
            System.out.println(first + " is a vowel");
            } 
        else {  
            System.out.println(first + " is not a vowel");
        }
        
    }
}

