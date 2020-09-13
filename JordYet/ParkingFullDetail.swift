
//
//  ParkingFullDetail.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 13/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

let grayColor = Color(red: 216/255, green: 216/255, blue: 216/255)

struct ParkingFullDetail: View {
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?

    
    
    var body: some View {
        ZStack {
            Image("bgWhite")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView {
                    VStack {
                        HStack {
                            Button(action: {
                                self.viewControllerHolder?.dismiss(animated: true, completion: nil)
                            }) {
                                BackButton()
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.bottom, 17)
                            .padding(.top, 24)
                            Spacer()
                            Text("Detail").font(.custom("Kanit-Bold", size: 24)).padding(.trailing, 45)
                            Spacer()
                        }.padding([.leading, .trailing], 24)
                        Group {
                            VStack {
                                Image("2306e")
                                        .frame(width: 327, height: 216)
                                        .cornerRadius(20)
                                        .padding(.bottom, 16)
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
                                }
                            }
                        }.padding(.bottom, 16)
                        VStack(alignment: .leading) {
                            
                            VStack(alignment: .leading) {
                                Text("Creative Me").font(.custom("Kanit-Bold", size: 20))
                                Text("43 Ban Rawipha Sukhumvit Alley, Bang Chak, Phra Khanong, Bangkok 10260").font(.custom("Kanit-Medium", size: 14)).lineLimit(nil)
                                HStack {
                                    Image("icAddToCartCopy28").resizable().frame(width: 16, height: 16)
                                    Text("8/10 Parking").font(.custom("Kanit-Medium", size: 14))
                                }
                                HStack {
                                    Image("icAddToCartCopy23").resizable().frame(width: 16, height: 16)
                                    Image("icAddToCartCopy23").resizable().frame(width: 16, height: 16)
                                    Image("icAddToCartCopy23").resizable().frame(width: 16, height: 16)
                                    Image("icAddToCartCopy23").resizable().frame(width: 16, height: 16)
                                    Image("icAddToCartCopy23").resizable().frame(width: 16, height: 16)
                                }.padding(.bottom, 24)
                                
                                Group {
                                    VStack(alignment: .leading) {
                                        Text("Facility").font(.custom("Kanit-Bold", size: 14))
                                        VStack(alignment: .leading) {
                                            FacilityView()
                                        }
                                    }
                                }.padding(.bottom, 24)
                                Group {
                                    VStack(alignment: .leading) {
                                        Text("Booking").font(.custom("Kanit-Bold", size: 14))
                                        GridViewHeader()
                                    }
                                }
                            }.padding(.bottom, 24)
                        }.padding(.leading, 24).padding(.trailing, 24)
                        
                    }
                }
                Spacer()
                TabbarParkDetail()
                Spacer().frame(height: -24)
            }
            
        }
    }
}

struct ParkingFullDetail_Previews: PreviewProvider {
    static var previews: some View {
        ParkingFullDetail()
    }
}

struct FacilityView : View {
    var body: some View {
        VStack {
            HStack {
                Ellipse()
                    .fill(grayColor)
                    .frame(width: 40, height: 40)
                Ellipse()
                    .fill(grayColor)
                    .frame(width: 40, height: 40)
                Ellipse()
                    .fill(grayColor)
                    .frame(width: 40, height: 40)
                Ellipse()
                    .fill(grayColor)
                    .frame(width: 40, height: 40)
                Ellipse()
                    .fill(grayColor)
                    .frame(width: 40, height: 40)
                Ellipse()
                    .fill(grayColor)
                    .frame(width: 40, height: 40)
                Ellipse()
                    .fill(grayColor)
                    .frame(width: 40, height: 40)
            }.padding(.top, -8)
            Spacer()
            HStack {
                Ellipse()
                    .fill(grayColor)
                    .frame(width: 40, height: 40)
                Ellipse()
                    .fill(grayColor)
                    .frame(width: 40, height: 40)
                Ellipse()
                    .fill(grayColor)
                    .frame(width: 40, height: 40)
                Spacer()
            }
        }
    }
}

extension HorizontalAlignment {
    private enum UnderlineLeading: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.leading]
        }
    }
    
    static let underlineLeading = HorizontalAlignment(UnderlineLeading.self)
}

struct WidthPreferenceKey: PreferenceKey {
    static var defaultValue = CGFloat(0)
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
    typealias Value = CGFloat
}

struct TextGeometry: View {
    var body: some View {
        GeometryReader { geometry in
            return Rectangle().fill(Color.clear).preference(key: WidthPreferenceKey.self, value: geometry.size.width)
        }
    }
}

struct MagicStuff: ViewModifier {
    @Binding var activeIdx: Int
    let idx: Int
    
    func body(content: Content) -> some View {
        Group {
            if activeIdx == idx {
                content.alignmentGuide(.underlineLeading) { d in
                    return d[.leading]
                }.onTapGesture { self.activeIdx = self.idx }
                
            } else {
                content.onTapGesture { self.activeIdx = self.idx }
            }
        }
    }
}

struct GridViewHeader: View {
    @State private var offset: CGFloat = 0
    @State private var width: CGFloat = 0
    var body: some View {
        HStack {
            Spacer()
            Text("HOURLY")
                .overlay(MoveUnderlineButton(offset: $offset, width: $width))
            Spacer()
            Text("DAILY")
                .overlay(MoveUnderlineButton(offset: $offset, width: $width))
            Spacer()
            Text("MONTHS")
                .overlay(MoveUnderlineButton(offset: $offset, width: $width))
            Spacer()
        }
        .coordinateSpace(name: "container")
        .overlay(underline, alignment: .bottomLeading)
        .animation(.spring())
    }
    var underline: some View {
        Rectangle()
            .frame(height: 2)
            .frame(width: width)
            .padding(.leading, offset)
    }
    struct MoveUnderlineButton: View {
        @Binding var offset: CGFloat
        @Binding var width: CGFloat
        var body: some View {
            GeometryReader { geometry in
                Button(action: {
                    self.offset = geometry.frame(in: .named("container")).minX
                    self.width = geometry.size.width
                }) {
                    Rectangle().foregroundColor(.clear)
                }
            }
        }
    }
}
