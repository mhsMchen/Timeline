import SwiftUI

struct DetailView: View {
    //Initiates and declares variables
    @Binding var club: clubFoundation
    @State private var data = clubFoundation.Data()
    @State private var isPresentingEditView = false
    
    //UI display changes here
    var body: some View {
        List {
            //Image control
            VStack(alignment: .leading) {
                Image("Cat\(arc4random_uniform(1) + 1)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            //Display club info
            Section(header: Text("Club Info")) {
                NavigationLink(destination: MeetingView(club: $club)) {
                    Label("Event Calendar", systemImage: "calendar")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                //Display home room
                HStack {
                    Label("Home Room", systemImage: "house")
                    Spacer()
                    Text("Room \(club.roomNum)")
                }
                .accessibilityElement(children: .combine)
                
                //Display supervisor
                HStack {
                    Label("Supervisor", systemImage: "person")
                    Spacer()
                    Text("\(club.Supervisor)")
                }
                .accessibilityElement(children: .combine)
                
                //Display theme info and colour
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(club.theme.name)
                        .padding(4)
                        .foregroundColor(club.theme.accentColor)
                        .background(club.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            //Displays members
            Section(header: Text("Members")) {
                ForEach(club.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
            //Display event history
            Section(header: Text("Event History")) {
                if club.history.isEmpty {
                    Label("No events yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(club.history) { history in
                    HStack {
                        Image(systemName: "calendar")
                        Text(history.date, style: .date)
                    }
                }
            }
        }
        
        //Top bar shows leave to clubsView or edit current club
        .navigationTitle(club.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = club.data
            }
        }
        //Options to complete or cancel club data change
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(club.title)
                    .toolbar {
                        //Doesn't save data and exits edit
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        //Calls on foundation files to edit mutable club data and change aspects
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                club.update(from: data)
                            }
                        }
                    }
                }
            }
        }
    }
