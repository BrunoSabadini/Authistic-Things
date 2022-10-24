//
//  QuestionsHomePage.swift
//  autistic things
//
//  Created by Bruno Sabadini on 07/09/22.
//

import SwiftUI

class CheckQuestionStore: ObservableObject {
  @Published var checkQuestionModelMocList = [CheckQuestionModel(question: "aaa", check: true),CheckQuestionModel(question: "bbb", check: false)]
  static let shared = CheckQuestionStore()
  

}

struct QuestionsHomePage: View {
  
  @Environment(\.managedObjectContext) var moc
  @FetchRequest(sortDescriptors: []) var questionsStoredInCoreData: FetchedResults<Question>
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
  
  var body: some View {
    NavigationView{
      VStack{
        VStack{
          List{
            Section(header: Text("Check")) {
              ForEach($store.checkQuestionModelMocList) { $element in
                Toggle( element.question,isOn: $element.check).toggleStyle(CheckboxStyle())
              }.onDelete(perform: deleteBooks)}
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
    }}}

struct CheckBoxView_Previews: PreviewProvider {
  struct CheckBoxViewHolder: View {
    @State var checked = false
    
    var body: some View {
      QuestionsHomePage()
    }
  }
  
  static var previews: some View {
    QuestionsHomePage()
    AddNewQuestion()
  }
}
