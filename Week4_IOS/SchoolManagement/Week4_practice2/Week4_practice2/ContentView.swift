//
//  ContentView.swift
//  SchoolManagement
//
//  Created by Daisy on 12/10/26.
//

import SwiftUI

struct ContentView: View {
    // Exact Exercise 1 Seed Data
    @State private var subjects: [Subject] = [
        Subject(id: "CSE101", name: "iOS Programming", credits: 3, semester: 1),
        Subject(id: "CSE202", name: "Data Structures", credits: 4, semester: 2),
        Subject(id: "CSE204", name: "Remote Sensing", credits: 4, semester: 5)
    ]
    
    @State private var teachers: [Teacher] = []
    
    @State private var students: [Student] = [
        Student(id: "SV001", name: "Le Hoai Minh", year: 1, gpa: 8.5),
        Student(id: "SV002", name: "Le Van Ly", year: 2, gpa: 7.2),
        Student(id: "SV003", name: "Nguyen Luong Quang", year: 3, gpa: 8.8)
    ]
    
    @State private var studentSubjectsList: [StudentSubjects] = []
    
    // UI Form State
    @State private var selectedStudent: Student?
    @State private var selectedCourse: Subject?
    @State private var assignYear = "2026"
    @State private var initialMark = "0.0"
    
    @State private var selectedRecordToUpdate: StudentSubjects?
    @State private var updateMarkInput = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // MARK: - SECTION 1: ASSIGN SUBJECT TO STUDENT
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Assign Course to Student")
                            .font(.headline)
                            .foregroundColor(.purple)
                        
                        Picker("Select Student", selection: $selectedStudent) {
                            Text("-- Select Student --").tag(Student?.none)
                            ForEach(students) { st in
                                Text("\(st.getName()) (\(st.getId()))").tag(Student?.some(st))
                            }
                        }
                        .pickerStyle(.menu)
                        
                        Picker("Select Subject", selection: $selectedCourse) {
                            Text("-- Select Subject --").tag(Subject?.none)
                            ForEach(subjects) { sub in
                                Text("\(sub.getName()) (\(sub.getId()))").tag(Subject?.some(sub))
                            }
                        }
                        .pickerStyle(.menu)
                        
                        HStack {
                            TextField("Academic Year", text: $assignYear)
                                .textFieldStyle(.roundedBorder)
                            TextField("Initial Mark", text: $initialMark)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.decimalPad)
                        }
                        
                        Button("Assign Course") {
                            if let st = selectedStudent, let sub = selectedCourse {
                                let yr = Int(assignYear) ?? 2026
                                let mk = Double(initialMark) ?? 0.0
                                let record = StudentSubjects(student: st, course: sub, year: yr, mark: mk)
                                studentSubjectsList.append(record)
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.purple)
                    }
                    .padding()
                    .background(Color.purple.opacity(0.05))
                    .cornerRadius(12)
                    
                    // MARK: - SECTION 2: UPDATE MARKS
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Update Student Grades")
                            .font(.headline)
                        
                        ForEach(studentSubjectsList) { mRecord in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Student: \(mRecord.getStudent().getName())")
                                        .font(.subheadline).bold()
                                    Text("Course: \(mRecord.getCourse().getName()) (\(mRecord.getYear()))")
                                        .font(.caption).foregroundColor(.secondary)
                                }
                                Spacer()
                                Text("Mark: \(mRecord.getMark(), specifier: "%.1f")")
                                    .bold()
                                    .foregroundColor(mRecord.isPassed() ? .green : .red)
                                
                                Button("Edit") {
                                    selectedRecordToUpdate = mRecord
                                    updateMarkInput = String(mRecord.getMark())
                                }
                                .buttonStyle(.bordered)
                            }
                            Divider()
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.08))
                    .cornerRadius(12)
                    
                    // MARK: - SECTION 3: STATISTICS (REQ A & B)
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Statistics & Reports")
                            .font(.title3).bold()
                        
                        // a) Students with GPA > 8.0
                        VStack(alignment: .leading, spacing: 6) {
                            Text("a) Students with GPA > 8.0:")
                                .font(.headline).foregroundColor(.blue)
                            
                            let highGPA = students.filter { $0.getGPA() > 8.0 }
                            if highGPA.isEmpty {
                                Text("None").font(.caption).foregroundColor(.gray)
                            } else {
                                ForEach(highGPA) { st in
                                    Text("• \(st.getName()) (\(st.getId())) - GPA: \(st.getGPA(), specifier: "%.1f")")
                                        .font(.subheadline)
                                }
                            }
                        }
                        
                        Divider()
                        
                        // b) Failed Students in Each Subject
                        VStack(alignment: .leading, spacing: 6) {
                            Text("b) Failed Students in Each Subject:")
                                .font(.headline).foregroundColor(.red)
                            
                            ForEach(subjects) { sub in
                                let failedRecords = studentSubjectsList.filter { $0.getCourse().getId() == sub.getId() && !$0.isPassed() }
                                
                                Text("Subject: \(sub.getName()) [\(sub.getId())]")
                                    .font(.subheadline).bold()
                                
                                if failedRecords.isEmpty {
                                    Text("   No failed students")
                                        .font(.caption).foregroundColor(.gray)
                                } else {
                                    ForEach(failedRecords) { rec in
                                        Text("   • \(rec.getStudent().getName()) (\(rec.getStudentId())) - Mark: \(rec.getMark(), specifier: "%.1f")")
                                            .font(.caption)
                                            .foregroundColor(.red)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.blue.opacity(0.05))
                    .cornerRadius(12)
                }
                .padding()
            }
            .navigationTitle("School Management")
            .onAppear {
                if teachers.isEmpty {
                    let t1 = Teacher(id: "T001", name: "Tung Phan", subjects: [subjects[0], subjects[1]], department: "IT")
                    let t2 = Teacher(id: "T002", name: "Le Que", subjects: [subjects[2]], department: "Physics")
                    teachers = [t1, t2]
                }
                
                if studentSubjectsList.isEmpty {
                    let m1 = StudentSubjects(student: students[0], course: subjects[0], year: 2026, mark: 8.4)
                    let m2 = StudentSubjects(student: students[1], course: subjects[0], year: 2026, mark: 4.0) // Failed
                    let m3 = StudentSubjects(student: students[2], course: subjects[2], year: 2026, mark: 3.5) // Failed
                    studentSubjectsList = [m1, m2, m3]
                }
            }
            .sheet(item: $selectedRecordToUpdate) { record in
                VStack(spacing: 20) {
                    Text("Update Mark for \(record.getStudent().getName())")
                        .font(.headline)
                    
                    TextField("Enter new mark", text: $updateMarkInput)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                        .padding()
                    
                    Button("Save Grade") {
                        if let newMark = Double(updateMarkInput) {
                            record.setMark(newMark)
                        }
                        selectedRecordToUpdate = nil
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .presentationDetents([.height(220)])
            }
        }
    }
}

#Preview {
    ContentView()
}
