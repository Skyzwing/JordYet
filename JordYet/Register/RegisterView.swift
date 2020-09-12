import SwiftUI

let backButtonShadow = Color(red: 0/255.0, green: 0/255.0, blue: 0/255.0, opacity: 0.1)

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

struct RegisterView: View {
    
    @State var name = ""
    @State var lastname = ""
    @State var phone = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPass = ""
    
    var body: some View {
        ZStack {
            Image("bgWhite")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Button(action: {print("Button Tapped")}) {
                        BackButton()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.trailing, 280)
                    .padding(.bottom, 17)
                    .padding(.top, 24)
                }
                AppLogoLong().padding(.bottom, 45)
                
                TextField("Name", text: $name)
                    .font(kanitRegular)
                    .foregroundColor(pinkishGrey)
                    .padding()
                    .background(Color.white)
                    .frame(width: 327, height: 48)
                    .cornerRadius(12)
                    .shadow(color: backButtonShadow, radius: 12, x: 0, y: 4)
                    .padding(.bottom, 16)
                
                TextField("Lastname", text: $lastname)
                    .font(kanitRegular)
                    .foregroundColor(pinkishGrey)
                    .padding()
                    .background(Color.white)
                    .frame(width: 327, height: 48)
                    .cornerRadius(12)
                    .shadow(color: backButtonShadow, radius: 12, x: 0, y: 4)
                    .padding(.bottom, 16)
                
                TextField("Phone No.", text: $phone)
                    .font(kanitRegular)
                    .foregroundColor(pinkishGrey)
                    .padding()
                    .background(Color.white)
                    .frame(width: 327, height: 48)
                    .cornerRadius(12)
                    .shadow(color: backButtonShadow, radius: 12, x: 0, y: 4)
                    .padding(.bottom, 16)
                
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
                    .padding(.bottom, 20)
                
                SecureField("Confirm Password", text: $confirmPass)
                    .font(kanitRegular)
                    .foregroundColor(pinkishGrey)
                    .padding()
                    .background(Color.white)
                    .frame(width: 327, height: 48)
                    .cornerRadius(12)
                    .shadow(color: backButtonShadow, radius: 12, x: 0, y: 4)
                    .padding(.bottom, 76)
                
                RedSignUpButton()
            }
        }
    }
}

struct AppLogoLong: View {
    var body: some View {
        Image("logoLong")
            .resizable()
            .frame(width: 247, height: 56)
            .clipped()
    }
}

struct BackButton: View {
    var body: some View {
        Image("backButton")
            .resizable()
            .frame(width: 48, height: 48)
            .clipped()
            .shadow(color: backButtonShadow, radius: 12, x: 0, y: 4)
    }
}

struct RedSignUpButton: View {
    var body: some View {
        Text("SIGN UP")
            .font(kanitBold)
            .foregroundColor(.white)
            .padding()
            .frame(width: 327, height:  56)
            .background(redColor)
            .cornerRadius(10.0)
    }
}
