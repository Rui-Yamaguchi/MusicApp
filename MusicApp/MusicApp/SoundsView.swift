//
//  SoundsView.swift
//  MusicApp
//
//  Created by ヤマグチルイ on 2025/01/18.
//

//
//  SoundsView.swift
//  MusicApp
//
//  Created by ヤマグチルイ on 2025/01/18.
//

import SwiftUI
import AVFoundation

struct SoundsView: View {
    @State private var audioPlayer: AVAudioPlayer?
    @ObservedObject var viewModel = SoundsViewModel()
    @State private var randomSoundName: String = ""
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    static let darkGreen = Color(red: 0.0, green: 0.5, blue: 0.0)
    static let writeGreen = Color(red: 0.0, green: 0.8, blue: 0.0)
    static let darkBlue = Color(red: 0.0, green: 0.0, blue: 0.8)
    
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            contentsViewIPad
        } else {
            contentsViewIPhone
        }
    }
    
    private var contentsViewIPhone: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("からだをさわっておとをならそう！")
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    caterpillarBody(geometry: geometry)
                    frame(geometry: geometry)
                }
                Spacer()
            }
        }
    }
    
    private var contentsViewIPad: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("からだをさわっておとをならそう！")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                Spacer()
                HStack {
                    Spacer()
                    caterpillarBody(geometry: geometry)
                    frame(geometry: geometry)
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    private func caterpillarBody(geometry: GeometryProxy) -> some View {
        HStack {
            Spacer()
            Button(action: {
                randomSoundName = viewModel.getRandomSound()
                playSound(named: randomSoundName)
            }) {
                ZStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width: geometry.size.width / 5)
                    Image(systemName: "star")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width / 10, height: geometry.size.width / 10)
                        .foregroundColor(.white)
                }
            }
            Spacer()
            Button(action: {
                randomSoundName = viewModel.getRandomSound()
                playSound(named: randomSoundName)
            }) {
                ZStack {
                    Circle()
                        .fill(SoundsView.darkGreen)
                        .frame(width: geometry.size.width / 6)
                    Image(systemName: "music.note")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width / 12, height: geometry.size.width / 12)
                        .foregroundColor(.white)
                }
            }
            Spacer()
            Button(action: {
                randomSoundName = viewModel.getRandomSound()
                playSound(named: randomSoundName)
            }) {
                ZStack {
                    Circle()
                        .fill(SoundsView.writeGreen)
                        .frame(width: geometry.size.width / 5.5)
                    Image(systemName: "star.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width / 11, height: geometry.size.width / 11)
                        .foregroundColor(.white)
                }
            }
            Spacer()
            Button(action: {
                randomSoundName = viewModel.getRandomSound()
                playSound(named: randomSoundName)
            }) {
                ZStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width: geometry.size.width / 5)
                    Image(systemName: "music.quarternote.3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width / 10, height: geometry.size.width / 10)
                        .foregroundColor(.white)
                }
            }
            Spacer()
        }
    }
    
    private func frame(geometry: GeometryProxy) -> some View {
        VStack {
            HStack {
                Rectangle()
                    .foregroundColor(.purple)
                    .frame(width: 10, height: 50)
                Rectangle()
                    .foregroundColor(.purple)
                    .frame(width: 10, height: 50)
            }
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: geometry.size.width / 5)
                VStack {
                    HStack {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.yellow)
                                .frame(width: 40, height: 60)
                            Rectangle()
                                .foregroundColor(.green)
                                .frame(width: 35, height: 50)
                        }
                        ZStack {
                            Rectangle()
                                .foregroundColor(.yellow)
                                .frame(width: 40, height: 60)
                            Rectangle()
                                .foregroundColor(.green)
                                .frame(width: 35, height: 50)
                        }
                    }
                    Rectangle()
                        .foregroundColor(SoundsView.darkBlue)
                        .frame(width: 20, height: 10)
                }
            }
        }
    }
    
    func playSound(named soundName: String) {
        guard let soundURL = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            print("音声ファイルが見つかりません: \(soundName).mp3")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("音声の再生中にエラーが発生しました: \(error.localizedDescription)")
        }
    }
}

#Preview {
    SoundsView()
}
