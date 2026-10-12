//
//  Subject.swift
//  Week4_practice2
//
//  Created by Daisy on 12/10/26.
//

import Foundation

class Subject: Identifiable, Hashable {
    //Properties
    let id: String
    private var name: String
    private var credits: Int
    private var semester: Int
    
    static func == (lhs: Subject, rhs: Subject) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {hasher.combine(id)}
    
    //Constructors
    init() {
        self.id = "";
        self.name = "";
        self.credits = 0;
        self.semester = 0
    }
    
    init(id: String, name: String) {
        self.id = id;
        self.name = name;
        self.credits = 0;
        self.semester = 0
    }
    
    init(id: String, name: String, credits: Int, semester: Int) {
        self.id = id;
        self.name = name;
        self.credits = credits;
        self.semester = semester
    }
    
    //Getters
    func getId() -> String { return id }
    func getName() -> String { return name }
    func getCredits() -> Int {return credits}
    func getSemester() -> Int {return semester}
    
    //Setter
    //func setId( _ newId: String) {id = newId}
    func setName(_ newName: String) {name = newName}
    func setCredits( _ newCredit: Int) {credits = newCredit}
    func setSemester( _ newSemester: Int) {semester = newSemester}
    
    //Display information
    func displayInfo() {
        print("ID: \(id), Name: \(name), Credits: \(credits), Semester: \(semester)")
    }
    
}
