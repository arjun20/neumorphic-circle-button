//
//  CircleButtonLongPress.swift
//  SwiftUI_Button
//
//  Created by Arjun on 18/12/20.
//  Copyright © 2020 Arjun. All rights reserved.
//

import SwiftUI

struct CircleButtonLongPress: View {
    @GestureState var tap = false
    @State var press = false
    
    var body: some View {
        VStack{
            
        ZStack{
            Image("fingerprint")
                .opacity(press ? 0 : 1)
                .scaleEffect(press ? 0 : 1)
            
            Image("fingerprint-2")
                .clipShape(Rectangle().offset(y: tap ? 0 : 50))
                .animation(.easeInOut)
                .opacity(press ? 0 : 1)
                .scaleEffect(press ? 0 : 1)

            
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 44, weight: .light))
                .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                .opacity(press ? 1 : 0)
                .scaleEffect(press ? 1 : 0)


        }
        .frame(width: 120, height: 120)
        .background(
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color(press ? #colorLiteral(red: 0.6959404011, green: 0.7919648188, blue: 0.9181742698, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.6959404011, green: 0.7919648188, blue: 0.9181742698, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
                Circle()
                    .stroke(Color.clear, lineWidth: 10)
                    .shadow(color: Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)  : #colorLiteral(red: 0.6959404011, green: 0.7919648188, blue: 0.9181742698, alpha: 1)), radius: 3, x: -5, y: -5)

                Circle()
                    .stroke(Color.clear, lineWidth: 10)
                    .shadow(color: Color(press ?  #colorLiteral(red: 0.6959404011, green: 0.7919648188, blue: 0.9181742698, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ), radius: 3,x: 3, y: 3)
            }
        )
            .clipShape(Circle())
            .overlay(
                Circle()
                    .trim(from: tap ? 0.001 : 1 , to: 1)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 5, lineCap: .round))
                    .frame(width: 88, height: 88)
                    .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 5, x: 3, y: 3)
                    .rotationEffect(Angle(degrees: 90)).rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                    .animation(.easeInOut)
        )
            .shadow(color: Color(press ?  #colorLiteral(red: 0.6959404011, green: 0.7919648188, blue: 0.9181742698, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ), radius: 20, x: -20, y: -20)
            .shadow(color: Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)  : #colorLiteral(red: 0.6959404011, green: 0.7919648188, blue: 0.9181742698, alpha: 1)  ), radius: 20, x: 20, y: 20)
            .scaleEffect(tap ? 1.2 : 1)
            .gesture(LongPressGesture().updating($tap){ currentState,gestureState,transition in
                gestureState = currentState
                
            }
                .onEnded({ (value) in
                self.press.toggle()
            }))
    }.frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color(#colorLiteral(red: 0.8072218615, green: 0.9044003463, blue: 0.9771375317, alpha: 1))).edgesIgnoringSafeArea(.all)
        
    }
}

struct CircleButtonLongPress_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonLongPress()
    }
}
