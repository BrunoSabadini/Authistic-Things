//
//  ContentView.swift
//  autistic things
//
//  Created by Bruno Sabadini on 28/06/22.
//
import SwiftUI

struct QuestionsModelView:View{
  
  let questionModel: QuestionsModel
  @State var checkQuestion: Bool = false
  
  var body: some View{
    Toggle(isOn: $checkQuestion) {
      Text(questionModel.question)
    }.toggleStyle(CheckboxStyle())
      .onAppear(perform: {checkQuestion = questionModel.check
      } )
  }
}

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
  }
}

struct MyView: View {
  
  @StateObject var questionData: QuestionsData = QuestionsData()
  
     var body: some View {
       NavigationView{
       VStack{
             VStack {
               List{
               ForEach($questionData.boolArr) { $firstObject in
                 Toggle(isOn: $firstObject.check) {
                   Text(firstObject.question)
                                 }.toggleStyle(CheckboxStyle())}
               }}.navigationTitle("Questions")
         Spacer()
         HStack{
             NavigationLink(destination:  AddNewQuestion()) {
               Text("Add")
             }
         Spacer()
         Button("Remove") {
         }
         }}.environmentObject(questionData)
       }
     }
}

struct AddNewQuestion: View {
  
  @State var name: String = ""
  @EnvironmentObject var questionData: QuestionsData
  
  var body: some View {
    VStack{
      Spacer()
      List{
        TextField("Type the question here", text: $name)
        NavigationLink(destination:  MyView()) {
          Button("Save") {
            questionData.addQuestion(question: name)
            print(name)
          }
        }}
      Spacer()
    }
  }
}
  
  struct CheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
      @State var checked = false

      var body: some View {
        MyView()
      }
    }
    
    static var previews: some View {
      MyView()
    }
  }
