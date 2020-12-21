//
//  ArtistRow.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/12/21.
//

import SwiftUI

struct ArtistRow: View {
    var Artist:Artist
    var body: some View {
        
        HStack(){
            if self.Artist.imageName != "" && self.Artist.imageName != "Nothing"{
                Image(uiImage: UIImage(contentsOfFile:Artist.imagePath)!)
                .resizable()
                .scaledToFill()
                .frame(width:80,height:80)
                .clipped()
                VStack(alignment: .leading) {
                    Text(Artist.name)
                        .fontWeight(.medium)
                        .foregroundColor(Color.orange)
                }
                Spacer()
            }
            else if self.Artist.imageName == "Nothing"{
                Image(systemName: "person")
                .resizable()
                .padding()
                .scaledToFill()
                .frame(width:80,height:80)
                .clipped()
                .foregroundColor(Color.blue)
                .opacity(0.7)
                VStack(alignment: .leading) {
                    Text(Artist.name)
                        .fontWeight(.medium)
                        .foregroundColor(Color.orange)
                }
                Spacer()
            }
            else{
                Image(Artist.name)
                  .resizable()
                  .scaledToFill()
                  .frame(width:80,height:80)
                  .clipped()
                  VStack(alignment: .leading) {
                      Text(Artist.name)
                          .fontWeight(.medium)
                          .foregroundColor(Color.orange)
                  }
                  Spacer()
            }
        }
    }
}

struct ArtistRow_Previews: PreviewProvider {
    static var previews: some View {
        ArtistRow(Artist: Artist(name:"Jim Chen", imageName:"Jim Chen"))
    }
}
