//
//  Song.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/11/23.
//

import Foundation

struct Song: Identifiable, Codable{
    var id = UUID()
    var name: String
    var singer: String
    var Style: Int
    var favor: Bool
}
