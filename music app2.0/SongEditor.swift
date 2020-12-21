//
//  SongEditor.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/11/23.
//

import SwiftUI

struct SongEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var songsData: SongsData
    @State private var name = ""
    @State private var singer = ""
    @State private var score = 5
    @State private var favorite = true
    var editSong : Song?
    var body: some View {
        Form{
            TextField("Name", text: $name)
            TextField("Singer", text: $singer)
            Stepper("This song is type\(score)", value: $score, in: 0...5)
            Toggle("Add it to play list?", isOn: $favorite)
        }
        .navigationBarTitle(editSong == nil ? "Add to song list" : "Edit")
        .navigationBarItems(trailing: Button("Done") {
            let song = Song(name: self.name, singer: self.singer, Style: self.score, favor: self.favorite)
                if let editSong = self.editSong{
                    let index = self.songsData.songs.firstIndex {
                        return $0.id == editSong.id
                    }!
                    self.songsData.songs[index] = song
                } else {
                    self.songsData.songs.insert(song, at: 0)
                }
                self.presentationMode.wrappedValue.dismiss()
        })
        .onAppear{
            if let editSong = self.editSong{
                self.name = editSong.name
                self.singer = editSong.singer
                self.score = editSong.Style
                self.favorite = editSong.favor
            }
        }
    }
}

struct SongEditor_Previews: PreviewProvider {
    static var previews: some View {
        SongEditor(songsData: SongsData())
    }
}
