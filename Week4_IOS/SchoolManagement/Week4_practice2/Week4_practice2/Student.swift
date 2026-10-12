//
//  Student.swift
//  Week4_practice2
//
//  Created by Daisy on 12/10/26.
//

import Foundation
import SwiftUI

class Student: Identifiable, Hashable {

    //Properties
    let id: String
    private var name: String
    private var year: Int
    private var gpa: Double
    
    static func == (lhs: Student, rhs: Student) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
    
    //Constructors
    init() {
        self.id = "";
        self.name = "";
        self.year = 0;
        self.gpa = 0.0
    }
    
    init(id: String, name: String) {
        self.id = id;
        self.name = name;
        self.year = 0;
        self.gpa = 0.0
    }
    
    init(id: String, name: String, year: Int, gpa: Double) {
        self.id = id;
        self.name = name;
        self.year = 0;
        self.gpa = 0.0
    }
    
    //Getters
    func getId() -> String { return id }
    func getName() -> String { return name }
    func getYear() -> Int {return year}
    func getGPA() -> Double {return gpa}
    
    //Setter
    //func setId( _ newId: String) {id = newId}
    func setName(_ newName: String) {name = newName}
    func setYear( _ newYear: Int) {year = newYear }
    func setGPA( _ newGPA: Double) {gpa = newGPA}
    
    //Display information
    func displayInfo() {
        print("ID: \(id), Name: \(name), Year: \(year), GPA: \(gpa)")
    }
    
}

