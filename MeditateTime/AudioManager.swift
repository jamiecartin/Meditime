//
//  AudioManager.swift
//  MeditateTime
//
//  Created by Jamie Cartin on 3/26/23.
//

import Foundation
import AVKit

final class AudioManager {
    static let shared = AudioManager()
    
    var player: AVAudioPlayer?
    
    func startPlayer(track: String) {
        guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else {
            print("Resource not found: \(track)")
            return
        }
        
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            
            player?.play()
        } catch {
            print("Failed to initialize player")
        }
        
    }
}
