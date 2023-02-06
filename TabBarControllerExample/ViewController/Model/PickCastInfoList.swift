//
//  PickCastInfoList.swift
//  TabBarControllerExample
//
//  Created by DongMin Hwang on 2023/02/06.
//

import Foundation

struct PickCastInfoList : Codable {
    let id:String?
    let name:String?
    let country: String?
    let description: String?
    let images : [ImgesFileInfo]?
}
