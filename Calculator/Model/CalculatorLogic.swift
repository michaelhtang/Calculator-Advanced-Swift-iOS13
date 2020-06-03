//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Michael Tang on 2020-06-02.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    //number is that being passed in when user presses the number on the calc
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    
    
    mutating func calcMethod(method: String) -> Double? {
        if let n = number {
            if method == "+/-" {
                return  n * -1.0
            }
            else if method == "AC" {
                return  0
            }
            else if method == "%" {
                return  n / 100
            }
             else if method == "=" {
                return performTwoNumCalculation(n2: n )
                
            } else {
                intermediateCalculation = (n1: n, calcMethod: method)
//                return n
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
            let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "÷":
                return n1 / n2
            case "×":
                return n1 * n2
            default:
                fatalError("Operation passed in does not match any of the cases.")
            }
}
        return nil
}
}
