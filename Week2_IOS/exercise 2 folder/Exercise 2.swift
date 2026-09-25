//
//  SwiftUIView.swift
//  Week2_IOS
//
//  Created by Daisy on 25/9/26.
//



import SwiftUI
import Foundation

//student
struct Student: Identifiable {
    let id = UUID()
    var name: String
    var gpa: Double
}


struct Exercise2: View {
    @State private var students: [Student] = [
        Student(name: "Daisy", gpa: 3.8),
        Student(name: "Stella", gpa: 3.2),
        Student(name: "Lucy", gpa: 2.9),
        Student(name: "Louise", gpa: 3.9),
        Student(name: "Jelly", gpa: 3.5)
    ]
    
    @State private var searchText: String = ""
    @State private var isShowingAddView: Bool = false

    // Search
    var filteredStudents: [Student] {
        if searchText.isEmpty {
            return students
        } else {
            return students.filter { student in
                student.name.localizedCaseInsensitiveContains(searchText) ||
                String(format: "%.1f", student.gpa).contains(searchText)
            }
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                
                Text("Students")
                    .font(.largeTitle)
                    .bold()
                // Header Icon & Titles
                Image(systemName: "person.3.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                
                Text("Student Manager")
                    .font(.title2)
                    .bold()
                
                Text("A better class, a brighter tomorrow")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                // Student List
                List(filteredStudents) { student in
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .font(.title2)
                            .foregroundColor(.gray)
                        
                        Text(student.name)
                            .font(.headline)
                        
                        Spacer()
                        
                        // GPA Status Badge
                        Text("GPA: \(student.gpa, specifier: "%.1f")")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(student.gpa >= 3.0 ? .green : .orange)
                    }
                }
                
                //  Button
                Button(action: {
                    isShowingAddView = true
                }) {
                    HStack {
                        Image(systemName: "plus")
                        Text("Add Student")
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal)
                
                // Total Count
                Text("Total students: \(students.count)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .bold()
            }
            .navigationTitle("")
            .padding(.top)
            .searchable(text: $searchText, prompt: "Search by name or GPA")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: StudentStatisticsView(students: students)) {
                        Image(systemName: "chart.bar.fill")
                    }
                }
            }
            .sheet(isPresented: $isShowingAddView) {
                AddStudentSheet(students: $students, isPresented: $isShowingAddView)
            }
        }
    }
}

// Add Student
struct AddStudentSheet: View {
    @Binding var students: [Student]
    @Binding var isPresented: Bool
    
    @State private var name: String = ""
    @State private var gpa: Double = 3.0

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Student Information")) {
                    TextField("Full Name ", text: $name)
                    
                    VStack(alignment: .leading) {
                        Text("GPA: \(gpa, specifier: "%.1f")")
                        Slider(value: $gpa, in: 0.0...4.0, step: 0.1)
                    }
                }
            }
            .navigationTitle("Add Student")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newStudent = Student(
                            name: name.isEmpty ? "New Student" : name,
                            gpa: gpa
                        )
                        students.append(newStudent)
                        isPresented = false
                    }
                }
            }
        }
    }
}

// Statistics View
struct StudentStatisticsView: View {
    let students: [Student]
    
    var averageGPA: Double {
        guard !students.isEmpty else { return 0.0 }
        let total = students.reduce(0) { $0 + $1.gpa }
        return total / Double(students.count)
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Statistics")
                .font(.largeTitle)
                .bold()
            Image(systemName: "chart.bar.fill")
                .font(.system(size: 60))
                .foregroundColor(.purple)
                .padding(.top, 10)
            
            // Total Stats Card
            HStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Total Students")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("\(students.count)")
                        .font(.system(size: 28, weight: .bold))
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Average GPA")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("\(averageGPA, specifier: "%.2f")")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.purple)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.purple.opacity(0.1))
            .cornerRadius(14)
            .padding(.horizontal)
            
            // Student Breakdown List
            List(students) { student in
                HStack {
                    Image(systemName: "person.crop.circle")
                    
                    Text(student.name)
                        .font(.headline)
                    
                    Spacer()
                    
                    Text("GPA: \(student.gpa, specifier: "%.1f")")
                        .bold()
                        .foregroundColor(student.gpa >= 3.0 ? .green : .orange)
                }
            }
        }
        .navigationTitle("")
    }
}


#Preview {
    Exercise2()
}
