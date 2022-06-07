import SwiftUI

/* Displays club information + visuals

throws: List method within body var, to display rows of different info (info being seperated by hstack, vstack, etc)
 
parameters: View
returns: ---- */

struct DetailView: View {
    //Initiates and declares variables
    @Binding var club: clubFoundation
    @State private var data = clubFoundation.Data()
    @State private var isPresentingEditView = false
    @State private var image = UIImage()
    @State private var showSheet = false
    
    //UI display changes here
    /*
     body
        list
            place Image of cat with leading alignment
            allow image to be rsizable
            define aspect ratio
            
            inside header enter text "Club Info
            create label "Event Calendar" with the Image "calendar"
            make font headline
            make foreground color accent color
     
            HStack label
            "Home Room" with image "house"
            add space
            write "room (room number)"
     
            HStack label
            "supervisor" with image "person
            add space
            write "room (room number)"
     
            HStack label
            "Theme" with image "paintpalette"
            add space
            write "(club theme name)"
            with padding (4)
            forgroundColor(club theme accent color)
            background (club theme main color)
            make corner radius 4
        
        create section header with "members" written
            for each attendee label attendee with attendee.name
     */
    var body: some View {
        List {
            //Image control
            VStack {
                    Image(uiImage: self.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .background(Color.black.opacity(0.2)).cornerRadius(10)

                 Text("Change photo")
                     .font(.headline)
                     .frame(maxWidth: .infinity)
                     .cornerRadius(16)
                     .foregroundColor(.blue)
                         .padding(.horizontal, 20)
                         .onTapGesture {
                           showSheet = true
                         }
                    }
                .padding(.horizontal, 20)
                .padding(.vertical,20)
                .sheet(isPresented: $showSheet) {
                            // Pick an image from the photo library:
                        ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                    }
            //Display club info
            Section(header: Text("Club Info")) {
                NavigationLink(destination: MeetingView()) {
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
                
                //Display classroom code
                HStack {
                    Label("Classroom Code", systemImage: "link")
                    Spacer()
                    Text("\(club.ClassroomCode)")
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
                
                //Display description
                VStack {
                    Label("Club Description", systemImage: "newspaper")
                    Spacer()
                    Text("\(club.clubDescription)")
                       
                }
                .accessibilityElement(children: .combine)
            }
            //Displays members
            Section(header: Text("Members")) {
                ForEach(club.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
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
