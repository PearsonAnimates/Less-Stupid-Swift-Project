//
//  SecondScreenController.swift
//  another app I guess
//
//  Created by Amaya Penunuri, Yael on 10/12/17.
//  Copyright © 2017 Amaya Penunuri, Yael. All rights reserved.
//

import UIKit

public class SecondScreenController : UIViewController
{
    private lazy var color : ColorTools = ColorTools()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color.createRandomColor()
    }
}
