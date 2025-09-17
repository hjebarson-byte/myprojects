public class fun {
    void greeting()
    {
        System.out.println("vanakkam");
        dummy();
    }
    void dummy()
    {
        System.out.println("vana");
    }

    public static void main(String [] args)
    {
        fun obj1 = new fun();
        obj1.greeting();
        obj1.dummy();
    }
}
