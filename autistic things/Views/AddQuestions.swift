//
//  AddQuestions.swift
//  autistic things
//
//  Created by Bruno Sabadini on 07/09/22.
//

import SwiftUI

struct AddNewQuestion: View {
  
  @State var checkQuestionTextField: String = ""
  @State var rateQuestionTextField: String = ""
  @EnvironmentObject var questionData: QuestionsData
  @Environment(\.dismiss) var dismiss
  
  
  func checkSaveButton(){
    if checkQuestionTextField.count > 0{
      if questionData.checkQuestionModel.count > 0 {
        var storePreviousValueFromAppStorage: [CheckQuestionModel] = questionData.checkQuestionModel
        storePreviousValueFromAppStorage.append(CheckQuestionModel(question: checkQuestionTextField, check: false))
        questionData.checkQuestionModel.append(storePreviousValueFromAppStorage.last!)}
      else {
        questionData.checkQuestionModel.append(CheckQuestionModel(question: checkQuestionTextField, check: false))
      }
    }
    dismiss()
  }
  
  func rateSaveButton(){
    if rateQuestionTextField.count > 0{
      if questionData.ratingQuestionModel.count > 0 {
        var storePreviousValueFromAppStorage: [RatingQuestionModel] = questionData.ratingQuestionModel
        storePreviousValueFromAppStorage.append(RatingQuestionModel(question: rateQuestionTextField, rate: 0))
        questionData.ratingQuestionModel.append(storePreviousValueFromAppStorage.last!)}
      else {
        questionData.ratingQuestionModel.append(RatingQuestionModel(question: rateQuestionTextField, rate: 0))}
    }
    dismiss()
  }
  
  var body: some View {
    LazyVStack{
      Spacer()
      ScrollView{
        Text("Check Question")
        TextField("Type the question here", text: $checkQuestionTextField)
        Button("Save") {
          checkSaveButton()
        }
      }
      Spacer().frame(height: 50)
      Text("Rating Question")
      TextField("Type the question here", text: $rateQuestionTextField)
      Button("Save") {
        rateSaveButton()
      }
    }
    Spacer()
  }
}

