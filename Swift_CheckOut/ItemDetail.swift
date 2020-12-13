//
//  ItemDetail.swift
//  Swift_CheckOut
//
//  Created by Mac on 12/13/20.
//

import SwiftUI

struct ItemDetail: View {
    var item: MenuItem
    var body: some View {
        VStack{
            Image(item.mainImage)
            Text(item.description)
        }.navigationTitle(item.name)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: MenuItem.example)
    }
}
