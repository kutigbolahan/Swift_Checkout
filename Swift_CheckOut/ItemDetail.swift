//
//  ItemDetail.swift
//  Swift_CheckOut
//
//  Created by Mac on 12/13/20.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    var item: MenuItem
    var body: some View {
        VStack{
            ZStack (alignment: .bottomTrailing){
                Image(item.mainImage)
                Text("Photo:\(item.photoCredit)").padding(4).background(Color.black).font(.footnote).foregroundColor(.white).offset(x:-25, y: -5)
            }
            Text(item.description).padding()
            Button("Order This"){
                order.add(item: item)
            }.font(.headline)
            Spacer()
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView{
            ItemDetail(item: MenuItem.example)
            
        }
    }
}
