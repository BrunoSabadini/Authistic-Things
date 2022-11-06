//
//  QuestionsHomePage.swift
//  autistic things
//
//  Created by Bruno Sabadini on 07/09/22.
//

import SwiftUI

class CheckQuestionStore: ObservableObject {
  static let shared = CheckQuestionStore()
  @Published var checkQuestionModelMocList = [CheckQuestionModel(question: "aaa", check: true),CheckQuestionModel(question: "bbb", check: false)]
}


class QuestionsPageViewModel:ObservableObject {
  
  @FetchRequest(sortDescriptors: []) var questionsStoredInCoreData: FetchedResults<Question>
  @Environment(\.managedObjectContext) var moc
  @ObservedObject var store = CheckQuestionStore.shared
  
  func deleteBooks(at offsets: IndexSet) {
    for offset in offsets {
      let questions = questionsStoredInCoreData[offset]
      moc.delete(questions)
      try? moc.save()
    }
  }
  
  
  func loadPersistentStorageData(){
    
    for element in store.checkQuestionModelMocList {
      let saveElement = Question(context: moc)
      saveElement.check = element.check
      saveElement.question = element.question
      saveElement.id = element.id
    }
    
    try? moc.save()
  }
}

struct QuestionsPage: View {
  
  @StateObject private var questionPageViewModel = QuestionsPageViewModel()
  
  var body: some View {
    NavigationView{
      VStack{
        VStack{
          List{
            Section(header: Text("Check")) {
              ForEach($questionPageViewModel.store.checkQuestionModelMocList) { $element in
                Toggle( element.question,isOn: $element.check).toggleStyle(CheckboxStyle())
              }.onDelete(perform: questionPageViewModel.deleteBooks)}
          }
          .navigationTitle("Questions")
          Spacer()
          HStack{
            NavigationLink("Add") {
              AddNewQuestion()
            }
            Button("Save") {
            }
          }
        }
      }
    }.background(      Color.init(hex: "063970")
                        .ignoresSafeArea())
  }
}



struct CheckBoxView_Previews: PreviewProvider {
  struct CheckBoxViewHolder: View {
    @State var checked = false
    
    var body: some View {
      QuestionsPage()
    }
  }
  
  static var previews: some View {
    QuestionsPage()
    AddNewQuestion()
  }
}
