//
//  ContentView.swift
//  Week2_IOS
//
//  Created by Daisy on 25/9/26.
//



import SwiftUI
import Foundation

// Computer Struct
struct Computer: Identifiable {
    let id = UUID()         // Unique ID
    var name: String        // e.g. PC01
    var location: String    // e.g. Lab A
    var isAvailable: Bool   // status in lab
}

//Add Com View
struct AddComputerView: View {
    @Binding var computers: [Computer]
    @Binding var isPresented: Bool
    
    @State private var name: String = ""
    @State private var location: String = "Lab A"
    @State private var isAvailable: Bool = true
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Computer Information")) {
                    TextField("Name (e.g., PC06", text: $name)
                    TextField("Location (e.g., Lab A)", text: $location)
                    Toggle("Is Available", isOn: $isAvailable)
                }
            }
            .navigationTitle("Add Computer")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newComputer = Computer(
                            name: name.isEmpty ? "PC0\(computers.count + 1)" : name,
                            location: location,
                            isAvailable: isAvailable
                        )
                        computers.append(newComputer)
                        isPresented = false
                    }
                    
                }
            }
        }
    }
}

// Main View (Home)
struct ContentView: View {
    @State private var computers: [Computer] = [
        Computer(name: "PC01", location: "Lab A", isAvailable: true),
        Computer(name: "PC02", location: "Lab A", isAvailable: true),
        Computer(name: "PC03", location: "Lab B", isAvailable: false),
        Computer(name: "PC04", location: "Lab B", isAvailable: true),
        Computer(name: "PC05", location: "Lab C", isAvailable: true)
    ]
    
    //State variable added to control the sheet
    @State private var isShowingAddView = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Header Icon & Titles
                Image(systemName: "desktopcomputer")
                    .font(.system(size: 60))
                    .foregroundColor(.blue)
                
                Text("Computer Lab")
                    .font(.system(size: 30, weight: .semibold))
                
                Text("Manage computers easily")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                // Computer List
                List(computers) { computer in
                    HStack {
                        Image(systemName: "desktopcomputer")
                            .foregroundColor(.gray)
                        
                        VStack(alignment: .leading) {
                            Text(computer.name)
                                .font(.headline)
                            Text(computer.location)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        // Status
                        HStack(spacing: 8) {
                            Circle()
                                .fill(computer.isAvailable ? Color.green : Color.red)
                                .frame(width: 10, height: 10)
                            
                            Text(computer.isAvailable ? "Available" : "In Use")
                                .font(.subheadline) // Fixed: Added missing dot '.'
                                .foregroundColor(computer.isAvailable ? .green : .red)
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                // Add Button (=true)
                Button(action: {
                    isShowingAddView = true

                }) {
                    HStack {
                        Image(systemName: "plus")
                        Text("Add Computer")
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal)
                
                // Total Count Display
                Text("Total computers: \(computers.count)")
                    .bold()
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .navigationTitle("")
            .padding(.top)
            
            //Add statistics buttion in navigation bar
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: StatisticsView(computers: computers), label: {
                        Image(systemName: "chart.bar.fill")})
                        
                    }
                }
            }
            
            //Added sheet modifier to display the add computer view
            .sheet(isPresented: $isShowingAddView) {
                AddComputerView(computers: $computers, isPresented: $isShowingAddView)
            
        }
    }
}

//Statistic
struct StatisticsView: View {
    let computers: [Computer]  //receive array of struct
    var totalCount: Int {
        computers.count
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 18) {
//                Image(systemName: "chartbar.fill")
//                    .font(.system(size: 60))
//                    .foregroundColor(.purple)
//                    .padding(.top, 10)
                
                Text("Statistics")
                    //.font(.largeTitle)
                    .font(.system(size: 40, weight: .bold))
                    .bold()
                    .padding(.top, 5)
                
                //Total count card
                HStack {
                    Image(systemName: "chartbar.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.orange)
                        .padding(.top, 10)
                }
                HStack(spacing: 16) {
                    Image(systemName: "desktopcomputer")
                        .font(.system(size: 28))
                        .foregroundColor(.blue)
                    VStack(alignment: .leading) {
                        Text("Total Computers")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("\(totalCount)")
                            .font(.system(size: 28, weight: .bold))
                        
                    }
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(14)
                
        //List of computers
                List(computers) { computer in
                    HStack {
                        Image(systemName: "desktopcomputer")
                        VStack(alignment: .leading) {
                            Text(computer.name)
                                .font(.headline)
                            Text(computer.location)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Circle()
                            .fill(computer.isAvailable ? Color.green : .red)
                            .frame(width: 10, height: 10)
                        Text(computer.isAvailable ? "Available" : "In Use")
                            .foregroundColor(computer.isAvailable ? .green : .red)
                    }
                    .navigationTitle("")
                    .navigationBarBackButtonHidden(false)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
