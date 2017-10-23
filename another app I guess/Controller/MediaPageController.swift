//
//  MediaPageController.swift
//  another app I guess
//
//  Created by Amaya Penunuri, Yael on 10/18/17.
//  Copyright © 2017 Amaya Penunuri, Yael. All rights reserved.
//

import UIKit
import AVFoundation

class MediaPageController : UIViewController
{
    private lazy var color : ColorTools = ColorTools()    
    private var imageCounter = 0
    private var soundPlayer : AVAudioPlayer?
    
    @IBOutlet weak var ChangeImageButton: UIButton!
    @IBOutlet weak var Play_PauseButton: UIButton!
    @IBOutlet weak var FishingSlider: UISlider!
    @IBOutlet weak var imageFrame: UIImageView!
    @IBOutlet weak var soundSlider: UISlider!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = color.createRandomColor()
        loadAudioFile()
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
    
    
    private func playMusicFile() -> Void
    {
        
    }
    
    private func loadAudioFile() -> Void
    {
        if let soundURL = NSDataAsset(name: "AnnoyingVillagers")
        {
            do
            {
                try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try! AVAudioSession.sharedInstance().setActive(true)
                
                try soundPlayer = AVAudioPlayer(data: soundURL.data, fileYypeHint:
                    AVFileType.mp3.rawValue)
                soundSlider.maximumValue = Float ((soundPlayer?.duration)!)
               // Timer.scheduledTimer(timeInterval, target: self, selector:(#selector(self.updateSlider)), userInfo: nil, repeats: true)
            }
            catch
            {
                print("Audio file doesn't exist")
            }
        }
    }
    
}
