import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;



public class Main{

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // StringTokenizer st = new StringTokenizer(br.readLine(), " ");
        int N = Integer.parseInt(br.readLine());
        int count = 0;
        for(int i=1; i<=N; i++){
            if((i / 10) == 0 && i%3 == 0){
                count++;
            }
            else if((i/10) > 0 && (i/100) == 0){
                if(i / 10 == 3 || i / 10 == 6 || i / 10 == 9){
                    count++;
                }
                int temp = i % 10;
                if(temp == 3 || temp == 6 || temp == 9){
                    count++;
                }
            }
        }
        System.out.println(count);
    }
}