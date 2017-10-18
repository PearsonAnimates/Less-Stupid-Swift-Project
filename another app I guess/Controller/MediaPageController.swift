//
//  MediaPageController.swift
//  another app I guess
//
//  Created by Amaya Penunuri, Yael on 10/18/17.
//  Copyright © 2017 Amaya Penunuri, Yael. All rights reserved.
//

import UIKit

class MediaPageController : UIViewController
{
    private lazy var color : ColorTools = ColorTools()    
    private var imageCounter = 0
    private var imageFrame :UIImageView!
    
    
    @IBOutlet weak var ChangeImageButton: UIButton!
    @IBOutlet weak var Play_PauseButton: UIButton!
    @IBOutlet weak var FishingSlider: UISlider!
    @IBOutlet weak var PictureButtonOutlet: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    private func changeImage() -> Void
    {
        if (imageCounter > 2)
        {
            imageCounter = 0
        }
        if(imageCounter == 0)
        {
            imageFrame.image = UIImage(named: "avillager")
        }
        else if (imageCounter == 1)
        {
            imageFrame.image = UIImage(named: "villagerhelicopter")
        }
        else
        {
            imageFrame.image = UIImage(named: "villagersign")
        }
        
        imageCounter += 1
    }
    
    
    @IBAction func ChangeImageButtonAction(_ sender: UIButton)
    {
        changeImage()
    }
    
    
    @IBAction func Play_PauseButtonAction(_ sender: UIButton)
    {
        
    }
    
    @IBAction func FishingSliderAction(_ sender: UIButton)
    {
        
    }
    
    
}
