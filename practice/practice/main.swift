//
//  main.swift
//  practice
//
//  Created by 박경범 on 2020/02/02.
//  Copyright © 2020 박경범. All rights reserved.


// 나이 계산기
// 어린이 6~13세
// 청소년 13세~19세
// 어른 20~59세
// 노인 60세 이상

import Foundation

let conversionInt: Int = 0



//Model
struct Model {
    
    
}


//Controller

enum ExceptionLog: String, Swift.Error {
    case invaildValue = "입력한 값이 올바르지 않습니다."
    case failunwrapping = "언래핑 실패"
    case failinputAges = "나이값 오기입"
    
}

func conversionStringToInt (_ inputValue: String) throws -> Int {
    
    guard let conversionInt = Int(inputValue) else {
        throw ExceptionLog.failunwrapping
    }
    
    return conversionInt
   
}
    
// Match your age

    func matchYourAge (_ converionInt: Int) throws -> Int {
        guard conversionInt >= 0 else {
            throw ExceptionLog.failinputAges
        }
        
        switch conversionInt {
        case 1..<6:
            print("Ur infant")
        case 6..<14:
            print("Ur Child")
        case 14..<20:
            print("Ur teenager")
        case 20..<60:
            print("Ur adult")
        default:
            print("Ur the aged")
        }
        
        return 0
    }

    

//View

func inputAges() throws -> String {
    guard let inputValue = readLine() else{
        throw ExceptionLog.invaildValue
    }
    return inputValue
    
}


func main() {
        
    do  {
        let inputValue = try inputAges() // String?->String
        let conversion = try conversionStringToInt(_ : inputValue) // String->Int
        let calculation = try matchYourAge(_ : conversion) // calculation Ages
        
    }catch {
        
        
        
     }
 }
    


main()



/*
 
 궁금한거
 
 1.
 enum ExceptionLog: String 만 했을 떄 에러 발생. (어래와 같이 ㅠ)
 Thrown expression type 'ErrorLog' does not conform to 'Error'

 
 2.
 func main() {} 에서 catch 예외처리 미숙
 
 
 3.
 Mvc model 에서 model 부분 없음
 3-1
 func matchYourAge 부분 swift 문 결과 값 View 로 이동하고 싶음
 
 
 4.
   conversionStringToInt(_ : inputValue)
   converionStringToInt(_ inputValue: inputvalue) <-- 이거는 왜 안되는지, 차이가 뭔지...??
 
 
 
 
 */
