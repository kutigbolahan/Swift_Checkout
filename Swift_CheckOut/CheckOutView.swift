//
//  CheckOutView.swift
//  Swift_CheckOut
//
//  Created by Mac on 12/14/20.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckOutView().environmentObject(order)
    }
}
