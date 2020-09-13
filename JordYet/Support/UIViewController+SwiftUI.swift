//
//  UIViewController+SwiftUI.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 13/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct ViewControllerHolder {
    weak var value: UIViewController?
    init(_ value: UIViewController?) {
        self.value = value
    }
}

struct ViewControllerKey: EnvironmentKey {
    static var defaultValue: ViewControllerHolder { return ViewControllerHolder(UIApplication.shared.windows.first?.rootViewController ) }
}

extension EnvironmentValues {
    var viewController: ViewControllerHolder {
        get { return self[ViewControllerKey.self] }
        set { self[ViewControllerKey.self] = newValue }
    }
}

extension UIViewController {
    func present<Content: View>(style: UIModalPresentationStyle = .automatic, @ViewBuilder builder: () -> Content) {
        // Must instantiate HostingController with some sort of view...
        let toPresent = UIHostingController(rootView: AnyView(EmptyView()))
        toPresent.modalPresentationStyle = style
        // ... but then we can reset rootView to include the environment
        toPresent.rootView = AnyView(
            builder()
                .environment(\.viewController, ViewControllerHolder(toPresent))
        )
        self.present(toPresent, animated: true, completion: nil)
    }
}
