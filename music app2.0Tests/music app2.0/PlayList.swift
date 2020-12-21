//
//  PlayList.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/11/23.
//

import SwiftUI

struct PlayList: View {
    @ObservedObject var songsData = SongsData()
    var body: some View {
        NavigationView{
            List{
                ForEach(songsData.songs){ (song) in
                    if song.favor == true {
                        NavigationLink(destination: SongMusic(song:song)){
                            SongRow(song: song)
                        }
                    }
                }
            }
            .navigationBarTitle("PlayList")
        }
        
        
    }
}

struct PlayList_Previews: PreviewProvider {
    static var previews: some View {
        PlayList()
    }
}
