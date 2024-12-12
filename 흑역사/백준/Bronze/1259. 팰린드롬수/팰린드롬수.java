import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;



public class Main{
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String str = br.readLine();
        while(!str.equals("0")) {
            boolean check = true;
            int count = str.length() / 2;

            for (int i = 0; i < count; i++) {
                if (str.charAt(i) != str.charAt(str.length() - i - 1)) {
                    check = false;
                }
            }

            if (check) {
                System.out.println("yes");
            } else {
                System.out.println("no");
            }
            str = br.readLine();
        }
    }
}