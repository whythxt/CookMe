//
//  StretchingHeader.swift
//  CookMe
//
//  Created by Yurii on 30.09.2022.
//

import SwiftUI

struct StretchingHeader<Content: View>: View {
    let content: () -> Content

    func height(for proxy: GeometryProxy) -> CGFloat {
        let y = proxy.frame(in: .global).minY
        return proxy.size.height + max(0, y)
    }

    func offset(for proxy: GeometryProxy) -> CGFloat {
        let y = proxy.frame(in: .global).minY
        return min(0, -y)
    }

    func blur(for proxy: GeometryProxy) -> CGFloat {
        proxy.frame(in: .global).minY / 10 - 5
    }

    var body: some View {
        GeometryReader { geo in
            VStack(content: content)
                .frame(width: geo.size.width, height: height(for: geo))
//                .blur(radius: blur(for: geo))
                .offset(y: offset(for: geo))
        }
    }

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
}
