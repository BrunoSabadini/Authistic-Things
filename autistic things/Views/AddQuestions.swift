//
//  AddQuestions.swift
//  autistic things
//
//  Created by Bruno Sabadini on 07/09/22.
//

import SwiftUI

class AddNewQuestionViewModel: ObservableObject{
  @Published var checkQuestionTextField: String = ""
  @Published var rateQuestionTextField: String = ""
}

struct AddNewQuestion: View {
  
  @StateObject private var addNewQuestionViewModel = AddNewQuestionViewModel()
  
  @Environment(\.managedObjectContext) var moc
  @FetchRequest(sortDescriptors: []) var questionsStoredInCoreData: FetchedResults<Question>
  @Environment(\.dismiss) var dismiss
  

  var body: some View {
    LazyVStack{
      Spacer()
      ScrollView{
        Text("Check Question")
        TextField("Type the question here", text: $addNewQuestionViewModel.checkQuestionTextField)
        Button("Save") {
        }
      }
      Spacer().frame(height: 50)
      Text("Rating Question")
      TextField("Type the question here", text: $addNewQuestionViewModel.rateQuestionTextField)
      Button("Save") {
      }
    }
    Spacer()
  }
}

