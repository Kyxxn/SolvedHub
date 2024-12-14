### sort() vs sorted(by:)
- sort는 원본을 변경하며 순서를 바꿈
- sorted는 각 값을 복제하여 순서가 바뀐 배열을 반환함 -> 메모리 사용량 증가
- 모두 시간복잡도는 O(N * log(N))

### sorted(by:) 메소드
- Dictionary, Set과 같이 순서 보장을 하지 않을 경우 이런 식으로 적용 가능
    ``` swift
    let dict: [String: String] = ["A": "Apple", "B": "Banana", "C": "Cherry"]

    for key in dict.keys {
        print(key)          // B A C
    }
    
    for value in dict.keys.sorted(by: >) {
        print(value)        // C B A
    }

    ```