import Foundation

//Foundation structure allows the data to be created and stored in mutable variables
struct clubFoundation: Identifiable, Codable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var roomNum: String
    var Supervisor: String
    var theme: Theme

    //Initiate each item
    init(id: UUID = UUID(), title: String, attendees: [String], roomNum: String, Supervisor: String, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.roomNum = roomNum
        self.Supervisor = Supervisor
        self.theme = theme
    }
}

//Label each attendee with a id and name
extension clubFoundation {
    struct Attendee: Identifiable, Codable {
        let id: UUID
        var name: String
        
        //Initiate
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    //Create each var as the data being stored
    struct Data {
        var title: String = ""
        var attendees: [Attendee] = []
        var roomNum: String = ""
        var Supervisor: String = ""
        var theme: Theme = .seafoam
    }
    
    //Make var data access Data structure
    var data: Data {
        Data(title: title, attendees: attendees, roomNum: roomNum, Supervisor: Supervisor, theme: theme)
    }
    
    //Make data mutable and update it to be the new data created
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        roomNum = data.roomNum
        Supervisor = data.Supervisor
        theme = data.theme
    }
    
    //Initate new data
    init(data: Data) {
        id = UUID()
        title = data.title
        attendees = data.attendees
        roomNum = data.roomNum
        Supervisor = data.Supervisor
        theme = data.theme
    }
}
