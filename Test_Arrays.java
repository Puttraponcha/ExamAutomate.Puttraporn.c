
import java.util.Arrays;
public class Hello {

     public static void main(String []args){
        int num[] = {15,1,32,15,7,45,16,333,32,2,1,66,999,65};
        Arrays.sort(num);
        int idx = Arrays.binarySearch(num, 15);
        for( int i = 0; i < num.length; i++)
         System.out.print (num[i]+" ");
        System.out.print ("\nfound \"15\" at index = "+ idx + "\n");
     }
}