import SwiftUI


struct HomePage: View {
  
  let date: Date
  let format: String
 @State var bool: Bool = false
  
  func menu(text: String) -> some View {
    return Text(text)
      .bold()
      .padding(24)
      .foregroundColor(.white)
  }
  
  
  func buttonStyle(_ text: String) -> some View{
    return Button(action: { bool = true }) {
      Text(text)
        .bold()
        .padding(24)
        .foregroundColor(.white)
    }.background(
      ZStack{
        if bool{
        RoundedRectangle(cornerRadius: 100, style: .continuous)
            .transition(.slide)
                      .opacity(0.2)
        }}
    )
  }
  
  init(){
    let date = Date()
    let dateFormatted =  date.getFormattedDate(format: "yyyy-MM-dd")
    self.date = date
    self.format = dateFormatted
  }
  

  var body: some View {
    NavigationView{
      ZStack{
        Color.init(hex: "063970")
                        .ignoresSafeArea()
      VStack{
      HStack{
        VStack{
          NavigationLink {
            QuestionsHomePage()
          } label: {
            buttonStyle("Todays Questions")
}
          NavigationLink {
            QuestionsHomePage()
          } label: {
            buttonStyle("Organize Questions")
}
        }}
        Spacer()
        Text(format)
      }
      }
    }
  }}
 


