//
//  ViewController.swift
//  Back to Music
//
//  Created by Vladislav Fedotovskiy on 11.06.16.
//  Copyright © 2016 Vladislav Fedotovskiy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()

    @IBAction func play(_ sender: AnyObject) {
        
        player.play()
    }
    
    
    @IBAction func pause(_ sender: AnyObject) {
        
        player.pause()
        
    }
    
    @IBAction func stop(_ sender: AnyObject) {
        
        player.pause()
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "beautiful things", ofType:"mp3")!))
            
        } catch {
            //errror
        }
        
    }
    
    @IBOutlet weak var volume: UISlider!
    
    @IBAction func adjustVolume(_ sender: AnyObject) {
        
        player.volume = volume.value
        
    }
    
    @IBOutlet weak var scrubSlider: UISlider!
    
    @IBAction func scrub(_ sender: AnyObject) {
        
        player.currentTime = TimeInterval(scrubSlider.value)
        
    }
    
    
    func updateScrubSlider()
    {
        
        scrubSlider.value = Float(player.currentTime)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "beautiful things", ofType:"mp3")!))
            
            scrubSlider.maximumValue = Float(player.duration)
            
        } catch {
            //errror
        }
        
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubSlider), userInfo: nil, repeats: true)
        

    }




}

