//
//  RatingView.swift
//  autistic things
//
//  Created by Bruno Sabadini on 07/09/22.
//
import SwiftUI

struct StarRating: View {
  @Binding var rate: Int
  
  var label = ""
  
  var maximumRating = 5
  
  var offImage: Image?
  var onImage = Image(systemName: "star.fill")
  
  var offColor = Color.gray
  var onColor = Color.yellow
  
  func image(for number: Int) -> Image {
    if number > rate {
      return offImage ?? onImage
    } else {
      return onImage
    }
  }
  
  var body: some View{
    HStack {
      if label.isEmpty == false {
        Text(label)
      }
      
      ForEach(1..<maximumRating + 1, id: \.self) { number in
        image(for: number)
          .foregroundColor(number > rate ? offColor : onColor)
          .onTapGesture {
            rate = number
          }
      }
    }
  }
}
