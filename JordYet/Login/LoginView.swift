import SwiftUI

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct LoginView: View {
    
    @State var username = ""
    @State var password = ""
    
    var body: some View{
        ZStack {
            Image("bgRed")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                AppLogo()
                Spacer().frame(height: 221)
                Tabbar()
                Spacer().frame(height: -57)
            }
            .padding()
        }
    }
}

struct AppLogo: View {
    var body: some View {
        Image("Logo-Border")
            .resizable()
            .frame(width: 279, height: 279)
            .clipped()
            .overlay(
                RoundedRectangle(cornerRadius: 360)
                    .stroke(Color.white, lineWidth: 5)
            )
    }
}
