//
//  CalculatorViewConroller.swift
//  Calculator
//
//  Created by Никита Долгих on 05/03/2023.
//

import UIKit
import SwiftUI

class MainViewController: UIViewController {
    
    var numberFromScreen:Double = 0;
    var firstNum:Double = 0;
    var operation:Int = 0;
    var mathSign:Bool = false;
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true{
            resultLabel.text = String(sender.tag)
            mathSign = false
        }
        else{
            resultLabel.text = resultLabel.text! + String(sender.tag)
        }
        numberFromScreen = Double(resultLabel.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if resultLabel.text != "" && sender.tag != 10 && sender.tag != 15{
            firstNum = Double(resultLabel.text!)!
            if sender.tag == 11 { //Деление
                resultLabel.text  = "/"
            }
            else if sender.tag == 12 { //Умножение
                resultLabel.text  = "x"
            }
            else if sender.tag == 13 { //Вычитание
                resultLabel.text  = "-"
            }
            else if sender.tag == 14 { //Сложение
                resultLabel.text  = "+"
            }
            operation = sender.tag
            mathSign = true;
        }
        else if sender.tag == 15{ //посчитать всё
            if operation == 11{
                resultLabel.text = String(firstNum / numberFromScreen)
            }
            else if operation == 12{
                resultLabel.text = String(firstNum * numberFromScreen)
            }
            else if operation == 13{
                resultLabel.text = String(firstNum - numberFromScreen)
            }
            else if operation == 14{
                resultLabel.text = String(firstNum + numberFromScreen)
            }
        }
        else if sender.tag == 10{
            resultLabel.text = ""
            firstNum = 0
            numberFromScreen = 0
            operation = 0
        }
    }
}
