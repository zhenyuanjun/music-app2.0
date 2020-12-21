//
//  SongDetail.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/12/10.
//

import SwiftUI
import AVKit

struct SongDetail: View {
    var song: Song2
    @State private var player: AVPlayer?

    var body: some View {
        
        VStack {
            Text(song.trackName)
            Button(action: {
                player = AVPlayer(url: song.previewUrl)
                player?.play()

            }) {
                Image(systemName: "play.circle.fill")
                   .resizable()
                   .scaledToFit()
                   .frame(width: 100, height: 100)
            }
        }
        .onDisappear(perform: {
            player?.pause()
        })
    }
}
struct SongDetail_Previews: PreviewProvider {
    static var previews: some View {
        SongDetail(song: Song2(artistName: "aa", trackName: "bb", collectionName: "cc", previewUrl: URL(string: "https://www.apple.com")!, artworkUrl100: URL(string: "https://www.apple.com")!, trackPrice: 0, releaseDate: Date(), isStreamable: true))
    }
}
