//
//  DetailsListModel.swift
//  TMDemoApp
//
//  Created by Interaction on 6/12/20.
//  Copyright © 2020 TechMahindra. All rights reserved.
//

import Foundation

import UIKit

class DetailList: NSObject {
    var title: String = ""
    var rows:[RowsList] = []
}

class RowsList: NSObject {
    var title: String = ""
    var details: String = ""
    var imageHref: String = ""
}
