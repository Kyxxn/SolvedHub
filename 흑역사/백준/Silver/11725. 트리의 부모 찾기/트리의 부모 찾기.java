import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;



public class Main{
    static ArrayList<Integer> list[];
    static int N;
    static boolean[] visited;
    static int[] parent;

    public static void DFS(int V){
        visited[V] = true;

        for(int w : list[V]){
            if(!visited[w]){
                parent[w] = V;
                DFS(w);
            }
        }
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        N = Integer.parseInt(br.readLine());
        list = new ArrayList[N+1];
        visited = new boolean[N+1];
        parent = new int[N+1];

        for(int i=0; i<N+1; i++){
            list[i] = new ArrayList<>();
        }

        for(int i=0; i<N-1; i++) {
            StringTokenizer st = new StringTokenizer(br.readLine(), " ");
            int a = Integer.parseInt(st.nextToken());
            int b = Integer.parseInt(st.nextToken());

            list[a].add(b);
            list[b].add(a);
        }

        DFS(1);

        for(int i=2; i< visited.length; i++){
            System.out.println(parent[i]);
        }
    }
}