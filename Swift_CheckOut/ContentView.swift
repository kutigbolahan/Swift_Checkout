//
//  ContentView.swift
//  Swift_CheckOut
//
//  Created by Mac on 12/2/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
            }.navigationTitle("MENU") 
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
