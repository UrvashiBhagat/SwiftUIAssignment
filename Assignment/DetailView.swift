//
//  DetailView.swift
//  Assignment
//
//  Created by Urvashi Bhagat on 29/09/23.
//

import SwiftUI

struct DetailView: View {
  @State var selectedCar: Car
  @State private var image: UIImage?
  @State var isLinkActive = false

  let car: Car

    var body: some View {
       VStack(spacing: 0.0) {
         if isLinkActive {
           HStack {
             ForEach(selectedCar.photos ?? [], id: \.self) { photo in
               Image(uiImage: image ?? UIImage())
                 .resizable()
                 .scaledToFit()
                 .frame(height: 200)
                 .onAppear {
                   self.loadImageFromURL(photo.replacingOccurrences(of: "{0}", with: "800x600"))
                 }
             }
           }
         }
       }
       .onAppear() {
         API().getDetail(car.id.description) { selectedCar in
           self.selectedCar = selectedCar
           self.isLinkActive = true

         }
       }
       .edgesIgnoringSafeArea(.all)
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

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
