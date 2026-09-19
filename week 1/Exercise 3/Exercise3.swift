//
//  Exercise3.swift
//  Exercise1
//
//  Created by MAY 04 on 19/9/26.
//


import SwiftUI


struct Task: Identifiable {
    let id = UUID()
    let title: String
    let category: String
    let isCompleted: Bool
    let time: String
}

struct Exercise3: View {
    // 1. Static Task Data Array (No @State)
    let tasks: [Task] = [
        Task(title: "Read paper", category: "Study", isCompleted: true, time: "10:00"),
        Task(title: "Boxing & Badminton", category: "Health", isCompleted: true, time: "15:00"),
        Task(title: "Trading", category: "Work", isCompleted: false, time: "21:00"),
        Task(title: "Sleeping", category: "Health", isCompleted: false, time: "23:00")
    ]
    
    // Static Constants
    let userName = "Daisy"
    let todayDate = "Sun, 20 Sep 2026"
    let quote = " Bon Journee "

    var body: some View {
        ZStack {
            // Background Image
            Image("Image")
                .resizable()
                .ignoresSafeArea()

            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 16) {

                        //  Header (ZStack)
                        ZStack(alignment: .topLeading) {
                            LinearGradient(
                                colors: [.teal.opacity(0.5), .purple.opacity(0.7)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            .frame(height: 150)
                            .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: 24, bottomTrailingRadius: 24))
                            .ignoresSafeArea(edges: .top)

                            VStack(alignment: .leading, spacing: 8) {
                                Text("Bonjour, \(userName)")
                                    .font(.title2)
                                    .italic()
                                    .bold()
                                    .foregroundColor(.white)

                                Text(todayDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.8))

                                Text(quote)
                                    .font(.subheadline)
                                    .italic()
                                    .foregroundColor(.yellow)
                                    .padding(.top, 4)
                            }
                            .padding(.horizontal)
                            .padding(.top, 10)
                        }

                        //  Section Header Label (HStack)
                        HStack {
                            Text("My Tasks")
                                .foregroundStyle(.white)
                                .font(.title3)
                                .bold()

                            Spacer()

                            // Static Display Badge (Non-clickable)
                            HStack(spacing: 4) {
                                Image(systemName: "plus.circle.fill")
                                Text("Add Task")
                            }
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.teal)
                        }
                        .padding(.horizontal)

                        // Task List Rows (ForEach + HStack)
                        VStack(spacing: 10) {
                            ForEach(tasks) { task in
                                HStack(spacing: 12) {
                                    // Static Checkbox Icon
                                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                        .font(.title2)
                                        .foregroundColor(task.isCompleted ? .green : .gray)

                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(task.title)
                                            .font(.body)
                                            .strikethrough(task.isCompleted, color: .gray)
                                            .foregroundColor(task.isCompleted ? .gray : .primary)

                                        Text(task.category)
                                            .font(.caption2)
                                            .padding(.horizontal, 6)
                                            .padding(.vertical, 2)
                                            .background(categoryColor(task.category).opacity(0.2))
                                            .foregroundColor(categoryColor(task.category))
                                            .cornerRadius(4)
                                    }

                                    Spacer()

                                    Text(task.time)
                                        .font(.caption)
                                        .bold()
                                        .foregroundColor(.secondary)
                                }
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(12)
                            }
                        }
                        .padding(.horizontal)
                    }
                }

                // Bottom Navigation Bar (HStack)
                Divider()
                HStack {
                    Spacer()
                    TabItem(icon: "calendar", label: "Today", isActive: true)
                    Spacer()
                    TabItem(icon: "chart.bar.fill", label: "Stats", isActive: false)
                    Spacer()
                    TabItem(icon: "gearshape.fill", label: "Settings", isActive: false)
                    Spacer()
                }
                .padding(.top, 8)
                .background(Color.white.opacity(0.95))
            }
        }
    }

    //  category badge colors
    private func categoryColor(_ category: String) -> Color {
        switch category {
        case "Study": return .blue
        case "Health": return .pink
        case "Work": return .orange
        default: return .purple
        }
    }
}

//  Reusable Navigation Tab Item
struct TabItem: View {
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
    Exercise3()
}
