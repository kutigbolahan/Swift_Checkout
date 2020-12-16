//
//  AppView.swift
//  Swift_CheckOut
//
//  Created by Mac on 12/13/20.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            ContentView().tabItem {
                Image(systemName: "list.dash")
                Text("Menu")
            }
            OrderView().tabItem {
                Image(systemName: "square.and.pencil")
                Text("Order")
            }
            OrderView().tabItem {
                Image(systemName: "star")
                Text("Favourite")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
