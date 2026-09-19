//
//  ContentView.swift
//  Week1_daisy
//
//  Created by MAY 04 on 18/9/26.
//

import SwiftUI

struct ContentView: View {
    let studentName: String = "DAISY"
    let studentID: String = "SESEIU24017"
    let gpa: Double = 8.9
    let isActive: Bool = true
    
    var body: some View {
        ZStack {
            // Background Image
            Image("Image")
                .resizable()
                .ignoresSafeArea()
            
            // Outer Layout Container
            VStack {
                
                //  Top Decoration Area
                VStack(spacing: 8) {
                    Text("Petits pas, grands rêves")
                        .font(.system (
                            size: 28,
                            weight: .bold,
                            design: .rounded
                        ))
                        .foregroundColor(.white)
                        .padding(.top, 40)
                }
            
                
                //Rectangular Information Card
                HStack(spacing: 20) {
                    // Avatar Icon
                    ZStack {
                        Circle()
                            .fill(Color.green.opacity(0.4))
                            .frame(width: 60, height: 80)
                        
                        Image(systemName: "person.fill")
                            .font(.title2)
                            .foregroundColor(.green)
                    }
                    
                    // Info Details
                    VStack(alignment: .leading, spacing: 7) {
                        HStack {
                            Text(studentName)
                                .font(.headline)
                                .bold()
                            
                            Spacer()
                            
                            Text(isActive ? "Active" : "Inactive")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 3)
                                .background(Color.green.opacity(0.2))
                                .foregroundColor(.green)
                                .cornerRadius(9)
                        }
                        
                        Text("Student ID: \(studentID)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        HStack(spacing: 6) {
                            Image(systemName: "chart.bar.fill")
                                .foregroundColor(.green)
                            
                            Text("GPA: \(String(format: "%.1f", gpa))")
                                .font(.subheadline)
                                .bold()
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .padding(.horizontal, 24)
                .padding(.bottom, 30) // Adds space from the very bottom of the screen
            }
        }
    }
}

#Preview {
    ContentView()
}
