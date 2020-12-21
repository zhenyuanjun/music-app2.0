//
//  Artist.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/12/21.
//

import Foundation

class ArtistData: ObservableObject{
    @Published var bands = [Artist](){
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(bands) {
                UserDefaults.standard.set(data, forKey: "movies")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey: "movies") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Artist].self,from: data) {
                bands = decodedData
            }
        }
     }
}

struct Artist: Identifiable, Codable{
    var id = UUID()
    var name:String
    var imageName:String
    var imagePath: String {
        return PhotoData.documentsDirectory.appendingPathComponent(imageName).path
    }
}
