//
//  ContentView.swift
//  Ly_Ha
//
//  Created by MAY 07 on 14/9/26.
//

import SwiftUI
        

struct ContentView: View{
    //1. Variables
    let name = "Daisy"
    let ID = "SESEIU24017"
    let Age = 20
    let GPA = 4.0
    let isStudent = "true"
    
    var body: some View {
        
        ZStack {
            
            //Background
            Image("Image")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            //Content
    
            
            ScrollView {
                ZStack(alignment: .top) {
                    
                    //White pofile card
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.white.opacity(0.82))
                        .padding(.top, 150)
                    

                    
                    VStack(spacing: 14) {
                        Text("🎓")
                            .font(.system(
                                size: 80
                            ))
                        
                        //title
                        Text("Student Profile")
                            .font(.system(
                                size: 34,
                                weight: .bold,
                                design: .rounded
                            ))
                            .foregroundColor(
                                Color(
                                    red: 0.02,
                                    green: 0.10,
                                    blue: 0.40
                                )
                            )
                        //Information
                        //name
                        InfoRow(
                            icon: "person.fill",
                            title: "Name",
                            value: name
                        )
                        //ID
                        InfoRow(
                            icon: "person.text.rectangle.fill",
                            title: "Student ID",
                            value: ID
                        )
                        //Age
                        InfoRow(
                            icon: "calendar",
                            title: "Age",
                            value: "\(Age)"
                        )
                        //GPA
                        InfoRow(
                            icon: "chart.bar.fill",
                            title: "GPA",
                            value: "\(GPA)"
                        )
                        //Student
                        InfoRow(
                            icon: "checkmark.square",
                            title: "Student",
                            value: isStudent,
                            isGreen: true
                        )
                    }
                    .padding(.horizontal, 38)
                    .padding(.top, 50)
                    .padding(.bottom, 50)
                }
                .padding(.horizontal, 25)
                .padding(.top, 30)
            }
        }
    }
}

struct InfoRow: View {
    
    let icon: String
    let title: String
    let value: String
    var isGreen: Bool = false
    
    var body: some View {
        HStack(spacing: 15) {
            
            ZStack {
                
                Circle()
                    .fill(
                        isGreen
                        ? Color.green.opacity(0.12)
                        : Color.blue.opacity(0.10)
                    )
                    .frame(width: 42, height: 42)
                Image(systemName: icon)
                    .font(.system(
                        size: 21,
                        weight: .semibold
                    ))
                    .foregroundColor(
                        isGreen ? .green : .blue
                    )
            }
            
            Text(title)
                .font(.system(
                    size: 19,
                    weight: .medium,
                    design: .rounded
                ))
            
            Spacer()
            
            Text(value)
                .font(.system(
                    size: 19,
                    weight: .medium,
                    design: .rounded
                ))
                .foregroundColor(
                    isGreen ? .green : .primary
                )
        }
        .padding(.horizontal, 12)
        .frame(height: 58)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.white.opacity(0.60))
        )
    }
}
#Preview {
        ContentView()
}


