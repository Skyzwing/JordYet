//
//  Tabbar.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 12/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct selectedTimeModal: View {
    
    
    @State var wakeUp: Date = Date()
    @State var minterval: Int = 1
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    let timeFormat: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateFormat = "h:mm"
      return formatter
    }()
    
    var body: some View {
            VStack {
                HStack{
                    Button(action: {
                        self.viewControllerHolder?.dismiss(animated: true, completion: nil)
                    }) {
                        Text("Close")
                    }
                    Spacer()
                }
                MyDatePicker(selection: $wakeUp, minuteInterval: minterval, displayedComponents: .hourAndMinute)
                Text("\(wakeUp, formatter: self.timeFormat)")
            }.padding([.leading, .trailing], 20)
            .padding(.vertical, 20)
            
            .overlay(
               RoundedCorner(radius: 20.0, corners: [.topRight, .topLeft])
                    .stroke(Color.white)
                ).background(RoundedCorner(radius: 20.0, corners: [.topRight, .topLeft]).fill(Color.white))
    }
}

extension selectedTimeModal {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
       clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct selectedTimeModal_Previews: PreviewProvider {
    static var previews: some View {
        selectedTimeModal()
    }
}
