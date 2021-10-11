//
//  GroupCell.swift
//  VK-Client-SwiftUI
//
//  Created by Илья Лебедев on 11.10.2021.
//

import SwiftUI

struct GroupCellView: View {
    var body: some View {
        HStack {
            AvatarImage {
                Image("community")
            }

            Text("Название сообщества")
            
            Spacer()
        }
    }
}

struct GroupCellView_Previews: PreviewProvider {
    static var previews: some View {
        GroupCellView()
    }
}
