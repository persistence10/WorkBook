
//  main.swift
//  CalculationAge
//
//  Created by 박경범 on 2020/02/03.
//  Copyright © 2020 박경범. All rights reserved.
//


import Foundation

//Model
struct Model {
    let yourAge: String
}


//Controller

enum ExceptionLog: Int, Swift.Error, CustomStringConvertible{
    case invaildValue = -999    // " 입력된 값이 올바르지 않습니다."
    case failunwrapping = -998 // " 언래핑 실패 "
    case failinputAges = -997 // " 나이값 오기입 "
    
    var description: String {
        switch self {
        case .invaildValue:
            return "입력된 값이 올바르지 않습니다."
        case .failunwrapping:
            return "언래핑 실패"
        case .failinputAges:
            return "나이값 오기입"

        }
    }
    
    
}

func conversionStringToInt (_ inputValue: String) throws -> Int {
    
    guard let conversionInt = Int(inputValue) else {
        throw ExceptionLog.failunwrapping
    }
    
    return conversionInt
   
}
    
// Match your age (Controller)
/*
 func matchYourAge(_ conversionINt: Int) throws -> Int
 함수 역할이 IntToInt 입니다. 매칭된 이름을 반환하기 위해서는 String을 return하는것이 맞아보입니다.
 ( = throws -> String )
*/
    func matchYourAge (_ conversionInt: Int) throws -> String {
        guard conversionInt >= 0 else {
            throw ExceptionLog.failinputAges
        }
        
        var yourAge: String = ""
        
        
        switch conversionInt {
        case 1..<6:
            yourAge = "Ur infant"
//            print("Ur infant")
        case 6..<14:
            yourAge = "Ur child"
//            print("Ur Child")
        case 14..<20:
            yourAge = "Ur teenager"
//            print("Ur teenager")
        case 20..<60:
            yourAge = "Ur adult"
//            print("Ur adult")
        default:
            yourAge = "Ur the aged"
//            print("Ur the aged")
        }
        
        return yourAge
    }

    

//View

func inputAges() throws -> String {
    guard let inputValue = readLine() else{
        throw ExceptionLog.invaildValue
    }
    return inputValue
    
}

func outputView(outputMessage: String) {
    print("\(outputMessage)")
}


func main() {
        
    do  {
        let inputValue = try inputAges() // String?->String
        let conversion = try conversionStringToInt(_: inputValue) // String->Int
        let calculation = try matchYourAge(_: conversion) // calculation Ages
        let model = Model(yourAge: calculation)
        outputView(outputMessage: model.yourAge)
//        let model = calculation // AgesValue return (String)
        
        
        
        
//
//                 let model = Model(sum: factorial(conversionInt, 1))
//                 outputView(model.sum)
        
        
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
        print(ExceptionLog.failinputAges)
        }
        
     }
 }
    


main()



/*

 
 
 1.
 Mvc model 에서 model 부분 없음
 1-2
 func matchYourAge 부분 swift 문 결과 값 View 로 이동하고 싶음
 
 
 2.
   conversionStringToInt(_ : inputValue)
   converionStringToInt(_ inputValue: inputvalue) <-- 이거는 왜 안되는지, 차이가 뭔지...??
 -> 문법적 차이 , converionStringToInt(_ inputValue: inputValue) 은 안됨
 -> conversionStringToInt(from : InputValue) 이 conversionStringToInt(_ : inputValue) 와 같은 의미
 
 3.
    catch let error {
    let errorCode = (error as NSError).code
 
 -> let error 이면, error as NSError 에서 swift.error , object-c 안에 있는  NSError 를 타입캐스팅 한 것.
 
    guard let exceptionLog = ExceptionLog(rawValue: errorCode) else{
        return
    }    위 구문 이해 못하겠음.
 
 
 
 */
