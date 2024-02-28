//
//  SoundManager.swift
//  ChimpTest
//
//
// WARNING: The SoundManager class is not used in the application. It can be removed.

import Foundation
import AVKit

class SoundManager {
    static let shared = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound(song name: String){
        
        guard let url = Bundle.main.url(forResource: name, withExtension: ".wav") else {return}
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("error playing sound. \(error.localizedDescription)")
        }
    }
}
