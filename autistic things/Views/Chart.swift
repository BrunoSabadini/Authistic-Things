//
//  Chart.swift
//  autistic things
//
//  Created by Bruno Sabadini on 12/09/22.

import SwiftUI

struct BarView: View {
  var datum: Double
  var colors: [Color]
  
  var gradient: LinearGradient {
    LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
  }
  
  var body: some View {
    Rectangle()
      .fill(gradient)
      .opacity(datum == 0.0 ? 0.0 : 1.0)
  }
}

struct BarChartView: View {
  var data: [Double]
  var colors: [Color]
  
  var highestData: Double {
    let max = data.max() ?? 1.0
    if max == 0 { return 1.0 }
    return max
  }
  
  var body: some View {
    GeometryReader { geometry in
      HStack(alignment: .bottom, spacing: 4.0) {
        ForEach(data.indices, id: \.self) { index in
          let width = (geometry.size.width / CGFloat(data.count)) - 4.0
          let height = geometry.size.height * data[index] / highestData
          
          BarView(datum: data[index], colors: colors)
            .frame(width: width, height: height, alignment: .bottom)
        }
      }
    }
  }
}

struct ActivityView: View {
  @State private var moveValues: [Double] = ActivityView.mockData(24, in: 0...300)
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Correlations").bold()
        .foregroundColor(.red)
      
      BarChartView(data: moveValues, colors: [.red, .orange]).frame(width: 350, height: 200, alignment: Alignment.center)
    }
    .padding()
  }
  
  static func mockData(_ count: Int, in range: ClosedRange<Double>) -> [Double] {
    (0..<count).map { _ in .random(in: range) }
  }
}
