//
//  ViewController.swift
//  swiftPractice
//
//  Created by 박윤종 on 2015. 12. 4..
//  Copyright © 2015년 박윤종. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var recordingStop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        recordingStop.hidden = true
        recordingInProgress.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: UIButton) {
        recordingStop.hidden = false
        recordingInProgress.hidden = false
        //TODO: Record the user's voice
        print("in recordAudio")
    }
}

