//
//  PlayerView.swift
//  MeditateTime
//
//  Created by Jamie Cartin on 3/25/23.
//

import SwiftUI

struct PlayerView: View {
    @EnvironmentObject var audioManager: AudioManager
    var meditationVM: MeditationViewModel
    var isPreview: Bool = false
    @State private var value: Double = 0.0
    @State private var isEditing: Bool = false
    @Environment(\.dismiss) var dismiss
    
    let timer = Timer
        .publish(every: 1.0, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            //MARK: Background Image
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            //MARK: Blurred view
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                
                //MARK: Dismiss Button
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                
                //MARK: Title
                Text(meditationVM.meditation.title)
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                //MARK: Playback
                
                VStack(spacing: 5) {
                    
                    Slider(value: $value, in: 0...(audioManager.player?.duration ?? 60.0)) { editing in
                        
                        isEditing = editing
                        
                        if !editing {
                            audioManager.player?.currentTime = value 
                        }
                    }
                    .accentColor(.white)
                    
                    HStack {
                        Text(DateComponentsFormatter.positional.string(from: audioManager.player?.currentTime ?? 0.00) ?? "0:00")
                        
                        Spacer()
                        
                        Text(DateComponentsFormatter.positional.string(from: (audioManager.player?.duration ?? 0.00) - (audioManager.player?.currentTime ?? 0.00)) ?? "0:00")
                    }
                    .font(.caption)
                    .foregroundColor(.white)
                }
                
                
                //MARK: Playback control
                HStack {
                    //MARK: Repeat button
                    PlaybackControlButton(systemName: "repeat") {
                        
                    }
                    
                    Spacer()
                    
                    //MARK: Backward button
                    PlaybackControlButton(systemName: "gobackward.10") {
                        
                    }
                    
                    Spacer()
                    
                    //MARK: Play/pause button
                    PlaybackControlButton(systemName: "play.circle.fill", fontSize: 44) {
                        
                    }
                    
                    Spacer()
                    
                    //MARK: Forward button
                    PlaybackControlButton(systemName: "goforward.10") {
                        
                    }
                    
                    Spacer()
                    
                    //MARK: Stop button
                    PlaybackControlButton(systemName: "stop.fill"){
                        
                    }
                }
            }
            .padding(20)
        }
        .onAppear {
            audioManager.startPlayer(track: meditationVM.meditation.track, isPreview: isPreview)
            
        }
        .onReceive(timer) { _ in
            guard let player = audioManager.player, !isEditing else { return }
            value = player.currentTime
        }
    }
    
    struct PlayerView_Previews: PreviewProvider {
        static let meditationVM = MeditationViewModel(meditation: Meditation.data)
        
        static var previews: some View {
            PlayerView(meditationVM: meditationVM, isPreview: true)
                .environmentObject(AudioManager())
        }
    }
}
