//
//  Teacher.swift
//  Week4_practice2
//
//  Created by Daisy on 12/10/26.
//

import Foundation

class Teacher: Identifiable {
    let id: String
    private var name: String
    private var subjects: [Subject]
    private var department: String
    
    init() {
        self.id = ""
        self.name = ""
        self.subjects = []
        self.department = ""
    }
    
    init(id: String, name: String, subjects: [Subject], department: String) {
        self.id = id
        self.name = name
        self.subjects = subjects
        self.department = department
    }
    
    // Getters & Setters
    func getId() -> String { return id }
    func getName() -> String { return name }
    func getSubjects() -> [Subject] { return subjects }
    func getDepartment() -> String { return department }
    
    func setName(_ newName: String) { self.name = newName }
    func setDepartment(_ newDepartment: String) { self.department = newDepartment }
    
    func addSubject(_ subject: Subject) { self.subjects.append(subject) }
    func removeSubject(id: String) { self.subjects.removeAll(where: { $0.getId() == id }) }
    func getTotalCredits() -> Int { subjects.reduce(0) { $0 + $1.getCredits() } }
    
    func displayInfo() {
        print("ID: \(id), Name: \(name), Department: \(department)")
    }
}
