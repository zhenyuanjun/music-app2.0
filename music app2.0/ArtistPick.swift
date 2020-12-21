//
//  ArtistPick.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/12/21.
//

import SwiftUI

struct BandInsert: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var content = ""
    @State private var selectImage: UIImage?
    @State var showAlert = false
    @State var showingImagePicker = false
    @ObservedObject var photoData = PhotoData()
    var ArtistData: ArtistData
    var trphotoData: PhotoData
    var body: some View {
        NavigationView{
            Form{
                TextField("名字...", text: $name)
                Button(action:{self.showingImagePicker = true}){
                    Group {
                         if self.selectImage != nil {
                             Image(uiImage: self.selectImage!)
                                .resizable()
                                .renderingMode(.original)
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                        }
                    }.scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    Text("Singer Pic")
                }.foregroundColor(Color.blue)
                .sheet(isPresented: $showingImagePicker) {
                    ImagePickerController(selectImage: self.$selectImage, showSelectPhoto: self.$showingImagePicker)}
            }.navigationBarTitle("Fav Singer")
            .navigationBarItems(trailing: Button("Done"){
                if self.selectImage != nil {
                    let imageName = UUID().uuidString
                    let url = PhotoData.documentsDirectory.appendingPathComponent(imageName)
                    try? self.selectImage?.jpegData(compressionQuality: 0.9)?.write(to: url)
                    let photo = Photo(content: self.content, imageName: imageName)
                    self.photoData.photos.insert(photo, at: 0)
                    self.selectImage = nil
                    self.content = ""
                    self.trphotoData.photos.insert(photo, at: 0)
                    self.selectImage = nil
                    self.content = ""
                    let newband = Artist(name: self.name, imageName: imageName)
                    self.ArtistData.bands.insert(newband, at: 0)
                    self.presentationMode.wrappedValue.dismiss()
                }
                else if self.name.isEmpty == true{
                    self.showAlert = true
                }
                else if self.name.isEmpty != true{
                    let newband = Artist(name: self.name, imageName: "Nothing")
                    self.ArtistData.bands.insert(newband, at: 0)
                    self.presentationMode.wrappedValue.dismiss()
                }
            }.foregroundColor(Color.blue))
            .alert(isPresented: $showAlert) { () -> Alert in
               let answer = ["enter name！", "please enter name！"].randomElement()!
               return Alert(title: Text(answer))
            }
        }
    }
}

struct BandInsert_Previews: PreviewProvider {
    static var previews: some View {
        BandInsert(ArtistData: ArtistData(), trphotoData: PhotoData())
    }
}
