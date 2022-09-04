//
//  ViewController.swift
//  Tipsy
//


import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var perPersonAmount: Float?
    var tipPct: Float = 0
    var personCount: Float = 2.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // Unselect All
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        // Select the caller
        sender.isSelected = true
        
        // Hide keyboard when a tip is selected
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String (Int (sender.value))
        
        if splitNumberLabel.text == "12" {
            print("12")
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if tenPctButton.isSelected {
            tipPct = 0.1
        } else if twentyPctButton.isSelected {
            tipPct = 0.2
        } else {
            tipPct = 0
        }
        
        let amount = Float (billTextField.text ?? "0") ?? 0.0
        personCount = Float (splitNumberLabel.text!) ?? 2.0
        perPersonAmount = (amount + (amount * tipPct)) / personCount
        
        performSegue(withIdentifier: "resultsSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultsSegue" {
            
            // rvc => result view controller
            let rvc = segue.destination as! ResultsViewController
            
            rvc.perPersonAmount = perPersonAmount ?? 0.0
            rvc.tipPercent = Int (tipPct * 100)
            rvc.personCount = Int (personCount)
        }
    }
}

