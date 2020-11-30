//
//  OPView.swift
//  GestionGta
//
//  Created by Christophe Roberge on 2020-05-08.
//  Copyright © 2020 Christophe Roberge. All rights reserved.
//

import SwiftUI

struct OPView: View {
     @ObservedObject var timerOP = UniversalTimer()
     @State var ValueOne = false
     @State var ValueTwo = false
    
      var body: some View {
     
        VStack{
            
            Image("OPLocation")
                .edgesIgnoringSafeArea(.top)
                .offset(y: -190)
                
            Image("OP")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
                .offset(y: -320)
                .padding(.bottom, -320)
            
            Text("Organic Produce")
                .font(.title)
                .offset(y: -120)
                .padding(.bottom)
            
            Toggle(isOn: $ValueOne) {
                Text("Equipement upgrade")
            }
            .padding(.horizontal)
            .offset(y: -120)
            
            
            Toggle(isOn: $ValueTwo) {
                Text("Staff upgrade")
            }
            .padding(.horizontal)
            .offset(y: -120)
        
          Spacer()
        
            Text("Remaining time: ")
                .offset(y: -110)
            Text("\(timerOP.secondsLeft)")
                .font(.largeTitle)
                .fontWeight(.medium)
                .offset(y: -110)
            

            VStack(spacing: 30) {
                
            HStack{
                
                    Text("Money spent on supplies: \(timerOP.MoneySpent) K $")
                    
                
                
                    Text("(-)")
                     .onTapGesture(perform: {
                            self.timerOP.decreaseSpent()
                              })
                         }
            .offset(y: -70)
                  
            Text("Resupply")
                .font(.title)
                .offset(y: -70)
                    .onTapGesture(perform: {
                                    
                        self.timerOP.setName(nom: "Organic Produce")
                                    if self.ValueOne && !self.ValueTwo{
                                        self.timerOP.setSecondsLeft(secs: 2400)
                                               }
                                    else if self.ValueTwo && !self.ValueOne{
                                        self.timerOP.setSecondsLeft(secs: 2400)
                                               }
                                    else if self.ValueOne && self.ValueTwo{
                                        self.timerOP.setSecondsLeft(secs: 3000)
                                               }
                                    else if !self.ValueOne && !self.ValueTwo{
                                        self.timerOP.setSecondsLeft(secs: 1800)
                                               }
                                    
                                    
                                    
                            self.timerOP.addToSpent()
                            self.timerOP.reset()
                            self.timerOP.timerMode == .running ? self.timerOP.pause() :  self.timerOP.start()
                                  
                                 })
            
            
            Text("Pause")
                .offset(y: -70)
                                .onTapGesture(perform: {
                                    self.timerOP.timerMode == .running ? self.timerOP.pause() :  self.timerOP.start()
                                       })
                
            
            
            Text("Reset")
                .offset(y: -70)
                .font(.headline)
                                         .onTapGesture(perform: {
                                          self.timerOP.reset()
                                            self.timerOP.resetSpent()
                                         
                                         })
                .padding(.bottom)
                .padding(.bottom)
                .padding(.bottom)
          }
        }
      }
    }


struct OPView_Previews: PreviewProvider {
    static var previews: some View {
        OPView()
    }
}
