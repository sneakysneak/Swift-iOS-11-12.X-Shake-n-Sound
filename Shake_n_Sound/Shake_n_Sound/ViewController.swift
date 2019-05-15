//
//  ViewController.swift
//  Shake_n_Sound
//
//  Created by sneakysneak on 23/11/2018.
//  Copyright © 2018 sneakysneak. All rights reserved.
//

import UIKit
//Don't forget to import
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {

        if event?.subtype == UIEvent.EventSubtype.motionShake {
//        if event?.subtype.motionShake {
            let soundArray = ["sound1", "sound2", "sound3"]
            
            let rndNum = Int (arc4random_uniform(UInt32(soundArray.count)))
        
            let fileLocation = Bundle.main.path(forResource: soundArray[rndNum], ofType: "mp3")
            
            do {
                // don't forget the ! after fileLocation
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileLocation!))
                
                player.play()
                
            } catch {
                print("fasz")
            }
        }
    }


}

