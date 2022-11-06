//
//  3 lines to Back Arrow.swift
//  autistic things
//
//  Created by Bruno Sabadini on 06/11/22.
//

import SwiftUI

struct ThreeLinesToBackArrow: View {
  @State private var isChanging = false
  
    var body: some View {
      VStack(spacing: isChanging ? -12 : 14){
        RoundedRectangle(cornerRadius: 5)
          .frame(width: isChanging ? 48 : 64, height: 10)
          .rotationEffect(.degrees(isChanging ? -30 : 0), anchor: .leading)
          .offset(x: isChanging ? -16 : 0)
        
        RoundedRectangle(cornerRadius: 5)
          .frame(width: 64, height: 10)
          .scaleEffect(x: isChanging ? 1.2 : 1, anchor: .leading)
        
        RoundedRectangle(cornerRadius: 5)
          .frame(width: isChanging ? 48 : 64, height: 10)
          .rotationEffect(.degrees(isChanging ? 30 : 0), anchor: .leading)
          .offset(x: isChanging ? -16 : 0)
        
      }.onTapGesture {
        withAnimation(.interpolatingSpring(stiffness: 300, damping: 15)){
          isChanging.toggle()
        }
      }
    }
}



struct __lines_to_Back_Arrow_Previews: PreviewProvider {
    static var previews: some View {
      ThreeLinesToBackArrow()
    }
}
