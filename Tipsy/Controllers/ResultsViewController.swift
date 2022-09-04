//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Avi Kasliwal on 04/09/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var perPersonAmount: Float = 0.0
    var tipPercent: Int?
    var personCount: Int?
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = String(perPersonAmount)
        settingsLabel.text = "Split between \(personCount ?? 2) people, with \(tipPercent ?? 0)% tip."
    }
}
