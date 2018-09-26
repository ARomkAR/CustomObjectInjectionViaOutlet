//
//  AstronomyPictureOfTheDay.swift
//  MVVMContainer
//
//  Created by Omkar khedekar on 26/09/18.
//  Copyright © 2018 Omkar khedekar. All rights reserved.
//

import Foundation

struct AstronomyPictureOfTheDay: Decodable {

    let title: String
    let explanation: String
    let url: String
    let hdurl: String
    let date: String
}
