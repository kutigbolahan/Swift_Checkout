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
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
