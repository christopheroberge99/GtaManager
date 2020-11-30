//
//  SAIView.swift
//  GestionGta
//
//  Created by Christophe Roberge on 2020-05-08.
//  Copyright © 2020 Christophe Roberge. All rights reserved.
//

import SwiftUI

struct SAIView: View {
     @ObservedObject var timerSAI = UniversalTimer()
     @State var ValueOne = false
     @State var ValueTwo = false
    
      var body: some View {
     
        VStack{
            
            Image("SAILocation")
                .edgesIgnoringSafeArea(.top)
                .offset(y: -190)
                
            Image("SAI")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
                .offset(y: -320)
                .padding(.bottom, -320)
            
            Text("South American Imports")
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
            Text("\(timerSAI.secondsLeft)")
                .font(.largeTitle)
                .fontWeight(.medium)
                .offset(y: -110)
            

            VStack(spacing: 30) {
                
            HStack{
                
                    Text("Money spent on supplies: \(timerSAI.MoneySpent) K $")
                    
                
                
                    Text("(-)")
                     .onTapGesture(perform: {
                            self.timerSAI.decreaseSpent()
                              })
                         }
            .offset(y: -70)
                  
            Text("Resupply")
                .font(.title)
                .offset(y: -70)
                    .onTapGesture(perform: {
                                    
                        self.timerSAI.setName(nom: "South American Imports")
                                    if self.ValueOne && !self.ValueTwo{
                                        self.timerSAI.setSecondsLeft(secs: 2400)
                                               }
                                    else if self.ValueTwo && !self.ValueOne{
                                        self.timerSAI.setSecondsLeft(secs: 2400)
                                               }
                                    else if self.ValueOne && self.ValueTwo{
                                        self.timerSAI.setSecondsLeft(secs: 3000)
                                               }
                                    else if !self.ValueOne && !self.ValueTwo{
                                        self.timerSAI.setSecondsLeft(secs: 1800)
                                               }
                                    
                                    
                                    
                            self.timerSAI.addToSpent()
                            self.timerSAI.reset()
                            self.timerSAI.timerMode == .running ? self.timerSAI.pause() :  self.timerSAI.start()
                                  
                                 })
            
            
            Text("Pause")
                .offset(y: -70)
                                .onTapGesture(perform: {
                                    self.timerSAI.timerMode == .running ? self.timerSAI.pause() :  self.timerSAI.start()
                                       })
                
            
            
            Text("Reset")
                .offset(y: -70)
                .font(.headline)
                                         .onTapGesture(perform: {
                                          self.timerSAI.reset()
                                            self.timerSAI.resetSpent()
                                         
                                         })
                .padding(.bottom)
                .padding(.bottom)
                .padding(.bottom)
          }
        }
      }
    }


struct SAIView_Previews: PreviewProvider {
    static var previews: some View {
        SAIView()
    }
}
