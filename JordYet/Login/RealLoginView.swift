import SwiftUI

let kanitBold12 = Font.custom("Kanit-Bold", size: 12)
let azureColor = Color(red: 33/255.0, green: 150/255.0, blue: 243/255.0)
let blueGmailColor = Color(red: 98/255.0, green: 139/255.0, blue: 218/255.0)

struct RealLoginView_Previews: PreviewProvider {
    static var previews: some View {
        RealLoginView()
    }
}

struct RealLoginView: View {
    
    @State var email = ""
    @State var password = ""
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?

    
    var body: some View {
        ZStack {
            Image("bgWhite")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Button(action: {
                        self.viewControllerHolder?.dismiss(animated: true, completion: nil)
                    }) {
                        BackButton()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.trailing, 280)
                    .padding(.bottom, 17)
                    .padding(.top, 24)
                }
                AppLogoLong().padding(.bottom, 45)
                
                TextField("Email", text: $email)
                    .font(kanitRegular)
                    .foregroundColor(pinkishGrey)
                    .padding()
                    .background(Color.white)
                    .frame(width: 327, height: 48)
                    .cornerRadius(12)
                    .shadow(color: backButtonShadow, radius: 12, x: 0, y: 4)
                    .padding(.bottom, 16)
                
                SecureField("Password", text: $password)
                    .font(kanitRegular)
                    .foregroundColor(pinkishGrey)
                    .padding()
                    .background(Color.white)
                    .frame(width: 327, height: 48)
                    .cornerRadius(12)
                    .shadow(color: backButtonShadow, radius: 12, x: 0, y: 4)
                    .padding(.bottom, 24)
                
                Button(action: {print("Button Tapped")}) {
                    ForgotPasswordButton()
                }.padding(.bottom, 116)
                
                Button(action: {
                    self.viewControllerHolder?.present(style: .fullScreen) {
                    //                self.isShow.toggle()
                                        AppView()
                    }
                }) {
                    LoginButton()
                }.padding(.bottom, 16)
                
                Text("OR")
                    .font(kanitBold12)
                    .foregroundColor(blackColor)
                    .frame(width: 327, height: 24)
                    .padding(.bottom, 16)
                
                Button(action: {print("Button Tapped")}) {
                    SignInFacebookButton()
                }.padding(.bottom, 16)
                
                Button(action: {print("Button Tapped")}) {
                    SignInGmailButton()
                }
            }
        }
    }
}

struct ForgotPasswordButton: View {
    var body: some View {
        Text("FORGOT PASSWORD?")
            .font(kanitMedium)
            .underline()
            .foregroundColor(blackColor)
            .padding()
            .frame(width: 327, height:  32)
    }
}

struct SignInFacebookButton: View {
    var body: some View {
        Text("SIGN IN WITH FACEBOOK")
            .font(kanitBold)
            .foregroundColor(.white)
            .padding()
            .frame(width: 327, height:  56)
            .background(azureColor)
            .cornerRadius(10.0)
    }
}

struct SignInGmailButton: View {
    var body: some View {
        Text("SIGN IN WITH GMAIL")
            .font(kanitBold)
            .foregroundColor(.white)
            .padding()
            .frame(width: 327, height:  56)
            .background(blueGmailColor)
            .cornerRadius(10.0)
    }
}
