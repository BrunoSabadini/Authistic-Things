//
//  QuestionsModels.swift
//  autistic things
//
//  Created by Bruno Sabadini on 07/09/22.
//

import Foundation
import SwiftUI


class CheckQuestionModel: Identifiable {
  
  init(question: String, check: Bool){
    self.question = question
    self.check = check
  }
  
  var question: String
  var check: Bool
  let id = UUID()
}

class RatingQuestionModel: Identifiable, Codable {
  
  init(question: String, rate: Int){
    self.question = question
    self.rate = rate
  }
  
  var question: String
  var rate: Int
  var id = UUID()
}

class QuestionsData: ObservableObject{
  
  @Published var checkQuestions = [CheckQuestionModel(question: "Seu dia foi produtivo?", check: false), CheckQuestionModel(question: "O dia de hoje foi melhor do que o de ontem?", check: false)]
  
  @Published var rateQuestions =  [RatingQuestionModel(question: "Classifique sua felicidade neste momento", rate: 0)]
  

  func deleteCheckQuestion(at offsets: IndexSet) {
    checkQuestions.remove(atOffsets: offsets)
  }
  
  func deleteRatingQuestion(at offsets: IndexSet) {
    rateQuestions.remove(atOffsets: offsets)
  }
}
