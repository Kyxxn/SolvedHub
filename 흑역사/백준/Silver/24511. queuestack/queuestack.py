from collections import deque

N = int(input())
A = list(map(int, input().split()))
B = list(map(int, input().split()))
M = int(input())
C = list(map(int, input().split()))

answer = deque()

for structure in range(N):
    if A[structure] == 0:
        answer.appendleft(B[structure])

for i in range(M):
    answer.append(C[i])
    print(answer.popleft(), end = " ")

# for i in C:
#     popElement = i
#     for j in range(N):
#         if A[j] == 0:
#             tmp = B[j]
#             B[j] = popElement
#             popElement = tmp
#     print(popElement, end=" ")