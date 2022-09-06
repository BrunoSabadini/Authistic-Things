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



struct MyView: View {
  
  @State private var boolArr = [QuestionsModel(question: "aaaa", check: false), QuestionsModel(question: "ffff", check: true)]
  
@State var isRemoving = false
  
     var body: some View {
         NavigationView {
             VStack {
               if isRemoving == false {

             List($boolArr) { $questionModel in
               VStack{
                 Toggle(isOn: $questionModel.check) {
                         Text(questionModel.question)
                 }.toggleStyle(CheckboxStyle())}
             }}
               else{
                 List($boolArr) { $questionModel in
                   VStack{
                     Toggle(isOn: $questionModel.check) {
                       if questionModel.check == true{
                         Text(questionModel.question).foregroundColor(Color.red)}
                       else{Text(questionModel.question).foregroundColor(Color.green)}
                     }.toggleStyle(CheckboxStyleDelete())
                     
                   }}
               }
               
               
             }
             .navigationBarItems(leading:
                                  Button(action: { self.boolArr.append(QuestionsModel(question: "bbb", check: .random())) })
                 { Text("Add") }
                 , trailing:
                 Button(action: {
               isRemoving = true
               for index in boolArr {
               }
             })
                 { Text("Remove") })
         }
     }
}
  
  
  
//
//  struct CheckBoxView_Previews: PreviewProvider {
//    struct CheckBoxViewHolder: View {
//      @State var checked = false
//
//      var body: some View {
//        MyView(id: <#ObjectIdentifier#>)
//      }
//    }
    
//    static var previews: some View {
//      MyView()
//    }
//  }
