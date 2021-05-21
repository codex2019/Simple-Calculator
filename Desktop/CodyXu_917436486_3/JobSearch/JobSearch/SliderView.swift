//
//  SliderView.swift
//  JobSearch
//
//  Created by MacX on 4/1/21.
//

import UIKit

class SliderView: UIViewController {
    var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slider = UISlider(frame: CGRect(x: 100, y: 100, width: 200, height: 23))
        slider.center = view.center
        slider.minimumValue = 0
        slider.maximumValue = 1000000
        slider.value = slider.maximumValue / 2.0
        
        view.addSubview(slider)
        
        slider.addTarget(self, action:Selector(("sliderValueChanged:")), for: UIControl.Event.valueChanged)
    }
    
    func sliderValueChanged(sender: UISlider) {
       
    }


}
