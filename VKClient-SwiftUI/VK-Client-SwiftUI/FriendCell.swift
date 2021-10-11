//
//  FriendCell.swift
//  VK-Client-SwiftUI
//
//  Created by Илья Лебедев on 11.10.2021.
//

import SwiftUI

struct FriendCellView: View {
    var body: some View {
        HStack {
            AvatarImage {
                Image("camera")
            }
            
            VStack (alignment: .leading){
                Text("Имя Фамилия")
                
                Text("Компания, Город")
                    .font(.footnote)
                    .fontWeight(.thin)
            }
            .lineLimit(1)

            Spacer()
        }
    }
}

struct FriendCellView_Previews: PreviewProvider {
    static var previews: some View {
        FriendCellView()
    }
}
