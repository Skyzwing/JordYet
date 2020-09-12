import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let redColor = Color(red: 255.0/255.0, green: 0/255.0, blue: 0/255.0)

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
                Spacer().frame(height: 192)
                Tabbar()
                Spacer().frame(height: -51)
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
    }
}





//                TextField("Username", text: $username)
//                    .padding()
//                    .background(lightGreyColor)
//                    .cornerRadius(5.0)
//                    .padding(.bottom, 20)
//
//                SecureField("Password", text: $password)
//                    .padding()
//                    .background(lightGreyColor)
//                    .cornerRadius(5.0)
//                    .padding(.bottom, 20)
//
//                Button(action: {print("Button Tapped")}) {
//                    LoginButton()
//                }
