import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.*;

public class Main {
    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        ArrayDeque<Integer> deque = new ArrayDeque<>();

        StringBuilder sb = new StringBuilder();
        int N = Integer.parseInt(br.readLine());
        for(int i=0; i<N; i++){
            StringTokenizer st = new StringTokenizer(br.readLine(), " ");
            int cmd = Integer.parseInt(st.nextToken());
            switch (cmd){
                case 1:
                    deque.addFirst(Integer.parseInt(st.nextToken()));
                    break;
                case 2:
                    deque.addLast(Integer.parseInt(st.nextToken()));
                    break;
                case 3:
                    if(!deque.isEmpty()){
                        sb.append(deque.pollFirst()).append('\n');
                    }else{
                        sb.append(-1).append('\n');
                    }
                    break;
                case 4:
                    if(!deque.isEmpty()){
                        sb.append(deque.pollLast()).append('\n');
                    }else{
                        sb.append(-1).append('\n');
                    }
                    break;
                case 5:
                    sb.append(deque.size()).append('\n');
                    break;
                case 6:
                    if(deque.isEmpty()){
                        sb.append(1).append('\n');
                    }else{
                        sb.append(0).append('\n');
                    }
                    break;
                case 7:
                    if(!deque.isEmpty()){
                        sb.append(deque.peekFirst()).append('\n');
                    }else{
                        sb.append(-1).append('\n');
                    }
                    break;
                case 8:
                    if(!deque.isEmpty()){
                        sb.append(deque.peekLast()).append('\n');
                    }else{
                        sb.append(-1).append('\n');
                    }
                    break;
            }
        }
        System.out.println(sb);
    }
}