//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Efra Hdz on 13/05/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(simbol:String) -> Double? {
        
        if let n = number {
            if simbol == "+/-" {
                return n * -1
            } else if simbol == "AC" {
                return  0
            } else if simbol == "%" {
                return n * 0.01
            } else if simbol == "=" {
                return performTwoNumCalculation(n2: n)
            } else {
                intermediateCalculation = (n1: n, calcMethod: simbol)
            }
        }
        
        return nil
        
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases")
            }
            
        }
        
        return nil
    }
    
}
