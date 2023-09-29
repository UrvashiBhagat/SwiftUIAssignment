//
//  NetworkManager.swift
//  Assignment
//
//  Created by Urvashi Bhagat on 29/09/23.
//

import UIKit

class NetWorkManager: Any {
  static func loadData(url: URL, completion: @escaping (UIImage?) -> ()) {
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data, error == nil else {
        completion(nil)
        return
      }
      completion(UIImage(data: data))
    }.resume()
  }
}
