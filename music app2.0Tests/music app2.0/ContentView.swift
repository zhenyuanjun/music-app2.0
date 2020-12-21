//
//  ContentView.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/11/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var songsData = SongsData()
    var body: some View {
        TabView{
            SongList(songsData: self.songsData).tabItem{
                Image(systemName: "house.fill")
                Text("Home")
            }
            PlayList(songsData: self.songsData).tabItem{
                Image(systemName: "livephoto.play")
                Text("Play list")
            }
            Chart(songsData: self.songsData).tabItem{
                Image(systemName: "chart.bar")
                Text("Chart")
            }
            SearchView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("My work")
            }
            ArtistList()
                .tabItem{
                    Image(systemName: "heart")
                    Text("Fav Artist")
            }
        }.accentColor(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
