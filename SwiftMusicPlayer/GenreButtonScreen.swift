//
//  GenreButtonScreen.swift
//  SwiftMusicPlayer
//
//  Created by Deepl0n9 on 21/02/20.
//  Copyright © 2020 Deepl0n9. All rights reserved.
//

import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func GenreButtonTapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization{(status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
            }
        }
    }
    
   
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    func playGenre(genre:String) {
        musicPlayer.stop()
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        musicPlayer.setQueue(with: query)
        musicPlayer.play()
    }
}
