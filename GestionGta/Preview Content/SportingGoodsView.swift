//
//  SportingGoodsView.swift
//  GestionGta
//
//  Created by Christophe Roberge on 2020-05-08.
//  Copyright © 2020 Christophe Roberge. All rights reserved.
//


import SwiftUI

struct SportingGoodsView: View {
     @ObservedObject var timerSporting = UniversalTimer()
     @State var ValueOne = false
     @State var ValueTwo = false
    
      var body: some View {
     
        VStack{
            
            Image("BunkerLocation")
                .edgesIgnoringSafeArea(.top)
                .offset(y: -190)
                
            Image("Bunker")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
                .offset(y: -320)
                .padding(.bottom, -320)
            
            Text("Sporting goods")
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
            Text("\(timerSporting.secondsLeft)")
                .font(.largeTitle)
                .fontWeight(.medium)
                .offset(y: -110)
            

            VStack(spacing: 30) {
                
            HStack{
                
                    Text("Money spent on supplies: \(timerSporting.MoneySpent) K $")
                    
                
                
                    Text("(-)")
                     .onTapGesture(perform: {
                            self.timerSporting.decreaseSpent()
                              })
                         }
            .offset(y: -70)
                  
            Text("Resupply")
                .font(.title)
                .offset(y: -70)
                    .onTapGesture(perform: {
                                    
                        self.timerSporting.setName(nom: "Sporting Goods")
                        
                                    if self.ValueOne && !self.ValueTwo{
                                        self.timerSporting.setSecondsLeft(secs: 2400)
                                               }
                                    else if self.ValueTwo && !self.ValueOne{
                                        self.timerSporting.setSecondsLeft(secs: 2400)
                                               }
                                    else if self.ValueOne && self.ValueTwo{
                                        self.timerSporting.setSecondsLeft(secs: 3000)
                                               }
                                    else if !self.ValueOne && !self.ValueTwo{
                                        self.timerSporting.setSecondsLeft(secs: 305)
                                               }
                                    
                                    
                                    
                            self.timerSporting.addToSpent()
                            self.timerSporting.reset()
                            self.timerSporting.timerMode == .running ? self.timerSporting.pause() :  self.timerSporting.start()
                                  
                                 })
            
            
            Text("Pause")
                .offset(y: -70)
                                .onTapGesture(perform: {
                                    self.timerSporting.timerMode == .running ? self.timerSporting.pause() :  self.timerSporting.start()
                                       })
                
            
            
            Text("Reset")
                .offset(y: -70)
                .font(.headline)
                                         .onTapGesture(perform: {
                                          self.timerSporting.reset()
                                            self.timerSporting.resetSpent()
                                         
                                         })
                .padding(.bottom)
                .padding(.bottom)
                .padding(.bottom)
          }
        }
      }
    }


struct SportingGoodsView_Previews: PreviewProvider {
    static var previews: some View {
        SportingGoodsView()
    }
}
