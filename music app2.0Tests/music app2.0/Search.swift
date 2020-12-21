//
//  Search.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/12/21.
//

import SwiftUI

struct Search: View {
    @State private var items = [Item]()
    @State private var showPlayerView = false
    @State private var nowIndex = 0
    var BandName: Artist
    

    func GetSearch(){
        
        let urlStr = "https://www.googleapis.com/customsearch/v1?cx=002779568533849920752:gmnwmsf0fcr&key=AIzaSyAZF169ZPgHfAPTPWIC7Vq4uJ1tIRaKbDI&q=\(BandName.name)&siteSearch=youtube.com"
        let newUrl = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        if let url = URL(string: newUrl) {
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                if let data = data {
                    do{
                        let searchResults = try JSONDecoder().decode(SearchObject.self, from: data)
                        self.items = searchResults.items
                    }
                    catch{
                        print(error)
                    }
                }
            }.resume()
            
        }
    }
    var body: some View {
        List(items.indices, id: \.self) { (index)  in
            SearchRow(item: self.items[index])
                .onTapGesture {
                   self.showPlayerView = true
                   self.nowIndex = index
                }
            }.sheet(isPresented: self.$showPlayerView) {
                PlayerView(link: self.items[self.nowIndex].link)
        }
        .onAppear {
            if self.items.count == 0 {
                self.GetSearch()
            }
        }
          
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search(BandName: Artist(name:"Jim Chen", imageName: "Jim Chen"))
    }
}

