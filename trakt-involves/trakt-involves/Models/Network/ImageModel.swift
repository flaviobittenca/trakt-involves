//
//  ImageModel.swift
//  trakt-involves
//
//  Created by iMac on 27/07/17.
//  Copyright © 2017 Flavio Kruger Bittencourt. All rights reserved.
//

import Foundation
import ObjectMapper

class ImageModel {
    var name: String?
    var thetvdbId: Int?
    var clearlogo: [ClearLogoModel]?

    required convenience init?(map: Map) {
        self.init()
    }
}

extension ImageModel: Mappable {
    
    func mapping(map: Map) {
        name <- map["name"]
        thetvdbId <- map["thetvdb_id"]
        clearlogo <- map["clearlogo"]
    }
}

class ClearLogoModel {
    var id: Int?
    var url: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
}

extension ClearLogoModel: Mappable {
    
    func mapping(map: Map) {
        id <- map["id"]
        url <- map["url"]
    }
}
