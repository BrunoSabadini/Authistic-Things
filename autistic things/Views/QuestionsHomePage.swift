//
//  QuestionsHomePage.swift
//  autistic things
//
//  Created by Bruno Sabadini on 07/09/22.
//

import SwiftUI

struct QuestionsHomePage: View {
  
  var date: String
  @StateObject var questionData: QuestionsData = QuestionsData()
  
  func isAnsweringToday(){
    let dateInstance = Date()
    let formatDate =  dateInstance.getFormattedDate(format: "yyyy-MM-dd")
  }
  
  func storeTodaysQuestionsInAppStorage(){
    
  }
  
  var body: some View {
    NavigationView{
      VStack{
          VStack{
            Text(date)
            List{
              Section(header: Text("Check")) {
                ForEach($questionData.checkQuestionModel) { $eachObject in
                  Toggle(eachObject.question, isOn: $eachObject.check).toggleStyle(CheckboxStyle())}.onDelete(perform: questionData.deleteCheckQuestion)
              }
              Section(header: Text("Rate")) {
                ForEach($questionData.ratingQuestionModel) { $eachObject in
                  Text(eachObject.question).listRowSeparator(.hidden)
                  StarRating(rate: $eachObject.rate)
                }
                .onDelete(perform: questionData.deleteRatingQuestion)
              }
            }
          }
          .navigationTitle("Questions")
          Spacer()
          HStack{
            NavigationLink("Add") {
              AddNewQuestion().environmentObject(questionData)
            }
            Button("Save") {
            }
          }
        }
      }.onAppear(perform: isAnsweringToday)
    }
  }

struct CheckBoxView_Previews: PreviewProvider {
  struct CheckBoxViewHolder: View {
    @State var checked = false
    
    var body: some View {
      QuestionsHomePage(date: "")
    }
  }
  
  static var previews: some View {
    QuestionsHomePage(date: "")
    AddNewQuestion()
  }
}
