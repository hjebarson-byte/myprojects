import java.util.Scanner;

public class array {
    // public static void main(String [] args)
    // {
    //     int [] marks = new int[10];

    //     Scanner scan = new Scanner(System.in);

    //     for(int i = 1;i<=10; i = i+1){
    //         System.out.println(i);
    //     }

        
        
    // }

    // public static void main(String [] args)
    // {

    //     Scanner scan = new Scanner(System.in);
        

    //     for(int i = 1; i <= 10;i = i+1)
    //     {
    //         System.out.println( i + " x 2 = " + i * 2);
    //     }
        
    // }



    // public static void main(String [] args)
    // {
    //     Scanner scan = new Scanner(System.in);

    //     int size  = scan.nextInt();
    //     int [] marks = new int[size];

    //     for(int i = 0; i<=size;i=i+1)
    //     {
    //         System.out.println(i);
    //     }
    // }

    // public static void main(String [] args)
    // {
      
       
    //     int [] num = {10,20,30,40,50,60,70,80,90,99};

    //     for(int i = 0;i < num.length ;i = i+1){
    //         System.out.println(num[i]);
    //     }

    // }

    // public static void main(String [] args)
    // {
    //     Scanner scan = new Scanner(System.in);
    //     int t = scan.nextInt();
        
    //     for(int i = 1; i<=10;i = i+1)
    //     {
    //         System.out.println(i + " x 10 = " + i*t);
    //     }
    // }


    // public static void main(String [] args)
    // {
    //     Scanner scan = new Scanner(System.in);
    //     int size = scan.nextInt();
    //     int [] marks = new int[size];

    //     for(int i = 0;i <=size-1 ;i = i+1)
    //     {
    //         marks[i] = scan.nextInt();

    //     }

    // }

    // public static void main(String [] args)
    // {
    //      for(int j = 1; j <= 3;j = j+1)
    //     {
    //         for(int i = 1; i <= j;i = i+1)
    //     {
    //         System.out.print("*");
    //     }
    //       System.out.println();
    //     }

        
    // }


    public static void main(String [] args)
    {
       int [] arr = {20,40,60,70,80,10};
       int max = arr[0];

       for (int i = 1; i < arr.length;i++)
       {
        if(arr[i] > max){
            max = arr[i];
        }
       }
       System.out.println("Largest " + max);
    }

    // public static void main(String [] args)
    // {
    //     int [] arr = {2,5,6,7,9,10,1};
    //     int min = arr[0];

    //     for(int i = 1; i < arr.length;i++)
    //     {
    //         if(arr[i] < min){
    //             min = arr[i];
    //         }
    //     }
    //     System.out.println("Smallest number is: " + min);
    // }
}

















