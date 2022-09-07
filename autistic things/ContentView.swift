//
//  ContentView.swift
//  autistic things
//
//  Created by Bruno Sabadini on 28/06/22.
//
import SwiftUI


class QuestionsModel: Identifiable {
  
  init(question: String, check: Bool){
    self.question = question
    self.check = check
  }
  
  var question: String
  var check: Bool
  let id = UUID()
}

class QuestionsData: ObservableObject{
  @Published var boolArr = [QuestionsModel(question: "aaaa", check: false), QuestionsModel(question: "ffff", check: true)]
  
  func addQuestion(question: String){
    boolArr.append(QuestionsModel(question: question, check: false))
    boolArr.append(QuestionsModel(question: "aaaaaaafff", check: false))

    print(boolArr.count)
  }
  func delete(at offsets: IndexSet) {
          boolArr.remove(atOffsets: offsets)
      }
}

struct MyView: View {
  
  @StateObject var questionData: QuestionsData = QuestionsData()
 
     var body: some View {
       NavigationView {
         VStack{
           VStack {
             List{
               ForEach($questionData.boolArr) { $firstObject in
                 Toggle(isOn: $firstObject.check) {
                   Text(firstObject.question)
                 }.toggleStyle(CheckboxStyle())}.onDelete(perform: questionData.delete)
             }
           }
           .navigationTitle("Questions")
           Spacer()
           HStack{
             NavigationLink(destination:  {
               AddNewQuestion()
                 .environmentObject(questionData)
             }) {
               Text("Add")
             }
           }
         }
         .environmentObject(questionData)
       }
     }
}

struct AddNewQuestion: View {
  
  @State var question: String = ""
  @EnvironmentObject var questionData: QuestionsData
  @Environment(\.dismiss) var dismiss
  var body: some View {
    VStack{
      Spacer()
      List{
        TextField("Type the question here", text: $question)
          Button("Save") {
            if question.count > 0{
                questionData.boolArr.append(QuestionsModel(question: question, check: false))}
            dismiss()
        }}
      Spacer()
    }
  }}
  
  struct CheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
      @State var checked = false

      var body: some View {
        MyView()
      }
    }
    
    static var previews: some View {
      MyView()
      AddNewQuestion()
    }
  }
