import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Vector;

public class Link {
    
    public static void main(String [] args)
    {
        ArrayList<String> names= new ArrayList<String>();
        names.add("jebarson");
        names.add("kevinson");
        names.add("vibin");
        names.add("samuu");

        names.remove(1);
        System.out.println(names);


        LinkedList<String> numbers = new LinkedList<String>();

        numbers.add("one");
        numbers.add("two");
        numbers.add("three");
        numbers.add("four");
        numbers.add("five");

        numbers.remove(0);
        numbers.add(0,"1");
        System.out.println(numbers);

        Vector<Integer> v = new Vector<>(3,2);

        v.addElement(1);
        v.addElement(2);
        v.addElement(3);

        v.insertElementAt(0, 1);
        v.removeElementAt(2);

        for(int i : v){
            System.out.println(i);
        }


        

    }
}
