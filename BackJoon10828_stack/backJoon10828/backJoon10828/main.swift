//
//  main.swift
//  backJoon10828
//
//  Created by 박경범 on 2020/02/04.
//  Copyright © 2020 박경범. All rights reserved.
//
/*
 
 정수를 저장하는 스택을 구현한 다음, 입력으로 주어지는 명령을 처리하는 프로그램을 작성하시오.

 명령은 총 다섯 가지이다.

 push X: 정수 X를 스택에 넣는 연산이다.
 pop: 스택에서 가장 위에 있는 정수를 빼고, 그 수를 출력한다. 만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 size: 스택에 들어있는 정수의 개수를 출력한다.
 empty: 스택이 비어있으면 1, 아니면 0을 출력한다.
 top: 스택의 가장 위에 있는 정수를 출력한다. 만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 
 첫째 줄에 주어지는 명령의 수 N (1 ≤ N ≤ 10,000)이 주어진다. 둘째 줄부터 N개의 줄에는 명령이 하나씩 주어진다.
 주어지는 정수는 1보다 크거나 같고, 100,000보다 작거나 같다. 문제에 나와있지 않은 명령이 주어지는 경우는 없다.
 
 */

import Foundation

 var stack: [Int] = []

func conversionInputValueType() {

    let inputValue : String? = readLine()

    if let stringToString = inputValue {
        let conversionStringToString : String = stringToString // String? -> String
        let stringToInt = Int(conversionStringToString)   // String -> Int?

        if let intToInt = stringToInt {
            let conversionIntToInt : Int = intToInt // Int? -> Int
            conditionValue(conversionIntToInt: conversionIntToInt)
        }
    }

}

func conditionValue (conversionIntToInt : Int) {
    if conversionIntToInt >= 1 && conversionIntToInt <= 10000 {
        
        inputValueStack(conversionIntToInt: conversionIntToInt)
    }
    else {
        print("잘못된 입력입니다 다시 입력해 주세요 \n")
        conversionInputValueType()
    }
}

func inputValueStack(conversionIntToInt: Int) {
    
    for _ in 0...conversionIntToInt {
        let inputStack = readLine() ?? ""
        
        switch inputStack {
        case "pop":
            print(pop())
        case "size":
            print(size())
        case "empty":
            print(empty())
        case "top":
            print(top())
        case let x where x.contains("push"):
            let conversionIntToInt = Int(x.replacingOccurrences(of: "push ", with: ""))
            push(conversionIntToInt!)
        default:
            break
        }
        
    }
    
}

func pop() -> Int {
    return stack.isEmpty ? -1 : stack.removeFirst()
}

func size() -> Int {
    return stack.count
}

func empty() -> Int {
    return stack.isEmpty ? 1 : 0
}

func top() -> Int {
    return stack.first ?? -1
}

func push(_ conversionIntToInt: Int) {
    stack.insert(conversionIntToInt, at: 0)
}



conversionInputValueType()

// 2020.02.10
// 2020.02.11
