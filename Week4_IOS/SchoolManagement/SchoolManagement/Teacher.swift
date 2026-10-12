//
//  Teacher.swift
//  SchoolManagement
//
//  Created by Daisy on 12/10/26.
//

import Foundation

class Teacher {
    //Properties
    private var id: String
    private var name: String
    private var subjects: [Subject]
    private var department: String
    
    //Constructors
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
    // Getters
    func getId() -> String { return id }
    func getName() -> String { return name }
    func getSubjects() -> [Subject] { return subjects }
    func getDepartment() -> String { return department }
    
    // Setters
    func setName(_ newName: String) { self.name = newName }
    func setDepartment(_ newDepartment: String) { self.department = newDepartment }

    //Display
    func displayInfo() {
        print("ID: \(id), Name: \(name), Department: \(department)")
    }
}
