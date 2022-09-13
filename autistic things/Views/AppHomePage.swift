import SwiftUI


struct HomePage: View {
  
  let date: Date
  let format: String

  init(){
    let date = Date()
    let format =  date.getFormattedDate(format: "yyyy-MM-dd")
    self.date = date
    self.format = format
  }
  
  var body: some View {
    NavigationView{
      VStack{
        Text(format)
      HStack{
        NavigationLink("Todays questions") {
          QuestionsHomePage(date: format)
        }}
      VStack{
        ActivityView()
      }
    }
    }
  }}
 


extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
