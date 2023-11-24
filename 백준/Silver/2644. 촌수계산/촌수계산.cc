#include <iostream>
#include <queue>
#include <vector>
#include <algorithm>
#include <string>
#include <unordered_map>
#include <sstream>
using namespace std;
#define MAX 102

int n, human1, human2, m;
int graph[MAX][MAX] = {0,};
int visited[MAX] = {0, };
queue<int> q;

void bfs(int V){
    q.push(V);
    
    while(!q.empty()){
        V = q.front();
        q.pop();
        for(int w=1; w<=n; w++){
            if(visited[w] == 0 && graph[V][w] == 1){ // 방문은 안 헀지만, 방문해야 한다면?
                q.push(w);
                visited[w] = visited[V] + 1;
            }
        }
    }
}

// 거리가 1인, 양방향 연결 그래프
int main(void){
    cin >> n; // 최대 번호
    cin >> human1 >> human2; // 출발지와 목적지
    cin >> m; // 커플 수
    
    for(int i=0; i<m; i++){
        int x, y;
        cin >> x >> y;
        graph[x][y] = graph[y][x] = 1;
    }
    
    bfs(human1);
    
    if(visited[human2] == 0){
        cout << -1;
    }else{
        cout << visited[human2];
    }
    
    return 0;
}

