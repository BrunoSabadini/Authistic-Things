//
//  QuestionsModels.swift
//  autistic things
//
//  Created by Bruno Sabadini on 07/09/22.
//

import Foundation
import SwiftUI




class CheckQuestionModel: Identifiable, Codable {
  
  init(question: String, check: Bool){
    self.question = question
    self.check = check
  }
  
 var question: String
var check: Bool
  var id = UUID()
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
