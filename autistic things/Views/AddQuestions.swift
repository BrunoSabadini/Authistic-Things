//
//  AddQuestions.swift
//  autistic things
//
//  Created by Bruno Sabadini on 07/09/22.
//

import SwiftUI

struct AddNewQuestion: View {
  
  @Environment(\.managedObjectContext) var moc
  @FetchRequest(sortDescriptors: []) var questionsStoredInCoreData: FetchedResults<Question>

  
  
  @State var checkQuestionTextField: String = ""
  @State var rateQuestionTextField: String = ""
  @Environment(\.dismiss) var dismiss
  

  
  var body: some View {
    LazyVStack{
      Spacer()
      ScrollView{
        Text("Check Question")
        TextField("Type the question here", text: $checkQuestionTextField)
        Button("Save") {
        }
      }
      Spacer().frame(height: 50)
      Text("Rating Question")
      TextField("Type the question here", text: $rateQuestionTextField)
      Button("Save") {
      }
    }
    Spacer()
  }
}

