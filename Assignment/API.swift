//
//  API.swift
//  Assignment
//
//  Created by Urvashi Bhagat on 29/09/23.
//

import SwiftUI

class API: ObservableObject {

  func getCarList(completion: @escaping ([Car]) -> ()) {
    guard let url = URL(string: "http://sandbox.arabamd.com/api/v1/listing?sort=1&sortDirection=0&take=10") else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
      do {
        let cars = try JSONDecoder().decode([Car].self, from: data!)
        print(cars)
        completion(cars)
      } catch {
        print(error.localizedDescription)
      }
    }.resume()
  }
  
  func getDetail(_ id: String, completion: @escaping (Car) -> ()) {
    guard let url = URL(string: "http://sandbox.arabamd.com/api/v1/detail?id=\(id)") else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
      do {
        let car = try JSONDecoder().decode(Car.self, from: data!)
        print(car)
        completion(car)
      } catch {
        print(error.localizedDescription)
      }
    }.resume()
  }
}
