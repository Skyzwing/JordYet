import SwiftUI

let kanitBold14 = Font.custom("Kanit-Bold", size: 14)
let kanitBold24 = Font.custom("Kanit-Bold", size: 24)
let kanitRegular14 = Font.custom("Kanit-Regular", size: 14)
let kanitMedium14 = Font.custom("Kanit-Medium", size: 14)
let kanitBold20 = Font.custom("Kanit-Bold", size: 24)

struct CreditCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreditCardView()
    }
}

struct CreditCardView: View {
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    @State var promo = ""
    
    var body: some View {
        ZStack {
            Image("bgWhite")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Button(action: {
                        self.viewControllerHolder?.present(style: .fullScreen) {
                            AppView()
                        }
                    }) {
                        BackButton()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.trailing, 60)
                    
                    Text("Payment")
                    .font(kanitBold24)
                    .padding(.trailing, 110)
                }
                .padding(.bottom, 17)
                .padding(.top, 24)
                .frame(width: 327, height: 48)
                
                CreditCardImage()
                    .padding(.bottom, 24)
                
                HStack {
                    Ellipse()
                        .fill(Color.red)
                        .frame(width: 10, height: 10).padding(.trailing, 2)
                    Ellipse()
                        .fill(grayColor)
                        .frame(width: 10, height: 10).padding(.trailing, 2)
                    Ellipse()
                        .fill(grayColor)
                        .frame(width: 10, height: 10).padding(.trailing, 2)
                    Ellipse()
                        .fill(grayColor)
                        .frame(width: 10, height: 10).padding(.trailing, 2)
                    Ellipse()
                        .fill(grayColor)
                        .frame(width: 10, height: 10)
                }.padding(.bottom, 12)
                
                Text("Promotion Code")
                .font(kanitBold14)
                    .frame(width: 327, height: 24)
                    .padding(.trailing, 220)
                    .padding(.bottom, -8)
                
                TextField("Promotion Code", text: $promo)
                .font(kanitRegular)
                .foregroundColor(pinkishGrey)
                .padding()
                .background(Color.white)
                .frame(width: 327, height: 48)
                .cornerRadius(12)
                .shadow(color: backButtonShadow, radius: 12, x: 0, y: 4)
                .padding(.bottom, 16)
                
                Text("Detail Payment")
                .font(kanitBold14)
                    .frame(width: 327, height: 24)
                    .padding(.trailing, 220)
                    .padding(.bottom, -8)
                
                HStack {
                    Image("mapPin")
                        .frame(width: 16, height: 16)
                    
                    Text("Place")
                    .font(kanitRegular14)
                    .foregroundColor(blackColor)
                        .padding(.trailing, 91)
                    
                    Text("Creativeme")
                    .font(kanitMedium14)
                    .foregroundColor(blackColor)
                    .padding(.leading, 91)
                }.padding(.bottom, -12)
                
                Group {
                    HStack {
                        Image("clock")
                            .frame(width: 16, height: 16)
                        
                        Text("Time")
                        .font(kanitRegular14)
                        .foregroundColor(blackColor)
                            .padding(.trailing, 92)
                        
                        Text("10:00-12:00")
                        .font(kanitMedium14)
                        .foregroundColor(blackColor)
                        .padding(.leading, 92)
                    }.padding(.bottom, -12)
                                
                    HStack {
                        Image("crosshair")
                            .frame(width: 16, height: 16)
                        
                        Text("Payment")
                        .font(kanitRegular14)
                        .foregroundColor(blackColor)
                            .padding(.trailing, 67)
                        
                        Text("30 Baht/Hourly")
                        .font(kanitMedium14)
                        .foregroundColor(blackColor)
                        .padding(.leading, 68)
                    }.padding(.bottom, 2)
                    
                    HStack {
                        Text("Total")
                        .font(kanitBold20)
                        .foregroundColor(blackColor)
                        .padding(.trailing, 84)
                        
                        Text("60 Baht")
                        .font(kanitBold20)
                        .foregroundColor(blackColor)
                        .padding(.leading, 84)
                        }
                }
                
                Spacer().frame(height: 110)
                Button(action: {
                    self.viewControllerHolder?.present(style: .fullScreen) {
                        AppView()
                    }
                }) {
                    PayButton()
                }
            }
        }
    }
}

struct CreditCardImage: View {
    var body: some View {
        Image("CreditCard")
            .frame(width: 327, height: 192)
            .scaledToFit()    }
}

struct PayButton: View {
    var body: some View {
        Text("PAY")
            .font(kanitBold)
            .foregroundColor(.white)
            .padding()
            .frame(width: 327, height:  56)
            .background(redColor)
            .cornerRadius(10.0)
    }
}
