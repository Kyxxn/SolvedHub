### String(format:)
[10250 문제](https://www.acmicpc.net/problem/10250)를 풀다가 1층인 경우 "01"을, 10층인 경우 "10"을 출력해야 했음
조건문을 추가해서 출력하기 보다, `String(format: "%2d", 변수명)`을 통해서 해결할 수 있었음
대신, Foundation을 사용해야 함