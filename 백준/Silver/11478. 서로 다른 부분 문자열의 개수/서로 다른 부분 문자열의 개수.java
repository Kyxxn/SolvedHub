import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.*;

public class Main {
    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String str = br.readLine();
        HashMap<String, Integer> map = new HashMap<>();

        for(int i=0; i< str.length(); i++){
            for(int j= i+1; j<= str.length(); j++){
                map.put(str.substring(i, j) , 1);
            }
        }
        System.out.println(map.size());
    }
}