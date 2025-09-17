import java.util.*;

public class Hashset {
    // public static void main(String [] args)
    // {
    //     HashSet<Integer> hs = new HashSet<>();

    //     hs.add(1);
    //     hs.add(2);
    //     hs.add(1);

    //     System.out.println("HashSet Size: " + hs.size());
    //     System.out.println(hs);

    // }

    public static void main(String [] args)
    {
        HashSet<String> hs = new HashSet<String>();

        hs.add("sodh");
        hs.add("nmljsdf");
        hs.add("ojnsef");
        hs.add("pbsdkjse");
        hs.add("vassdf");

        System.out.println(hs);
        System.out.println(hs.remove("vassdf"));    

    }
}
