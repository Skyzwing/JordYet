import SwiftUI

let kanitBold = Font.custom("Kanit-Bold", size: 16)

struct Tabbar: View {
    var body: some View {
        VStack {
            Button(action: {print("Button Tapped")}) {
                LoginButton()
            }
            .padding(.bottom, 24)
            HStack {
                Button(action: {print("Button Tapped")}) {
                    SignUpButton()
                }.padding(.trailing, 23)
                
                Button(action: {print("Button Tapped")}) {
                    BrowseButton()
                }
            }
        }
        .padding([.leading, .trailing], 20)
        .padding(.horizontal, 5)
        .padding(.vertical, 20)
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
            .font(kanitBold)
            .foregroundColor(redColor)
            .padding()
            .frame(width: 147, height: 56)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(redColor, lineWidth: 1)
            )
    }
}

struct BrowseButton: View {
    var body: some View {
        Text("SIGN UP")
            .font(kanitBold)
            .foregroundColor(redColor)
            .padding()
            .frame(width: 147, height: 56)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(redColor, lineWidth: 1)
            )
    }
}
