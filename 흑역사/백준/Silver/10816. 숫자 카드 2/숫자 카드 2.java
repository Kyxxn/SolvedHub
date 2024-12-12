import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.*;

class Pair implements Comparable<Pair> {
    int first;
    String second;
    Pair(int first, String second){
        this.first = first;
        this.second = second;
    }

    @Override
    public int compareTo(Pair o) {
        return Integer.compare(this.first, o.first);
    }
}

public class Main {

    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());
        HashMap<Integer, Integer> map = new HashMap<>();

        StringTokenizer st = new StringTokenizer(br.readLine(), " ");
        for(int i=0; i<N; i++){
            int key = Integer.parseInt(st.nextToken());
            if(map.containsKey(key)){
                map.put(key, map.get(key) + 1);
            }else{
                map.put(key, 1);
            }
        }
        int M = Integer.parseInt(br.readLine());
        st = new StringTokenizer(br.readLine(), " ");
        StringBuilder sb = new StringBuilder();
        for(int i=0; i<M; i++){
            int key = Integer.parseInt(st.nextToken());
            if(!map.containsKey(key)){
                sb.append(0).append(" ");
            }else {
                sb.append(map.get(key)).append(" ");
            }
        }
        System.out.println(sb);
    }
}