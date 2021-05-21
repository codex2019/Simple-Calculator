//
//  FilterViewController.swift
//  JobSearch
//
//  Created by MacX on 5/20/21.
//

import UIKit

class FilterViewController: UIViewController{
    
    @IBOutlet weak var salarTextField: UILabel!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var jobTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func salarySliderAction(_ sender: UISlider) {
        salarTextField.text = "$" + String(format: "%.2f", Float(sender.value))
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        let resultVC = ResultsViewController()
        resultVC.jobTitle = jobTitleTextField.text!
        resultVC.location = locationTextField.text!
        resultVC.fromView = "filterView"
        jobTitleTextField.text = ""
        locationTextField.text = ""
        salarTextField.text = ""
    }
    
}
