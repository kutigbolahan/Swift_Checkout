//
//  CheckOutView.swift
//  Swift_CheckOut
//
//  Created by Mac on 12/14/20.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var order: Order
    static let paymentTypes = ["Cash","Credit Card","CheckoutPoints"]
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay?", selection:$paymentType){
                    ForEach(0..<Self.paymentTypes.count){
                        Text(Self.paymentTypes[$0])
                    }
                }
                Toggle(isOn: $addLoyaltyDetails) {
                    Text("Add checkout loyalty card")
                }
                if addLoyaltyDetails{
                TextField("Enter your checkout ID", text:$loyaltyNumber)
                }
            }
        }
        .navigationBarTitle(Text("Payment"),displayMode: .inline)
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckOutView().environmentObject(order)
    }
}
