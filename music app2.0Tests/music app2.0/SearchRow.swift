//
//  SearchRow.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/12/21.
//


import SwiftUI
import KingfisherSwiftUI

struct SearchRow: View {
    var item: Item
    var body: some View {
        HStack(){
            KFImage(item.pagemap.cse_thumbnail[0].src)
            .resizable()
            .scaledToFill()
            .frame(width: 145, height: 84)
            .clipped()
            Text(item.title)
            .bold()
        }
    }
}

struct SearchRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchRow(item: Item(title:"婁峻碩SHOU - COLORFUL cover",link: URL(string:"https://www.youtube.com/watch?v=RZ0jBbSofXs")!,snippet:"",pagemap: Pagemap(cse_thumbnail: [Thumbnail(src: URL(string:"file:///Users/chenruijun/Documents/music%20app2.0/Youtube.png")!)]))
        )
    }
}
