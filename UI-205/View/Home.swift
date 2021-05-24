//
//  Home.swift
//  UI-205
//
//  Created by にゃんにゃん丸 on 2021/05/24.
//

import SwiftUI

struct Home: View {
    @State var slected : Int = 1
    var body: some View {
        VStack{
            let small = UIScreen.main.bounds.height < 750
            
            TabView(selection:$slected){
                
                ForEach(1...3,id:\.self){index in
                    
                
                    GeometryReader{proxy -> AnyView in
                        
                        let minx = proxy.frame(in: .global).minX
                        
                        let width = UIScreen.main.bounds.width
                        
                        let progress = -minx / (width * 2)
                        
                        var scale = progress > 0 ? 1 - progress : 1 + progress
                        
                        scale = scale < 0.7 ? 0.3 : scale
                        
                        
                        return AnyView(
                        
                            VStack{
                                
                                Image("pic\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.horizontal,20)
                                    .frame(maxHeight: .infinity)
                                
                                Text("PetAdaption")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.blue)
                                
                                Text("Pet is life partner")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.red)
                            }
                            .padding(.top,small ? 10 : 0)
                            .frame(maxHeight: .infinity)
                            .scaleEffect(scale)
                        )
                        
                        
                        
                       
                        
                        
                    }
                    
                    .tag(index)
                    
                   
                }
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            CustomIncicator(count: 3, current: $slected)
                .padding(.vertical,small ? 10 : 15)
            
            
            VStack{
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack(spacing:15){
                        
                        Image(systemName: "applelogo")
                            .font(.system(size: 30, weight: .heavy))
                            .foregroundColor(.white)
                        
                        
                        Text("Sigin With Apple    ")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.purple)
                            .frame(maxWidth: .infinity)
                        
                        
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.primary)
                            .overlay(
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white,lineWidth: 2)
                            
                            )
                        
                        
                            )
                })
                .shadow(color: .blue.opacity(0.3), radius: 5, x: 5, y: 5)
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack(spacing:15){
                        
                        Image("google-symbol")
                            .resizable()
                            .frame(width: 25, height: 25)
                           
                        
                        
                        Text("Sigin With Google")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.purple)
                            .frame(maxWidth: .infinity)
                        
                        
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .overlay(
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primary,lineWidth: 2)
                            
                            )
                        
                        
                            )
                })
                .shadow(color: .red.opacity(0.3), radius: 5, x: 5, y: 5)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack(spacing:15){
                        
                        Image("email")
                            .resizable()
                            .frame(width: 25, height: 25)
                        
                        
                        
                        Text("    Sigin With Email      ")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.purple)
                            .frame(maxWidth: .infinity)
                        
                        
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .overlay(
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primary,lineWidth: 2)
                            
                            )
                        
                        
                            )
                })
                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                
            }
            .padding(.horizontal)
            .padding(.top,30)
            
            HStack{
                
                Text("Already have an account?")
                    .fontWeight(.semibold)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Login")
                        .fontWeight(.light)
                        .underline(true, color: .primary)
                })
                
                
                
            }
            
         
            
            
        }
        .frame(width: .infinity, height: .infinity)
        .background(Color("c1").ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct CustomIncicator : View {
    var count : Int
    @Binding var current : Int
    
    var body: some View{
        
        
        HStack{
            
            ForEach(0..<count,id:\.self){index in
                
              
                
                ZStack{
                    
                    if (current - 1) == index{
                        
                        
                        Circle()
                            .fill(Color.black)
                        
                    }
                    
                    else{
                        
                        Circle()
                            .fill(Color.white)
                            .overlay(
                            
                            Circle()
                                .stroke(Color.primary)
                            
                            )
                        
                    }
                    
                    
                }
                .frame(width: 10, height: 10)
                
            }
            
            
        
        }
        
        
    }
}
