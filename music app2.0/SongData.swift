//
//  Band.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/12/21.
//

import Foundation

class SongsData: ObservableObject {
    @Published var songs = [Song]() {
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(songs) {
                UserDefaults.standard.set(data, forKey: "songs")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey:"songs") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Song].self, from: data) {
                songs = decodedData
            }
        }
    }
}


