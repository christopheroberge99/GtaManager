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
                .offset(y: -110)
                
            Image("Bunker")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
                .offset(y: -230)
                //.padding(.bottom, -320)
            
            Text("Sporting goods")
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
                        Text("\(timerSporting.secondsLeft)")
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
                        Text("\(timerSporting.MoneySpent) $")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .offset(y: -200)
                        HStack{
                                Text("Money spent")
                                    .offset(y: -200)
                                
                                Text("(-)")
                                    .offset(y: -200)
                                 .onTapGesture(perform: {
                                        self.timerSporting.decreaseSpent()
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
                                                self.timerSporting.timerMode == .running ? self.timerSporting.pause() :  self.timerSporting.start()
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
                                                      self.timerSporting.reset()
                                                        self.timerSporting.resetSpent()
                                                     
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


struct SportingGoodsView_Previews: PreviewProvider {
    static var previews: some View {
        SportingGoodsView()
    }
}
