//
//  AvatarImageViewBuilder.swift
//  VK-Client-SwiftUI
//
//  Created by Илья Лебедев on 11.10.2021.
//

import SwiftUI

struct AvatarImage: View {
    var content: Image
    
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .frame(width: 30, height: 30)
            .cornerRadius(15)
            .modifier(CircleShadow(shadowColor: .black, shadowRadius: 4, shadowOpacity: 0.7))
            .padding()
    }
}
