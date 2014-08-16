//
//  UIColorWithHex.swift
//
//  A swift extension for the UIColor class that takes in a web color
//  (HEX color i.e. #FFFFFF) and returns a UIColor object with the
//  matching color. This extension is free to use, modify, and reuse
//  but all that I ask is credit if you use it.
//
//  Created by Brandon lassiter on 8/14/14.
//  http://www.brandonlassiter.com
//  Copyright (c) 2014 Brandon Lassiter. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    // Converts supplied HEX value to a UIColor
    class func colorWithHex (var hexString: String, opacity: Double) -> UIColor {
        
        hexString = hexString.lowercaseString
        
        var hexArray:[Int] = [Int]()
        var redNum:CGFloat = CGFloat()
        var greenNum:CGFloat = CGFloat()
        var blueNum:CGFloat = CGFloat()
        
        for letter in hexString {
            
            switch (letter) {
            
            case "a":
                hexArray.append(10)
            case "b":
                hexArray.append(11)
            case "c":
                hexArray.append(12)
            case "d":
                hexArray.append(13)
            case "e":
                hexArray.append(14)
            case "f":
                hexArray.append(15)
            default:
                hexArray.append(String(letter).toInt()!)
            }
            
            
        }
        
        if(hexArray.count == 6) {
            
            for(var i = 0; i < (hexArray.count / 2); i++) {
                
                var num1:Int = hexArray[i*2]
                var num2:Int = hexArray[i*2+1]
                
                switch (i) {
                    
                case 0:
                    redNum = CGFloat(num2 + (num1 * 16)) / 255.0
                case 1:
                    greenNum = CGFloat(num2 + (num1 * 16)) / 255.0
                case 2:
                    blueNum = CGFloat(num2 + (num1 * 16)) / 255.0
                default:
                    println("Do nothing because swift is dumb")

                }
                
            }
            
        } else {

            redNum = 0
            greenNum = 0
            blueNum = 0
            
        }
        
        var color:UIColor = UIColor( red:redNum, green: greenNum, blue: blueNum, alpha:CGFloat(opacity) )
        
        return color
        
    }
    
    // Creates a random color
    func randomColor(alpha:Double) -> UIColor {
        
        var myColor:UIColor = UIColor.colorWithHex(generateRandomHex(), opacity: alpha)
        
        return myColor
        
    }
    
    // Generates a random HEX value for the random color
    private func generateRandomHex() -> String {
        
        var outputString:String = String()
        
        for(var i = 0; i < 6; i++) {
            
            var num:Int = Int(arc4random() % 15)
            
            switch(num) {
            case 0, 1, 2, 3, 4, 5, 6, 7, 8, 9:
                outputString += String(num)
            case 10:
                outputString += "A"
            case 11:
                outputString += "B"
            case 12:
                outputString += "C"
            case 13:
                outputString += "D"
            case 14:
                outputString += "E"
            case 15:
                outputString += "F"
            default:
                println("Do nothing because swift is dumb")
            }
            
            
        }
        
        return outputString
        
    }
    
}