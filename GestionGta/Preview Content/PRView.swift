//
//  PRView.swift
//  GestionGta
//
//  Created by Christophe Roberge on 2020-11-13.
//  Copyright © 2020 Christophe Roberge. All rights reserved.
//

import SwiftUI

struct PRView: View {
     @ObservedObject var timerPharma = UniversalTimer()
     @State var ValueOne = false
     @State var ValueTwo = false
    
      var body: some View {
     
        VStack{
            
            Image("PRLocation")
                .edgesIgnoringSafeArea(.top)
                .offset(y: -110)
                
            Image("PR")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
                .offset(y: -230)
                //.padding(.bottom, -320)
            
            Text("Pharmaceutical reseach")
                .font(.title)
                .offset(y: -230)
                .padding(.bottom)
            
            
            ZStack{
                Image("BigButton")
                    .offset(y: -230)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                VStack{
                    Toggle(isOn: $ValueOne) {
                        Text("Equipement upgrade")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .offset(y: -240)
                    
                    .padding(.vertical)
                    
                    Toggle(isOn: $ValueTwo) {
                        Text("Staff upgrade")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .offset(y: -240)
                }
                
            }
            
        
            

            HStack{
                ZStack{
                    Image("SquareButton")
                        .offset(y: -200)
                        .shadow(radius: 2)
                    VStack{
                        Text("\(timerPharma.secondsLeft)")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .offset(y: -200)
                        Text("Remaining time")
                            .offset(y: -200)
                    }
                }
                
                ZStack{
                    Image("SquareButton")
                        .offset(y: -200)
                        .shadow(radius: 2)
                    VStack{
                        Text("\(timerPharma.MoneySpent)k $")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .offset(y: -200)
                        HStack{
                                Text("Money spent")
                                    .offset(y: -200)
                                
                                Text("(-)")
                                    .offset(y: -200)
                                 .onTapGesture(perform: {
                                        self.timerPharma.decreaseSpent()
                                          })
                                     }
                    }
                }
                
            }
            
                  
            VStack{
                
                ZStack{
                    
                    Image("LongButton")
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .offset(y: -170)
                    Text("Resupply")
                        .offset(y: -170)
                        .font(.title)
                        .foregroundColor(.white)
                        .font(.headline)
                            .onTapGesture(perform: {
                                            
                                self.timerPharma.setName(nom: "Pharmaceutical reseach")
                                
                                            if self.ValueOne && !self.ValueTwo{
                                                self.timerPharma.setSecondsLeft(secs: 2400)
                                                       }
                                            else if self.ValueTwo && !self.ValueOne{
                                                self.timerPharma.setSecondsLeft(secs: 2400)
                                                       }
                                            else if self.ValueOne && self.ValueTwo{
                                                self.timerPharma.setSecondsLeft(secs: 3000)
                                                       }
                                            else if !self.ValueOne && !self.ValueTwo{
                                                self.timerPharma.setSecondsLeft(secs: 305)
                                                       }
                                            
                                            
                                            
                                    self.timerPharma.addToSpent()
                                    self.timerPharma.reset()
                                    self.timerPharma.timerMode == .running ? self.timerPharma.pause() :  self.timerPharma.start()
                                          
                                         })
                }
                
           
                HStack{
                    
                    ZStack{
                        Image("Button1")
                            .offset(y: -170)
                            .shadow(radius: 10)
                        
                        Text("Pause")
                            .offset(y: -170)
                            .foregroundColor(.white)
                            .font(.headline)
                                            .onTapGesture(perform: {
                                                self.timerPharma.timerMode == .running ? self.timerPharma.pause() :  self.timerPharma.start()
                                                   })
                    }
                    
                    ZStack{
                        Image("Button2")
                            .offset(y: -170)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        
                        Text("Reset")
                            .offset(y: -170)
                            .foregroundColor(.white)
                            .font(.headline)
                            .font(.headline)
                                                     .onTapGesture(perform: {
                                                      self.timerPharma.reset()
                                                        self.timerPharma.resetSpent()
                                                     
                                                     })
                    }
                }
            }
            
                .padding(.bottom)
                .padding(.bottom)
                .padding(.bottom)
          }
        }
      }


struct PRView_Previews: PreviewProvider {
    static var previews: some View {
        PRView()
    }
}
