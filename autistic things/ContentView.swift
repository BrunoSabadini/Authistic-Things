//
//  ContentView.swift
//  autistic things
//
//  Created by Bruno Sabadini on 28/06/22.
//
import SwiftUI

struct RatingView: View {
  @Binding var rating: Int
  
  var label = ""
  
  var maximumRating = 5
  
  var offImage: Image?
  var onImage = Image(systemName: "star.fill")
  
  var offColor = Color.gray
  var onColor = Color.yellow
  
  func image(for number: Int) -> Image {
    if number > rating {
      return offImage ?? onImage
    } else {
      return onImage
    }
  }
  
  var body: some View{
    HStack {
      if label.isEmpty == false {
        Text(label)
      }
      
      ForEach(1..<maximumRating + 1, id: \.self) { number in
        image(for: number)
          .foregroundColor(number > rating ? offColor : onColor)
          .onTapGesture {
            rating = number
          }
      }
    }
  }
}

class CheckQuestionModel: Identifiable {
  
  init(question: String, check: Bool){
    self.question = question
    self.check = check
  }
  
  var question: String
  var check: Bool
  let id = UUID()
}

class CategoryQuestionModel: Identifiable {
  
  init(question: String, category: Int){
    self.question = question
    self.category = category
  }
  
  var question: String
  var category: Int
  let id = UUID()
}

class QuestionsData: ObservableObject{
  
  @Published var checkQuestions = [CheckQuestionModel(question: "Oque?", check: false), CheckQuestionModel(question: "Oi?", check: true)]
  
  @Published var categoryQuestions = [CategoryQuestionModel(question: "Pergunta?", category: 5)]
  
  func delete(at offsets: IndexSet) {
    checkQuestions.remove(atOffsets: offsets)
  }
  
}

struct MyView: View {
  
  @StateObject var questionData: QuestionsData = QuestionsData()
  
  var body: some View {
    NavigationView{
      VStack{
      VStack{
        List{
          Section(header: Text("Check")) {
            ForEach($questionData.checkQuestions) { $eachObject in
              Toggle(eachObject.question, isOn: $eachObject.check).toggleStyle(CheckboxStyle())}.onDelete(perform: questionData.delete)
          }
          Section(header: Text("Category")) {
            ForEach($questionData.categoryQuestions) { $eachObject in
              Text(eachObject.question).listRowSeparator(.hidden)
              RatingView(rating: $eachObject.category)
            }
            .onDelete(perform: questionData.delete)
          }
        }
      }
      .navigationTitle("Questions")
      Spacer()
      HStack{
        NavigationLink("Add") {
          AddNewQuestion().environmentObject(questionData)
        }
      }
    }
    }
  }
}




struct AddNewQuestion: View {
  
  @State var checkQuestion: String = ""
  @State var categoryQuestion: String = ""
  @State var category: Int = 0
  @EnvironmentObject var questionData: QuestionsData
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    VStack{
      Spacer()
      List{
        Text("Check Question")
        TextField("Type the question here", text: $checkQuestion)
        Button("Save") {
          if checkQuestion.count > 0{
            questionData.checkQuestions.append(CheckQuestionModel(question: checkQuestion, check: false))}
          dismiss()
        }
      }
      List{
        Text("Category Question")
        TextField("Type the question here", text: $categoryQuestion)
        Button("Save") {
          if categoryQuestion.count > 0{
            questionData.categoryQuestions.append(CategoryQuestionModel(question: categoryQuestion, category: category))}
          dismiss()
        }
      }
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
    AddNewQuestion()
  }
}
