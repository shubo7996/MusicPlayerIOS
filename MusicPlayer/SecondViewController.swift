//
//  SecondViewController.swift
//  MusicPlayer
//
//  Created by Subhamoy Paul on 9/8/17.
//  Copyright © 2017 Subhamoy Paul. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    @IBOutlet weak var myAlbum: UIImageView!
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func prev(_ sender: Any) {
        if currentSong != 0 && audioStuffed == true
        {
            playThis(thisSong: songs[currentSong-1])
            currentSong-=1
            myLabel.text = songs[currentSong]
        }
        else
        {
            //
        }
    }
    
    @IBAction func play(_ sender: Any) {
        if audioStuffed == true && audioPlayer.isPlaying == false
        {
        audioPlayer.play()
        }
    }
    
    @IBAction func next(_ sender: Any) {
        if currentSong < songs.count && audioStuffed == true
        {
            playThis(thisSong: songs[currentSong+1])
            currentSong+=1
            myLabel.text = songs[currentSong]
        }
    else
        {
            currentSong = 0
        }
    
    }

    @IBAction func pause(_ sender: Any) {
        if audioStuffed == true && audioPlayer.isPlaying
        {
        audioPlayer.pause()
        }
    }
    
    func playThis(thisSong:String) {
        do
        {
            let audioPath = Bundle.main.path(forResource: thisSong, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
        }
        catch
        {
            print ("ERROR")
        }
    
    }
    
    @IBAction func volumeRocker(_ sender: UISlider) {
        if audioStuffed == true
        {
        audioPlayer.volume = sender.value
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myLabel.text = songs[currentSong]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

