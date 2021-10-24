//
//  OffsetModifier.swift
//  Scrollable Menu
//
//  Created by George Kakarlis on 24/10/21.
//

import SwiftUI

struct OffsetModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .overlay(
            
                //getting scroll offset using geometry reader...
                GeometryReader{
                    proxy in
                    
                    Color.clear
                        .preference(key: OffsetKey.self, value: proxy.frame(in: .named("SCROLL")))
                }
            )
    }
}

struct OffsetModifier_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//prefrence key
struct OffsetKey: PreferenceKey{
    
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
