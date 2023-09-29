//
//  Car.swift
//  Assignment
//
//  Created by Urvashi Bhagat on 29/09/23.
//

import SwiftUI

struct Car: Identifiable, Codable {
  var id: Int
  var modelName: String
  var photo: String?
  var photos: [String]?
  var price: Int
}

