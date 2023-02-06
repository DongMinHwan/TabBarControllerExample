//
//  ImgesFileInfo.swift
//  TabBarControllerExample
//
//  Created by DongMin Hwang on 2023/02/06.
//

import Foundation

struct ImgesFileInfo : Codable {
    
    let fileName : String?
    let fileType : String?
    let fileSize: Int?
    let fileKey: String?
    let fileUrl : String?
    let seq : Int?
}
