import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;



public class Main{

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine(), " ");
        int N = Integer.parseInt(st.nextToken());
        int M = Integer.parseInt(st.nextToken());
        char[][] list = new char[N][M];

        for(int i=0; i<N; i++){
            String tmp = br.readLine();
            for(int j=0; j<M; j++){
                list[i][j] = tmp.charAt(j);
            }
        }
        int r_count = 0;
        int c_count = 0;
        for(int i=0; i<N; i++){
            boolean check = false;
            for(int j=0; j<M; j++){
                if(list[i][j] == 'X'){
                    check = true;
                    break;
                }
            }

            if(!check) r_count++;
        }
        for(int i=0; i<M; i++){
            boolean check = false;
            for(int j=0; j<N;j++){
                if (list[j][i] == 'X') {
                    check = true;
                    break;
                }
            }
            if(!check) c_count++;
        }
        System.out.println(Math.max(r_count,c_count));
    }
}