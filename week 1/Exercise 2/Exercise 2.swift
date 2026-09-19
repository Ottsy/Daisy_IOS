//
//  Exercise 2.swift
//  Week1_daisy
//
//  Created by MAY 04 on 18/9/26.
//

import SwiftUI

struct Exercise2: View {
    // 1. Data Variables
    let studentName = "DAISY"
    let motto = "Toujours apprendre, toujours grandir "
    let studentID = "SESEIU24017"
    let age = 20
    let gpa = 8.9
    let isStudent = true
    let quote = "“ N'abandonne pas ”"

    var body: some View {
        ZStack {

            //Main Screen Layout
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 16) {

                        // HEADER (
                        ZStack(alignment: .bottom) {
                            // Header Banner Background
                            RoundedRectangle(cornerRadius: 20)
                                .fill(LinearGradient(colors: [.blue.opacity(0.3), .purple.opacity(0.3)], startPoint: .top, endPoint: .bottom))
                                .frame(height: 150)

                            // Avatar Overlapping Center
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 84, height: 84)

                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.indigo)
                            }
                            .offset(y: 35) // Shifts avatar downward to overlap banner
                        }
                        .padding(.bottom, 35) // Creates clearance for overlapping avatar

                        // Name & Subtitle
                        VStack(spacing: 4) {
                            Text(studentName)
                                .font(.system(size: 24.0, weight: .semibold, design: .serif))
                                .bold()

                            Text(motto)
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .italic()
                        }

                        // INFO CARDS GRID
                        VStack(spacing: 16) {
                            // Student ID & Age
                            HStack(spacing: 12) {
                                InfoTile(icon: "person.fill", title: "Student ID", value: studentID, color: .blue)
                                InfoTile(icon: "birthday.cake.fill", title: "Age", value: "\(age)", color: .pink)
                            }

                            // GPA & Student Status
                            HStack(spacing: 12) {
                                InfoTile(icon: "chart.bar.fill", title: "GPA", value: String(format: "%.1f", gpa), color: .green)
                                InfoTile(icon: "checkmark.square.fill", title: "Student", value: isStudent ? "true" : "false", color: .purple)
                            }
                        }
                        .padding(.horizontal)

                        // MOTTO CARD
                        HStack {
                            Text(quote)
                                .font(.subheadline)
                                .italic()
                                .foregroundColor(.orange)
                            Spacer()
                            Image(systemName: "leaf.fill")
                                .foregroundColor(.green)
                        }
                        .padding()
                        .background(Color.green.opacity(0.12))
                        .cornerRadius(12)
                        .padding(.horizontal)

                        // ROFILE BUTTON
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "paperplane.fill")
                                Text("Edit Profile")
                            }
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.teal)
                            .cornerRadius(25)
                        }
                        .padding(.horizontal)
                    }
                }

                // BOTTOM TAB BAR (HStack)
                Divider()
                HStack {
                    Spacer()
                    TabButton(icon: "house.fill", label: "Profile", isActive: true)
                    Spacer()
                    TabButton(icon: "book.closed.fill", label: "Subjects", isActive: false)
                    Spacer()
                    TabButton(icon: "gearshape.fill", label: "Settings", isActive: false)
                    Spacer()
                }
                .padding(.top, 8)
                .background(Color.white.opacity(0.9))
            }
        }
    }
}

// Reusable Card Block Component
struct InfoTile: View {
    let icon: String
    let title: String
    let value: String
    let color: Color

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(color)
                .frame(width: 38, height: 38)
                .background(color.opacity(0.15))
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(value)
                    .font(.callout)
                    .bold()
            }
            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.85))
        .cornerRadius(14)
    }
}

// Reusable Tab Component
struct TabButton: View {
    let icon: String
    let label: String
    let isActive: Bool

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
            Text(label)
                .font(.caption2)
        }
        .foregroundColor(isActive ? .teal : .gray)
    }
}

#Preview {
    Exercise2()
}
