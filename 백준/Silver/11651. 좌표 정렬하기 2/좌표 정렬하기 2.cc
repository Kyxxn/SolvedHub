#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

bool compare(const pair<int, int>& a, const pair<int, int>& b){
    if(a.second == b.second){
        return a.first < b.first;
    }
    return a.second < b.second;
}

int main(void){
    int N, x, y;
    cin >> N;

    vector<pair<int, int>> vt;
    for(int i=0; i<N; i++){
        cin >> x >> y;
        vt.push_back({x, y});
    }

    sort(vt.begin(), vt.end(), compare);

    for(int i=0; i<N; i++){
        cout << vt[i].first << " " << vt[i].second << '\n';
    }

    return 0;
}