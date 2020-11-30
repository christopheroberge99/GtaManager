//
//  PRView.swift
//  GestionGta
//
//  Created by Christophe Roberge on 2020-11-13.
//  Copyright © 2020 Christophe Roberge. All rights reserved.
//

import SwiftUI

struct PRView: View {
     @ObservedObject var timerPR = UniversalTimer()
     @State var ValueOne = false
     @State var ValueTwo = false
    
      var body: some View {
     
        VStack{
            
            Image("PRLocation")
                .edgesIgnoringSafeArea(.top)
                .offset(y: -190)
                
            Image("PR")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
                .offset(y: -320)
                .padding(.bottom, -320)
            
            Text("Pharmaceutical research")
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
            Text("\(timerPR.secondsLeft)")
                .font(.largeTitle)
                .fontWeight(.medium)
                .offset(y: -110)
            

            VStack(spacing: 30) {
                
            HStack{
                
                    Text("Money spent on supplies: \(timerPR.MoneySpent) K $")
                    
                
                
                    Text("(-)")
                     .onTapGesture(perform: {
                            self.timerPR.decreaseSpent()
                              })
                         }
            .offset(y: -70)
                  
            Text("Resupply")
                .font(.title)
                .offset(y: -70)
                    .onTapGesture(perform: {
                                    
                        self.timerPR.setName(nom: "Pharmaceutical Research")
                                    if self.ValueOne && !self.ValueTwo{
                                        self.timerPR.setSecondsLeft(secs: 2400)
                                               }
                                    else if self.ValueTwo && !self.ValueOne{
                                        self.timerPR.setSecondsLeft(secs: 2400)
                                               }
                                    else if self.ValueOne && self.ValueTwo{
                                        self.timerPR.setSecondsLeft(secs: 3000)
                                               }
                                    else if !self.ValueOne && !self.ValueTwo{
                                        self.timerPR.setSecondsLeft(secs: 1800)
                                               }
                                    
                                    
                                    
                            self.timerPR.addToSpent()
                            self.timerPR.reset()
                            self.timerPR.timerMode == .running ? self.timerPR.pause() :  self.timerPR.start()
                                  
                                 })
            
            
            Text("Pause")
                .offset(y: -70)
                                .onTapGesture(perform: {
                                    self.timerPR.timerMode == .running ? self.timerPR.pause() :  self.timerPR.start()
                                       })
                
            
            
            Text("Reset")
                .offset(y: -70)
                .font(.headline)
                                         .onTapGesture(perform: {
                                          self.timerPR.reset()
                                            self.timerPR.resetSpent()
                                         
                                         })
                .padding(.bottom)
                .padding(.bottom)
                .padding(.bottom)
          }
        }
      }
    }


struct PRView_Previews: PreviewProvider {
    static var previews: some View {
        PRView()
    }
}
