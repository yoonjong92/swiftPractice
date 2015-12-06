//
//  PlaySoundsViewController.swift
//  swiftPractice
//
//  Created by 김현우 on 2015. 12. 6..
//  Copyright © 2015년 박윤종. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let filePath = NSBundle.mainBundle().pathForResource("이럴거면 그러지말지", ofType: "mp3") {
            let filePathUrl = NSURL.fileURLWithPath(filePath)
            do {
                try audioPlayer = AVAudioPlayer(contentsOfURL: filePathUrl)
            } catch {
                //TODO: error handling??
            }
        } else {
            print("the filePath is empty")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func playSlowAudio(sender: UIButton) {
        audioPlayer.play()
    }
}
