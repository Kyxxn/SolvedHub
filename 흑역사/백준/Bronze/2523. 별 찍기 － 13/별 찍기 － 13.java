import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;



public class Main{

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // StringTokenizer st = new StringTokenizer(br.readLine(), " ");

        int N = Integer.parseInt(br.readLine());
        for(int i=1; i<=2*N -1; i++){
            if(i < N){
                for(int j=0; j<i; j++){
                    System.out.print("*");
                }
                System.out.println();
            }else{
                for(int j=i-N; j<N; j++){
                    System.out.print("*");
                }
                System.out.println();
            }
        }
    }
}