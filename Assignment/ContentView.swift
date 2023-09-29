//
//  ContentView.swift
//  Assignment
//
//  Created by Urvashi Bhagat on 29/09/23.
//

import SwiftUI

struct ContentView: View {
  @State var cars = [Car]()
  init() {
    UITableView.appearance().backgroundColor = .black
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
  }
  var body: some View {
    NavigationView {
    VStack(spacing: 0.0) {
      Text("CAR LIST")
        .font(.title)
        .fontWeight(.bold)
        .padding(.top)
        .foregroundColor(.white)
      Text("TESLA MOTORS INC.")
        .font(.title2)
        .fontWeight(.bold)
        .foregroundColor(.yellow)
        .padding(.top)
    List(cars) { car in
      ZStack {
        NavigationLink(destination: DetailView(selectedCar: car, car: car)) {
          EmptyView()
        }.opacity(0)
          .buttonStyle(.plain)
        CarList(car: car)
          .listRowSeparator(.hidden)
          .listRowBackground(RoundedRectangle(cornerRadius: 5)
            .background(Color.clear)
            .foregroundColor(Color.white)
            .padding(EdgeInsets(top: 2, leading: 0, bottom: 20, trailing: 0)))

      }
    }
    }
    .onAppear() {
      API().getCarList { cars in
        self.cars = cars
      }
    }
    .edgesIgnoringSafeArea(.all)
      .background(Color.black)
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
