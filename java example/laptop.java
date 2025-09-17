public class laptop {
    String name = "";
    String proc = "";
    int ram = 0;
    int price = 0;
    

    public static void main(String [] args)
    {
        laptop lap1 = new laptop();

        lap1.name = "acer";
        lap1.proc = "i5";
        lap1.ram = 8;
        lap1.price = 80000;

        laptop lap2 = new laptop();

        lap2.name = "asus";
        lap2.proc = "i7";
        lap2.ram = 16;
        lap2.price = 100000;

        laptop lap3  = new laptop();
        System.out.println(lap1.ram);


    }
}
