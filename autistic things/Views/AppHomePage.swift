import SwiftUI


struct HomePage: View {
  
  let date: Date
  let format: String

  init(){
    let date = Date()
    let dateFormatted =  date.getFormattedDate(format: "yyyy-MM-dd")
    self.date = date
    self.format = dateFormatted
  }
  
  var body: some View {
    NavigationView{
      VStack{
      HStack{
        VStack{
        NavigationLink("Todays questions") {
          QuestionsHomePage()
        }.padding(24)
        NavigationLink("Configurations") {
        }.padding(24)
          NavigationLink("Correlations") {
          ActivityView()
          }.padding(24)
        }}
        Spacer()
        Text(format)

    }
    }
  }}
 


