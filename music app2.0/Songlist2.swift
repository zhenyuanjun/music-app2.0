//
//  Songlist2.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/12/10.
//

import SwiftUI

struct SongList2: View {
    
    @State private var songs = [Song2]()
    
    
    func fetchSongs() {
        let urlStr = "https://itunes.apple.com/search?term=swift&media=music"
        
        if let url = URL(string: urlStr) {
            
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let data = data,
                   let songResults = try? decoder.decode(SongResults.self, from: data){
                    songs = songResults.results
                } else {
                    print("error")
                }
            }.resume()
            
        }
        
    }
    
    
    var body: some View {
        NavigationView {
            List(songs.indices, id:\.self, rowContent: { (index) in
                NavigationLink(
                    destination: SongDetail(song: songs[index]),
                    label: {
                        SongRow2(song: songs[index])
                    })
                
            })
            .onAppear(perform: {
                fetchSongs()
        })
        }
    }
}

struct SongList2_Previews: PreviewProvider {
    static var previews: some View {
        SongList2()
    }
}
