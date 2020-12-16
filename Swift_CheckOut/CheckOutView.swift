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
    static let pickUpTimes = ["Now","Tonight","Tomorrow"]
    
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    @State private var pickUpTime = 0
    
    var totalPrice: Double{
        let total = Double(order.total)
        let tipValue = total / 100 *
            Double(Self.tipAmounts[tipAmount])
        return total + tipValue
        
    }
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
            Section(header: Text("Pick a time?")){
                Picker("Time", selection:$pickUpTime){
                    ForEach(0..<Self.pickUpTimes.count){
                        Text(Self.pickUpTimes[$0])
                    }
                    
                }
            }
            Section(header: Text("Add a tip?")){
                Picker("Percentage:", selection:$tipAmount){
                    ForEach(0..<Self.tipAmounts.count){
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header:Text("TOTAL: $\(totalPrice,specifier: "%.2f")").font(.title2).foregroundColor(.black)){
                Button("Confirm order"){
                    self.showingPaymentAlert.toggle()
                }
            }
            
            
        }
        .navigationBarTitle(Text("Payment"),displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title:Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") - thank you!"), dismissButton: .default(Text("Ok")) )
        }
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckOutView().environmentObject(order)
    }
}
