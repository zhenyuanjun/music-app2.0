//
//  SongRow.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/11/23.
//

import SwiftUI

struct SongRow: View {
    var song: Song
    
    var body: some View {
        HStack{
            Image(systemName: "music.mic")
                .resizable()
                .scaledToFill()
                .padding(.leading, 10)
                .background(Color.blue)
                .frame(width: 40, height: 40)
            VStack(alignment: .leading){
                Text(song.name)
                    .font(Font.system(size: 25))
                    .padding(.leading, 10)
                Text(song.singer)
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
            }
        }
    }
}

struct SongRow_Previews: PreviewProvider {
    static var previews: some View {
        SongRow(song: Song(id: UUID(), name: "", singer: "", Style: 5, favor: false))
    }
}

