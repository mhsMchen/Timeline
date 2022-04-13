import SwiftUI

//Gives functionalities to detailView
struct DetailEditView: View {
    @Binding var data: clubFoundation.Data
    @State private var newAttendeeName = ""
    
    //Similar to editClubView, edits club properties
    var body: some View {
        Form {
            //Displays textfields for user to enter new data, autofill with current data before so
            Section(header: Text("Club Info")) {
                TextField("Title", text: $data.title)
                TextField("Room Number", text: $data.roomNum)
                TextField("Supervisor", text: $data.Supervisor)
                ThemePicker(selection: $data.theme)
            }
            //Create a display for each member
            Section(header: Text("Members")) { //Prints current member data
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                //Remove member from database when deleted
                .onDelete { indices in
                    data.attendees.remove(atOffsets: indices)
                }
                //New textfield to add members
                HStack {
                    TextField("New Member", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = clubFoundation.Attendee(name: newAttendeeName)
                            data.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add Member")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}
