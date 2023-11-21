import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.*;

public class Main{
    public static void main(String[] args) throws Exception{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());
        int result = Integer.parseInt(br.readLine());

        int MAX = N * N;
        int[][] arr = new int[N][N];
        int x = N/2, y = N/2;
        int value = 1;

        int limit = 1;
        while(true){
            for(int i=0; i<limit; i++){
                arr[y--][x] = value++;
            }
            if(value -1 == MAX) break;
            for(int i=0; i<limit; i++){
                arr[y][x++] = value++;
            }
            limit++;

            for(int i=0; i<limit; i++){
                arr[y++][x] = value++;
            }

            for(int i=0; i<limit; i++){
                arr[y][x--] = value++;
            }
            limit++;
        }

        int r_x=0, r_y=0;
        StringBuilder sb = new StringBuilder();
        for(int i=0; i<N; i++){
            for(int j=0; j<N; j++){
                sb.append(arr[i][j]).append(" ");
                if(arr[i][j] == result){
                    r_x = i+1;
                    r_y = j+1;
                }
            }
            sb.append("\n");
        }
        sb.append(r_x + " " + r_y);
        System.out.println(sb);
    }
}