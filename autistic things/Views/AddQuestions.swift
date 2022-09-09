//
//  AddQuestions.swift
//  autistic things
//
//  Created by Bruno Sabadini on 07/09/22.
//

import SwiftUI

struct AddNewQuestion: View {
  
  @State var checkQuestion: String = ""
  @State var rateQuestion: String = ""
  @State var rate: Int = 0
  @EnvironmentObject var questionData: QuestionsData
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    LazyVStack{
      Spacer()
      ScrollView{
        Text("Check Question")
        TextField("Type the question here", text: $checkQuestion)
        Button("Save") {
          if checkQuestion.count > 0{
            questionData.checkQuestions.append(CheckQuestionModel(question: checkQuestion, check: false))}
          dismiss()
        }
        Spacer().frame(height: 50)
        Text("Rating Question")
        TextField("Type the question here", text: $rateQuestion)
        Button("Save") {
          if rateQuestion.count > 0{
            questionData.rateQuestions.append(RatingQuestionModel(question: rateQuestion, rate: rate))}
          dismiss()
        }
      }
      Spacer()
    }
  }
}
