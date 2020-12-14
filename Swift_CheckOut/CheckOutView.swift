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
    static let tipAmounts = [10,15,20,25,0]
    
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay?", selection:$paymentType){
                    ForEach(0..<Self.paymentTypes.count){
                        Text(Self.paymentTypes[$0])
                    }
                }
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add checkout loyalty card")
                }
                if addLoyaltyDetails{
                TextField("Enter your checkout ID", text:$loyaltyNumber)
                }
            }
            Section(header: Text("Add a tip?")){
                Picker("Percentage:", selection:$tipAmount){
                    ForEach(0..<Self.tipAmounts.count){
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header:Text("TOTAL: $100")){
                Button("Confirm order"){}
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
