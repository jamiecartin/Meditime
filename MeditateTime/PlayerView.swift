//
//  PlayerView.swift
//  MeditateTime
//
//  Created by Jamie Cartin on 3/25/23.
//

import SwiftUI

struct PlayerView: View {
    @State private var value: Double = 0.0
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            //MARK: Background Image
            Image("meditate")
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
                Text("1 Minute Relaxing Meditation")
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                //MARK: Playback
                VStack(spacing: 5) {
                    Slider(value: $value, in: 0...60)
                        .accentColor(.white)
                    
                    HStack {
                        Text("0:00")
                        
                        Spacer()
                        
                        Text("1:00")
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
                    PlaybackControlButton(systemName: "stop.fill") {
                        
                    }
                    
                }
            }
            .padding(20)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
