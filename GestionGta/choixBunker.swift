//
//  choixBunker.swift
//  GestionGta
//
//  Created by Christophe Roberge on 2020-05-17.
//  Copyright © 2020 Christophe Roberge. All rights reserved.
//

import SwiftUI

struct choixBunker: View {
    var body: some View {
        Image("businessHome")
            .renderingMode(.original)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        choixBunker()
    }
}
