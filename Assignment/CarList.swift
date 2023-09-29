//
//  CarList.swift
//  Assignment
//
//  Created by Urvashi Bhagat on 29/09/23.
//

import SwiftUI

struct CarList: View {
  let car: Car
  @State private var image: UIImage?
  
  var body: some View {
    VStack {
      HStack {
        VStack(alignment: .leading) {
          Text(car.modelName)
            .font(.system(size: 20))
            .fontWeight(.semibold)
            .lineLimit(1)
          Text("SX4 1.6 GLX Manuel LONG RANGE")
            .font(.system(size: 15))
            .fontWeight(.regular)
            .lineLimit(1)
        }      .padding(.top, 15.0)

        VStack(alignment: .trailing) {
          Text("$\(car.price)")
            .font(.system(size: 20))
            .fontWeight(.bold)
            .foregroundColor(Color.yellow)
          Text("WARRANTY 4 YEARS / 50,000 MILES")
            .font(.system(size: 15))
            .fontWeight(.regular)
            .lineLimit(1)
        }      .padding(.top, 15.0)
      }
      Image(uiImage: image ?? UIImage())
        .resizable()
        .scaledToFit()
        .frame(height: 200)
        .onAppear(perform: {
          loadImageFromURL(car.photo?.replacingOccurrences(of: "{0}", with: "800x600") ?? "")
        })
        .frame(height: 200)
      HStack {
        VStack(alignment: .leading) {
          Text("4.4SEC")
            .fontWeight(.bold)
            .lineLimit(1)
            .font(.system(size: 13))
          Text("0-60 MPH")
            .font(.system(size: 13))
            .fontWeight(.semibold)
            .lineLimit(1)
        }
        VStack(alignment: .leading) {
          Text("156MPH")
            .font(.system(size: 13))
            .fontWeight(.bold)
            .lineLimit(1)
          Text("TOP SPEEED")
            .font(.system(size: 13))
            .fontWeight(.semibold)
            .lineLimit(1)
        }
        VStack(alignment: .leading) {
          Text("370MI")
            .font(.system(size: 13))
            .fontWeight(.bold)
            .lineLimit(1)
          Text("RANGE(EPA)")
            .font(.system(size: 13))
            .fontWeight(.semibold)
            .lineLimit(1)
        }
        HStack {
          Button("BUY") {}
            .font(.system(size: 15))
            .frame(width: 70.0, height: 35.0)
            .background(Color.orange)
            .foregroundColor(.black)
            .cornerRadius(22)
          Button("RENT") {}
            .font(.system(size: 15))
            .frame(width: 70.0, height: 35.0)
            .foregroundColor(.black)
            .border(Color.orange)
            .overlay(
              RoundedRectangle(cornerRadius: 22).stroke(Color.orange, lineWidth: 2))
            .cornerRadius(22)
        }
      }
      .padding(.bottom, 30.0)
    }
    .cornerRadius(5)
  }
  
  func loadImageFromURL(_ url: String) {
    guard let url = URL(string: url) else {
      return
    }
    NetWorkManager.loadData(url: url) { image in
      self.image = image
    }
  }
}

//struct CarList_Previews: PreviewProvider {
//    static var previews: some View {
//      CarList(car: <#Car#>)
//    }
//}
