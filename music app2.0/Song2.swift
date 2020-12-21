//
//  Song2.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/12/10.
//

import Foundation

struct SongResults: Codable {
   let resultCount: Int
   let results: [Song2]
}

struct Song2: Codable {
   let artistName: String
   let trackName: String
   let collectionName: String?
   let previewUrl: URL
   let artworkUrl100: URL
   let trackPrice: Double?
   let releaseDate: Date
   let isStreamable: Bool?
}
