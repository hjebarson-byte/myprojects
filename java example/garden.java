public class garden {

    int apple_price = 20;
    int apple_count = 5;

    void total_money()
    {
        System.out.println(apple_price * apple_count);
    }
    public static void main(String [] args)
    {
        garden obj1 = new garden();
        obj1.total_money();
    }
}

