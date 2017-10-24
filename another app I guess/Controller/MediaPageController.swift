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
    @IBOutlet weak var ChangeImageButton: UIButton!
    @IBOutlet weak var imageFrame: UIImageView!
    @IBOutlet weak var soundSliderII: UISlider!
    @IBOutlet weak var Play_PauseButton: UIButton!
    
    private lazy var color : ColorTools = ColorTools()
    private var imageCounter : Int = 0
    private var soundPlayer : AVAudioPlayer?
    
    public override func viewDidLoad() -> Void
    {
        super.viewDidLoad()
        view.backgroundColor = color.createRandomColor()
        loadAudioFile()
    }
    
    public override func didReceiveMemoryWarning() -> Void
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
    
    
    
    @IBAction func soundButtonClick(_ sender: UIButton) -> Void
    {
        playMusicFile()
    }
    
    @IBAction func ChangeImageButtonAction(_ sender: UIButton) -> Void
    {
        changeImage()
    }
    
    
    @IBAction func sliderMethod() -> Void
    {
        let seekTime = Double (soundSliderII.value)
        soundPlayer?.currentTime = seekTime
    }
    
    private func playMusicFile() -> Void
    {
        if let isPlaying = soundPlayer?.isPlaying
        {
            if (isPlaying)
            {
                soundPlayer?.pause()
            }
            else
            {
               soundPlayer?.play()
            }
        }
        //Less stable version
//        if ((soundPlayer?.isPlaying)!)
//        {
//            soundPlayer?.pause()
//        }
//        else
//        {
//            soundPlayer?.play()
//        }
    }
    
    private func loadAudioFile() -> Void
    {
        if let soundURL = NSDataAsset(name: "AnnoyingVillagers")
        {
            do
            {
                try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try! AVAudioSession.sharedInstance().setActive(true)
                
                try soundPlayer = AVAudioPlayer(data: soundURL.data, fileTypeHint:
                    AVFileType.mp3.rawValue)
                soundSliderII.maximumValue = Float ((soundPlayer?.duration)!)
                Timer.scheduledTimer(timeInterval: 0.2, target: self, selector:(#selector(self.updateSlider)), userInfo: nil, repeats: true)
            }
            catch
            {
                print("Audio file doesn't exist")
            }
        }
    }
    
    @objc private func updateSlider() -> Void
    {
        soundSliderII.value = Float ((soundPlayer?.currentTime)!)
    }
    
}
