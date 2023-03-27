//
//  MeditationView.swift
//  MeditateTime
//
//  Created by Jamie Cartin on 3/25/23.
//

import SwiftUI

struct MeditationView: View {
    @State private var showPlayer = false
    var body: some View {
        VStack(spacing: 0) {
            //MARK: Image
            Image("meditate")
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height / 3)
            
            ZStack {
                //MARK: Background
                Color(red: 24/255, green: 23/255, blue: 22/255)
                
                VStack(alignment: .leading, spacing: 24) {
                    //MARK: Type and Duration
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Music")
                        
                        Text("0s")
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    
                    //MARK: Title
                    Text("1 Minute Relaxing Meditation")
                        .font(.title)
                    
                    //MARK: Play Button
                    Button {
                        showPlayer = true
                    } label: {
                        Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(20)
                        
                    }
                    
                    //MARK: Description
                    Text("Clear your mind and become one with all and nothing.")
                    
                    Spacer()
                }
                .foregroundColor(.white)
                .padding(20)
            }
            .frame(height: UIScreen.main.bounds.height * 2 / 3)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showPlayer) {
            PlayerView()
        }
    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView()
    }
}
