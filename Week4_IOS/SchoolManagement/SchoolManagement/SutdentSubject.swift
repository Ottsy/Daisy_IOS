//
//  SutdentSubject.swift
//  SchoolManagement
//
//  Created by Daisy on 12/10/26.
//

import Foundation

class StudentSubjects {
    //Properties
    private var studentId: String
    private var courseId: String
    private var year: Int
    private var mark: Double
    
    //Constructors
    init() {
        self.studentId = ""
        self.courseId = ""
        self.year = 0
        self.mark = 0.0
    }
    init(studentId: String) {
        self.studentId = studentId
        self.courseId = ""
        self.year = 0
        self.mark = 0.0
    }
    init(studentId: String, courseId: String) {
        self.courseId = courseId
        self.studentId = studentId
        self.year = 0
        self.mark = 0.0
    }
    init(studentId: String, courseId: String, year: Int, mark: Double) {
        self.studentId = studentId
        self.courseId = courseId
        self.year = year
        self.mark = mark
    }
    
    //Getters
    func getStudentId() -> String {
        return studentId
    }
    func getCourseId() -> String {
        return courseId
    }
    func getYear() -> Int {
        return year
    }
    func getMark() -> Double {
        return mark
    }
    
    //Setters
    func setStudentId(_ newId: String) {
        studentId = newId
    }
    func setCourseId(_ newId: String) {
        courseId = newId
    }
    func setYear(_ newYear: Int) {
        year = newYear
    }
    func setMark(_ newMark: Double) {
        mark = newMark
    }
    
    //Display
    func displayInfo() {
        print("Student: \(studentId), Course: \(courseId), Year: \(year), Mark: \(mark)")
    }
}



