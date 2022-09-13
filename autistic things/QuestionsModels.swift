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

class QuestionsData: ObservableObject{
  
  @AppStorage("check_questions") var ratingQuestionModel : [RatingQuestionModel] = []
  @AppStorage("category_questions") var checkQuestionModel : [CheckQuestionModel] = []
  

  func deleteCheckQuestion(at offsets: IndexSet) {
    checkQuestionModel.remove(atOffsets: offsets)
  }
  
  func deleteRatingQuestion(at offsets: IndexSet) {
    ratingQuestionModel.remove(atOffsets: offsets)
  }
}


extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8) else {
            return nil
        }
        do {
            let result = try JSONDecoder().decode([Element].self, from: data)
            self = result
        } catch {
            print("Error: \(error)")
            return nil
        }
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
