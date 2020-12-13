//
//  ContentView.swift
//  Swift_CheckOut
//
//  Created by Mac on 12/2/20.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationView{
            List{
                ForEach(menu){ section in 
                    Section(header:  Text(section.name )){
                    ForEach(section.items){ item in
                      ItemRow(item: item)
                        
                    }
                    }
                }
            }.navigationTitle("MENU")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
