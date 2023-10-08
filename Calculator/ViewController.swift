//
//  ViewController.swift
//  Calculator
//
//  Created by user248619 on 10/6/23.
//

import UIKit


class ViewController: UIViewController {

    
    @IBOutlet weak var myDisplay: UILabel!
    //create variables for 2 numbesrs and operator
    var number1 = ""
    var number2 = ""
    var enterOperand = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clear()
    }

//Digit Pressed
    @IBAction func Digit_Pressed(_ sender: UIButton) {
        if enterOperand.isEmpty {
            number1 += sender.titleLabel?.text ?? ""
            myDisplay.text = number1
        } else {
            number2 += sender.titleLabel?.text ?? ""
            myDisplay.text = number2
        }
    }
    
    
    @IBAction func Operation_Pressed(_ sender: UIButton) {
        if number1.isEmpty {
                    return
                }
                
        if number2.isEmpty {
            enterOperand = sender.titleLabel?.text ?? ""
        } else {
                calculate()
                enterOperand = sender.titleLabel?.text ?? ""
                }
        
    }
    
    @IBAction func Enter_Pressed(_ sender: UIButton) {
        if !number1.isEmpty && !number2.isEmpty {
            calculate()
            enterOperand = ""
        }
    }
    
    @IBAction func Clear_Pressed(_ sender: UIButton) {
        clear()
    }
    
    @IBAction func PlusMinusButton_Pressed(_ sender: UIButton) {
        if enterOperand.isEmpty{
            if let firstValue = Double(number1){
                number1 = String(-1 * firstValue)
                myDisplay.text = number1
            }else{
                if let secondValue = Double(number2){
                    number2 = String(-1 * secondValue)
                    myDisplay.text = number2
                }
            }
                
        }
    }
    
    @IBAction func PercentageButtonPressed(_ sender: UIButton) {
        if enterOperand.isEmpty {
                // If no operator is selected, apply percentage to the first operand
                if let firstValue = Double(number1) {
                    number1 = String(firstValue / 100.0)
                    myDisplay.text = number1
                }
            } else {
                // Apply percentage to the second operand
                if let secondValue = Double(number2) {
                    number2 = String(secondValue / 100.0)
                    myDisplay.text = number2
                }
            }
    }
    
    //func calculate
    func calculate(){
        guard let num1 = Double(number1), let num2 = Double(number2)
        else{
            clear()
            myDisplay.text = "Error"
            return
        }
        var result : Double = 0.0
        
        switch enterOperand{
        case "+":
            result = num1 + num2
        case "-":
            result = num1 - num2
        case "*":
            result = num1 * num2
        case "/":
            if num2 == 0{
                clear()
                myDisplay.text = "Error"
                return
            }
            result = num1 / num2
        default:
            break
        }
        
        clear()
        number1 = String(result)
        myDisplay.text = number1
    }
    
    //func clear()
    func clear(){
        number1 = ""
         number2 = ""
         enterOperand = ""
        myDisplay.text = "0"
    }
}

