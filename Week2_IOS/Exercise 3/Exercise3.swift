//
//  Exercise3.swift
//  Week2_IOS
//
//  Created by Daisy on 25/9/26.
//

import SwiftUI


struct StudentModel: Identifiable {
    let id = UUID()
    var studentID: String
    var name: String
    var gpa: Double
}

struct Exercise3: View {
    // Array
    @State private var students: [StudentModel] = [
        StudentModel(studentID: "S001", name: "Daisy", gpa: 8.5),
        StudentModel(studentID: "S002", name: "Stella", gpa: 7.8),
        StudentModel(studentID: "S003", name: "Lucy", gpa: 9.2)
    ]
    
    // Inputs for adding a student
    @State private var inputID: String = ""
    @State private var inputName: String = ""
    @State private var inputGPA: String = ""
    
    // Search input
    @State private var searchID: String = ""
    
    // Filter toggle
    @State private var showHighGPAOnly: Bool = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                
                //  Add New Student
                VStack(spacing: 8) {
                    Text("Add New Student")
                        .font(.headline)
                        .italic()
                        
                    
                    TextField("Enter ID (e.g. S004)", text: $inputID)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Enter Name (e.g. David)", text: $inputName)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Enter GPA (e.g. 8.0)", text: $inputGPA)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                    
                    Button("Add Student") {
                        if !inputID.isEmpty && !inputName.isEmpty && !inputGPA.isEmpty {
                            let gpaValue = Double(inputGPA) ?? 0.0
                            let newStudent = StudentModel(studentID: inputID, name: inputName, gpa: gpaValue)
                            students.append(newStudent)
                            
                            // Clear inputs
                            inputID = ""
                            inputName = ""
                            inputGPA = ""
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)

                // Search & Filter Controls
                VStack(spacing: 20) {
                    TextField("Search by ID...", text: $searchID)
                        .textFieldStyle(.roundedBorder)
                    
                    Toggle("Show GPA >= 8.0 only", isOn: $showHighGPAOnly)
                }
                .padding(.horizontal)

                // Student List
                List {
                    ForEach(students) { student in
                        // Filter search ID check & GPA >= 8.0
                        if (searchID.isEmpty || student.studentID.localizedCaseInsensitiveContains(searchID)) &&
                            (!showHighGPAOnly || student.gpa >= 8.0) {
                            
                            HStack {
                                Text("\(student.studentID) - \(student.name)")
                                    .font(.body)
                                Spacer()
                                Text("GPA: \(student.gpa, specifier: "%.1f")")
                                    .bold()
                            }
                        }
                    }
                    .onDelete { indexSet in
                        students.remove(atOffsets: indexSet)
                    }
                }

                // --- Section 4: Simple Statistics ---
                HStack {
                    Text("Total: \(students.count)")
                    Spacer()
                    Text("Top GPA: \(getHighestGPA(), specifier: "%.1f")")
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.horizontal)
            }
            .navigationTitle("Class Management")
        }
    }

    //  the highest GPA
    func getHighestGPA() -> Double {
        var highest = 0.0
        for student in students {
            if student.gpa > highest {
                highest = student.gpa
            }
        }
        return highest
    }
}

#Preview {
    Exercise3()
}
