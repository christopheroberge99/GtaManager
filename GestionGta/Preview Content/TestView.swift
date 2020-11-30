//
//  TestView.swift
//  GestionGta
//
//  Created by Christophe Roberge on 2020-11-18.
//  Copyright © 2020 Christophe Roberge. All rights reserved.
//
import SwiftUI


struct TestView: View {

    var body: some View {

        VStack {

           Image("BunkerLocation")

                .edgesIgnoringSafeArea(.top)

                .frame(height: 300)


            Image("Bunker")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)

                .offset(y: -130)

                .padding(.bottom, -130)


            VStack(alignment: .leading) {

                Text("Turtle Rock")

                    .font(.title)

                HStack(alignment: .top) {

                    Text("Joshua Tree National Park")

                        .font(.subheadline)

                    Spacer()

                    Text("California")

                        .font(.subheadline)

                }

            }

            .padding()


            Spacer()

        }

    }

}


struct ContentView_Previews: PreviewProvider {

    static var previews: some View {

        TestView()

    }

}
