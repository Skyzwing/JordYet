import SwiftUI

let kanitBold = Font.custom("Kanit-Bold", size: 16)
let kanitMedium = Font.custom("Kanit-Medium", size: 16)
let kanitRegular = Font.custom("Kanit-Regular", size: 16)
let redColor = Color(red: 255.0/255.0, green: 0/255.0, blue: 0/255.0)
let blackColor = Color(red: 16.0/255.0, green: 16.0/255.0, blue: 16.0/255.0)
let pinkishGrey = Color(red: 173/255.0, green: 172/255.0, blue: 172/255.0)

struct Tabbar: View {
    
    @State var isShow = false
    @State private var showModal = false
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?

    var body: some View {
        VStack {
            Button(action: {
                self.viewControllerHolder?.present(style: .fullScreen) {
//                self.isShow.toggle()
                    RealLoginView()
                }
            }) {
                LoginButton()
                }
            .padding(.bottom, 16)
            HStack {
                Button(action: {print("Button Tapped")}) {
                    SignUpButton()
                }
                
                Button(action: {print("Button Tapped")}) {
                    BrowseButton()
                }
            }
        }
        .padding([.leading, .trailing], 20)
        .padding(.horizontal, 5)
        .padding(.vertical, 23)
        .padding(.bottom, 6)
        .overlay(
            RoundedCorner(radius: 20.0, corners: [.topRight, .topLeft])
            .stroke(Color.white)
        ).background(RoundedCorner(radius: 20.0, corners: [.topRight, .topLeft]).fill(Color.white))
    }
}

struct BottomSheetModal_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
            byRoundingCorners: corners, cornerRadii: CGSize(width:
            radius, height: radius))
        return Path(path.cgPath)
    }
}

extension Tabbar {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
       clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct LoginButton: View {
    var body: some View {
        Text("LOGIN")
            .font(kanitBold)
            .foregroundColor(.white)
            .padding()
            .frame(width: 327, height:  56)
            .background(redColor)
            .cornerRadius(10.0)
    }
}

struct SignUpButton: View {
    var body: some View {
        Text("SIGN UP")
            .font(kanitMedium)
            .underline()
            .foregroundColor(blackColor)
            .padding()
            .frame(width: 151, height:  32)
    }
}

struct BrowseButton: View {
    var body: some View {
        Text("BROWSE")
            .font(kanitMedium)
            .underline()
            .foregroundColor(blackColor)
            .padding()
            .frame(width: 152, height:  32)
    }
}
