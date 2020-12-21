//
//  SongMusic.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/11/23.
//

import SwiftUI
import AVKit

struct SongMusic : View {
    @Environment(\.presentationMode) var presentationMode
    @State var audioPlayer: AVAudioPlayer!
    @State var count = 1
    var song:Song
    
    var body: some View {
        NavigationView{
            
            GeometryReader { geometry in
                ZStack{
                    Color.backgroundColor
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        HStack{
                            Text(song.singer + "-" + song.name)
                                .font(.system(size:30))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.buttonColor)
                        }
                        HStack{
                            Button(action:{self.audioPlayer.play()
                            }){
                                Image(systemName: "play.circle.fill").resizable()
                                    .frame(width: 50,height: 50)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.buttonColor)
                            }
                            Button(action:{
                                let sound = Bundle.main.path(forResource: "position", ofType: "mp3")
                                self.audioPlayer = try! AVAudioPlayer(contentsOf:URL(fileURLWithPath: sound!))
                            }){
                                Image(systemName: "pause.circle.fill").resizable()
                                    .frame(width: 50,height: 50)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.buttonColor)
                            }
                        }
                    }
                }
                .onAppear(){
                    let sound = Bundle.main.path(forResource: "position", ofType: "mp3")
                    self.audioPlayer = try! AVAudioPlayer(contentsOf:URL(fileURLWithPath: sound!))
                }
                
            }
            .aspectRatio(1, contentMode: .fit)
            .padding(20)
        }
    }
}


struct SongMusic_Previews: PreviewProvider {
    static var previews: some View {
        SongMusic(song:Song(id: UUID(), name: "", singer: "", Style: 5, favor: false))
    }
}

