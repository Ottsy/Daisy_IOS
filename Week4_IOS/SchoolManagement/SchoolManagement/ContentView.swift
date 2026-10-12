//
//  ContentView.swift
//  SchoolManagement
//
//  Created by Daisy on 12/10/26.
//

//DATA MODELS
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("School Management System (2026–2027)")
                .font(.title2).bold()
            
        }
        .onAppear {
            // Create subjects
            let s1 = Subject(id: "CSE101", name: "iOS Programming", credits: 3, semester: 1)
            let s2 = Subject(id: "CSE202", name: "Data Structures", credits: 4, semester: 2)
            let s3 = Subject(id: "CSE204", name: "Remote Sensing", credits: 4, semester: 5)
            
            // Create teachers
            let t1 = Teacher(id: "T001", name: "Tung Phan", subjects: [s1, s2], department: "IT")
            let t2 = Teacher(id: "T002", name: "Le Que", subjects: [s3], department: "Physics")
            
            // Create students
            let st1 = Student(id: "SV001", name: "Le Minh", year: 1, gpa: 3.2)
            let st2 = Student(id: "SV002", name: "Nguyen Minh", year: 2, gpa: 3.9)
            let st3 = Student(id: "SV003", name: "Nguyen Quang", year: 3, gpa: 3.5)
            
            // Assign Marks
            let m1 = StudentSubjects(studentId: "SV001", courseId: "CSE101", year: 2026, mark: 8.4)
            let m2 = StudentSubjects(studentId: "SV002", courseId: "CSE202", year: 2026, mark: 9.4)
            let m3 = StudentSubjects(studentId: "SV003", courseId: "CSE204", year: 2026, mark: 7.4)
            
            // Display info to console
            
            print("=== Teachers ===")
            t1.displayInfo()
            t2.displayInfo()
            
            print("\n === Students ===")
            st1.displayInfo()
            st2.displayInfo()
            st3.displayInfo()
            
            print("\n === Student Subjects ===")
            m1.displayInfo()
            m2.displayInfo( )
            m3.displayInfo( )
        }
    }
}
