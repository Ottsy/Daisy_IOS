#include <iostream>
#include <string>
using namespace std;

struct Student {
    string id;
    string name;
    double gpa;

};

int main() {
    Student students[100];
    int n=0;
    int choice;

    while (true) {
        cout << "\n=== Student Management ===\n";
        cout << "1. Add student\n";
        cout << "2. Show all students\n";
        cout << "3. Remove a student by ID\n";
        cout << "4. Update a student's GPA\n";
        cout << "5. Find student with highest GPA\n";
        cout << "6. Exit\n";
        cin >> choice;

        if (choice == 1) {
            if (n >=100) {
                cout << "List is fill! Can not add more students.\n";
            } else {
                string id, name;
                double gpa;

                cout << "Enter id: ";
                cin >> id;

                cout << "Enter name: ";
                cin >> ws;
                getline(cin, name);

                cout << "Enter GPA: ";
                cin >> gpa;

                //Save all fields into array
                students[n].id = id;
                students[n].name = name;
                students[n].gpa = gpa;
                n = n + 1;

                cout << "Student addded!\n";
            }
        }
        else if (choice == 2 ) {
            //display all students
            if (n == 0) {
                cout << "No students in the list.\n";
            
            } else {
                cout << "\n--- Student List ---\n";
                for (int i =0; i < n; i++) {
                    cout << i+1<< ". ID: " << students[i].id
                         << " | Name: " << students[i].name
                         << " | GPA: " << students[i].gpa << "\n"; 
                }
            }
        }
        else if (choice == 3) {
            //remove a student by ID
            if (n==0) {
                cout << "No students to remove.\n";
            } else {
                string searchId;
                cout << "Enter student ID to remove: ";
                cin >> searchId;

                int foundIndex = -1;
                for (int i=0; i<n; i++) {
                    if (students[i].id == searchId) {
                        foundIndex = i;
                        break;
                    }
                }
                if (foundIndex != -1) {
                    for (int i = foundIndex; i < n - 1; i++) {
                        students[i] = students[i + 1];
                    }
                    n--;
                    cout << "Student removed successfully!\n";
                } else {
                    cout << "Student ID not found.\n";
                }
            }
        }
        else if (choice == 5) {
            // Optional: Find student with highest GPA
            if (n == 0) {
                cout << "No students in the list.\n";
            } else {
                int topIndex = 0;
                for (int i = 1; i < n; i++) {
                    if (students[i].gpa > students[topIndex].gpa) {
                        topIndex = i;
                    }
                }
                cout << "\nHighest GPA Student:\n";
                cout << "ID: " << students[topIndex].id 
                     << " | Name: " << students[topIndex].name 
                     << " | GPA: " << students[topIndex].gpa << "\n";
            }
        } 
        else if (choice == 6) {
            cout << "Exiting program. Goodbye!\n";
            break;
        } 
        else {
            cout << "Invalid choice! Please try again.\n";
        }
    }

    return 0;

}
