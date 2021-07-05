//
//  ViewExtension.swift
//  InvoiceMaker
//
//  Created by GaGan on 5/6/21.
//

import SwiftUI

extension View {
    public func listSeparatorStyleNone() -> some View {
        modifier(ListSeparatorStyleNoneModifier())
    }
}

public struct ListSeparatorStyleNoneModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content.onAppear {
            UITableView.appearance().separatorColor = .none
        }.onDisappear {
            UITableView.appearance().separatorStyle = .none
        }
    }
}

