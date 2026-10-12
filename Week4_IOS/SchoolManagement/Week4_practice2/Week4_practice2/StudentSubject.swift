//
//  StudentSubject.swift
//  Week4_practice2
//
//  Created by Daisy on 12/10/26.
//

import Foundation

class StudentSubjects: Identifiable {
    //Properties
    let id = UUID()
    private var student: Student
    private var course: Subject
    private var year: Int
    private var mark: Double
    
    //Constructors
    init() {
        self.student = Student()
        self.course = Subject()
        self.year = 0
        self.mark = 0.0
    }
   /* init(student: Student) {
        self.student = Student()
        self.course = Subject()
        self.year = 0
        self.mark = 0.0
    }
    init(student: Student, course: Subject) {
        self.course = Subject()
        self.student = Student()
        self.year = 0
        self.mark = 0.0
    }*/
    init(student: Student, course: Subject, year: Int, mark: Double) {
        self.student = Student()
        self.course = Subject()
        self.year = year
        self.mark = mark
    }
    
    //Getters
    func getStudent() -> Student {
        return student
    }
    func getCourse() -> Subject {
        return course
    }
    func getStudentId() -> String {
        return student.getId()
    }
    func getYear() -> Int {
        return year
    }
    func getMark() -> Double {
        return mark
    }
    
    //Setters
    func setStudent(_ newStudent: Student) { self.student = newStudent }
    func setCourse(_ newCourse: Subject) { self.course = newCourse }
    func setYear(_ newYear: Int) { self.year = newYear }
    func setMark(_ newMark: Double) { self.mark = newMark }
    
    func isPassed() -> Bool { return mark >= 5.0 }
    
    //Display
    func displayInfo() {
            print("Student: \(student.getName()) (\(student.getId())), Course: \(course.getName()), Year: \(year), Mark: \(mark)")
        }
}




