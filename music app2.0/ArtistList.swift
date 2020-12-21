//
//  ArtistList.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/12/21.
//

import SwiftUI

struct ArtistList: View {
    
    
    @ObservedObject var ArtistDatas = ArtistData()
    @State private var showBandInsert = false
    @ObservedObject var photoData = PhotoData()
    
    @State private var opacity: Double = 0
    @State private var longPressTime: CGFloat = 1
    private func delete(item band: Artist) {
        if let index = self.ArtistDatas.bands.firstIndex(where: { $0.id == band.id }) {
            self.ArtistDatas.bands.remove(at: index)
        }
    }
    
    var body: some View {
        VStack(){
            Image("Youtube")
                .resizable()
                .scaledToFit()
                .frame(width:150,height:120)
                .opacity(opacity)
                .scaleEffect(longPressTime)
                .onLongPressGesture {
                    if self.longPressTime < 2{
                        self.longPressTime *= 2
                    }
                }
                .onAppear{
                    if self.opacity != 0{
                        self.opacity = 0
                        withAnimation (Animation.linear(duration: 3)){
                            self.opacity += 1
                        }
                    }
                    else{
                        withAnimation (Animation.linear(duration: 3)){
                            self.opacity += 1
                        }
                    }
                }
            NavigationView{
                List{
                    ForEach(ArtistDatas.bands){(band) in NavigationLink(destination: Search(BandName: band)){ArtistRow(Artist: band)
                        .contextMenu {
                            Button(action: {
                                self.delete(item: band)
                            }) {
                                HStack {
                                    Text("delete")
                                    Image(systemName: "trash")
                                }
                            }
                        }
                    }
                    }.onDelete { (indexSet) in
                        self.ArtistDatas.bands.remove(atOffsets: indexSet)}
                    .onMove { (indexSet, index) in
                        self.ArtistDatas.bands.move(fromOffsets: indexSet, toOffset: index)}
                    
                }.navigationBarTitle("fav singer/band")
                .navigationBarItems(leading: EditButton().foregroundColor(.blue), trailing: Button(action:{self.showBandInsert = true},
                                                                                                   label: {Image(systemName: "plus.circle.fill").foregroundColor(.blue)}))
                .sheet(isPresented: $showBandInsert){
                    BandInsert(ArtistData: self.ArtistDatas, trphotoData: self.photoData)
                }
            }
        }
    }
}


struct ArtistList_Previews: PreviewProvider {
    static var previews: some View {
        ArtistList()
    }
}
