//
//  Item.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/12/21.
//

import Foundation

struct Thumbnail: Codable{
    var src:URL
}

struct Pagemap: Codable {
    var cse_thumbnail:[Thumbnail]
}

struct Item: Codable {
    var title:String
    var link:URL
    var snippet:String
    var pagemap:Pagemap
}

struct SearchObject: Codable{
    var items:[Item]
}


