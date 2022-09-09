//
//  QuestionsHomePage.swift
//  autistic things
//
//  Created by Bruno Sabadini on 07/09/22.
//

import SwiftUI

struct QuestionsHomePage: View {
  
  @StateObject var questionData: QuestionsData = QuestionsData()
  
  var body: some View {
    NavigationView{
      VStack{
      VStack{
        List{
          Section(header: Text("Check")) {
            ForEach($questionData.checkQuestions) { $eachObject in
              Toggle(eachObject.question, isOn: $eachObject.check).toggleStyle(CheckboxStyle())}.onDelete(perform: questionData.deleteCheckQuestion)
          }
          Section(header: Text("Rate")) {
            ForEach($questionData.rateQuestions) { $eachObject in
              Text(eachObject.question).listRowSeparator(.hidden)
              StarRating(rate: $eachObject.rate)
            }
            .onDelete(perform: questionData.deleteRatingQuestion)
          }
        }
      }
      .navigationTitle("Questions")
      Spacer()
      HStack{
        NavigationLink("Add") {
          AddNewQuestion().environmentObject(questionData)
        }
      }
    }
    }
  }
}



struct CheckBoxView_Previews: PreviewProvider {
  struct CheckBoxViewHolder: View {
    @State var checked = false
    
    var body: some View {
      QuestionsHomePage()
    }
  }
  
  static var previews: some View {
    QuestionsHomePage()
    AddNewQuestion()
  }
}
