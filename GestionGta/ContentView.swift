//
//  ContentView.swift
//  GestionGta
//
//  Created by Christophe Roberge on 2020-05-08.
//  Copyright © 2020 Christophe Roberge. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @State var listItems = ["Sporting Goods", "South American Imports", "Pharmaceutical research","Cash Creation","Organic Produce","Printing & Copying"]
    
    var body: some View {
            /*
        NavigationView {
                   List {
                       ForEach(listItems, id: \.self) { (item) in
                           Text(item)
                       }.onMove { (indexSet, index) in
                           self.listItems.move(fromOffsets: indexSet,
                                               toOffset: index)
                       }
                   }
                   .navigationBarTitle(Text("Nav Title"))
                   .navigationBarItems(trailing: EditButton())
               }
         */
        
        NavigationView{
        
            List{
               
            NavigationLink(destination: SportingGoodsView()) {
                Text("Sporting Goods")}
                
            NavigationLink(destination: SAIView()) {
                Text("South American Imports")}
            NavigationLink(destination: PRView()) {
                Text("Pharmaceutical research")}
            NavigationLink(destination: CCView()) {
                Text("Cash Creation")}
            NavigationLink(destination: OPView()) {
                Text("Organic Produce")}
            NavigationLink(destination: PrintingView()) {
                Text("Printing & Copying")}
       
        }
            .navigationBarTitle(Text("Businesses"))
          //  .navigationBarItems(trailing: EditButton())
            
    }
        
        
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

/*
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
        HStack{
        
                ///NavigationLink(destination: BunkerView()) {
                  // Text("Bunker")}
            
            
                NavigationLink(destination: CokeView()) {
                    Text("Coke")}
            
            NavigationLink(destination: BunkerView()){
            choixBunker()
            }
        }
            
            
        }
        
}

struct BusinessView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessView()
    }
}
}
*/
