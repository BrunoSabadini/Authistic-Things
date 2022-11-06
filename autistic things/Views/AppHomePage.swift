import SwiftUI


struct HomePage: View {
  
  @State var tag: Int? = 0
  
  init(){
    let date = Date()
    let dateFormatted =  date.getFormattedDate(format: "yyyy-MM-dd")
    self.date = date
    self.format = dateFormatted
  }
  
  let date: Date
  let format: String
  
  func menu(text: String) -> some View {
    return Text(text)
      .bold()
      .padding(24)
      .foregroundColor(.white)
  }
  
  
  
  
  struct ButtonView: View {
    @State var buttonText:String
    
    init(_ buttonText:String){
      self.buttonText = buttonText
    }
    
    
    var body: some View {
      Text(buttonText)
        .bold()
        .padding(24)
        .foregroundColor(.white)
        .background(
          ZStack{
            RoundedRectangle(cornerRadius: 100, style: .continuous)
              .transition(.slide)
              .opacity(0.2)
          })
          }
          }
          
          
          var body: some View {
            NavigationView{
              ZStack{
                Color.init(hex: "063970")
                  .ignoresSafeArea()
                VStack{
                  HStack{
                    VStack{
                      NavigationLink(destination: QuestionsPage()) {
                        ButtonView("Todays Questions")
                      }
                      Spacer()
                      Text(format)
                    }
                  }
                }
              }
            }}
          
          }
          
