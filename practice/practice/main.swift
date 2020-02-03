
//  main.swift
//  CalculationAge
//
//  Created by 박경범 on 2020/02/03.
//  Copyright © 2020 박경범. All rights reserved.
//
// 나이 계산기
// 어린이 6~13세
// 청소년 13세~19세
// 어른 20~59세
// 노인 60세 이상

import Foundation

//Model
struct Model {
}


//Controller

enum ExceptionLog: Int, Swift.Error, CustomStringConvertible {
    case invaildValue = -999   //= "입력한 값이 올바르지 않습니다."
    case failunwrapping = -998 //= "언래핑 실패"
    case failinputAges = -997  //= "나이값 오기입"
    
    var description: String {
        
        switch self {
        case .invaildValue:
            return "입력한 값이 올바르지 않습니다."
        case .failinputAges:
            return "나이값 오기입"
        case .failunwrapping:
            return "언래핑 실패"
        }
    }
}

func conversionStringToInt (_ inputValue: String) throws -> Int {
    
    guard let conversionInt = Int(inputValue) else {
        throw ExceptionLog.failunwrapping
    }
    
    return conversionInt
    
}

// Match your age

func matchYourAge (from conversionInt: Int) throws -> Int {
    guard conversionInt >= 0 else {
        throw ExceptionLog.failinputAges
    }
    
    switch conversionInt {
    case 0..<6:
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
        let calculation = try matchYourAge(from: conversion) // calculation Ages
        
    }catch let error {
        let errorCode = (error as NSError).code
        guard let exceptionLog = ExceptionLog(rawValue: errorCode) else{
            return
        }
        switch exceptionLog {
        case .invaildValue:
            print(ExceptionLog.invaildValue)
        case .failunwrapping:
            print(ExceptionLog.failunwrapping)
        case .failinputAges:
            print (ExceptionLog.failinputAges)
        }
        
    }
}



main()



/*
 
 궁금한거
 
 1.
 enum ExceptionLog: String 만 했을 떄 에러 발생. (어래와 같이 ㅠ)
 Thrown expression type 'ErrorLog' does not conform to 'Error'
 -> Swift.Error 으로 throw(에러)를 받아야 에러 발생하지 않음.
 -> throw 도 retrun 타입이 결국은 error 타입
 
 -> let errorCode = (error as NSError).code 은 error변수의 as NSError.code ( object-c 안의 NSError를 포함하는 코드 )
 
 2.
 func main() {} 에서 catch 예외처리 미숙
 -> 다시 복습 해 볼 것.
 
 
 3.
 Mvc model 에서 model 부분 없음
 
 3-1
 func matchYourAge 부분 swift 문 결과 값 View 로 이동하고 싶음
 -> Mvc modeling 다시 생각해볼 것.
 
 
 4.
 conversionStringToInt(_ : inputValue)
 -> conversionStringToInt(from : inputValue) 같은말임
 
 converionStringToInt(_ inputValue: inputvalue) <-- 이거는 왜 안되는지, 차이가 뭔지...??
 -> 문법차이.!
 
 
 */


