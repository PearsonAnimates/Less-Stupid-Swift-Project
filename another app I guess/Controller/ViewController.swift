//
//  ViewController.swift
//  another app I guess
//
//  Created by Amaya Penunuri, Yael on 10/10/17.
//  Copyright © 2017 Amaya Penunuri, Yael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var colorTool : ColorTools = ColorTools()
    @IBOutlet weak var firstButt: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func firstButt(_ sender: UIButton) { 
        if(firstButt.backgroundColor == .orange)
        {
            firstButt.setTitleColor(.orange, for: .normal)
            firstButt.backgroundColor = .black
            
        }
        else
        {
            firstButt.setTitleColor(.black, for: .normal)
            firstButt.backgroundColor = .orange
        }
        view.backgroundColor =
        colorTool.createRandomColor()
    }
    
    @IBOutlet weak var EpilepsyButton: UIButton!
    
    
    @IBAction func Epilepsy_Button(_ sender: UIButton) {
        var count : Int = 0
        while(count < 5)
        {
            delay(1.0){
                count = +1;
            }
            
            view.backgroundColor =
            colorTool.createRandomColor()
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    



}

