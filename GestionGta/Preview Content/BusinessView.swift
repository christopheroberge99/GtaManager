//
//  BusinessView.swift
//  GestionGta
//
//  Created by Christophe Roberge on 2020-05-08.
//  Copyright © 2020 Christophe Roberge. All rights reserved.
//

import SwiftUI

struct BusinessView: View {
    var body: some View {
        VStack{
        HStack{
        
                NavigationLink(destination: SAIView()) {
                    Text("SAI")}
            
            NavigationLink(destination: SportingGoodsView()){
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
