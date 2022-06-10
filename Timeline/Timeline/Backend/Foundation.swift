import Foundation

/*
 Foundation structure allows the data to be created and stored in mutable variables
 */
struct clubFoundation: Identifiable, Codable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var roomNum: String
    var Supervisor: String
    var ClassroomCode: String
    var theme: Theme
    var clubDescription: String

    /*
     creates tags for List
     */
    init(id: UUID = UUID(), title: String, attendees: [String], roomNum: String, Supervisor: String, ClassroomCode: String, theme: Theme, clubDescription: String) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.roomNum = roomNum
        self.Supervisor = Supervisor
        self.ClassroomCode = ClassroomCode
        self.theme = theme
        self.clubDescription = clubDescription
    }
}

/*
Label each attendee with an identifier and name
 */
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
    
    /*
     Creates each variable for the data to be stored in
     */
    struct Data {
        var title: String = ""
        var attendees: [Attendee] = []
        var roomNum: String = ""
        var Supervisor: String = ""
        var ClassroomCode: String = ""
        var theme: Theme = .seafoam
        var clubDescription: String = ""
    }
    
    /*
     this code allows the Variable Data to access stored data
     */
    var data: Data {
        Data(title: title, attendees: attendees, roomNum: roomNum, Supervisor: Supervisor, ClassroomCode: ClassroomCode, theme: theme, clubDescription: clubDescription)
    }
    
    /*allows data to be updated and chaged as needed
     the update function takes the newly entered data and replaces it in the old list of Data
     */
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        roomNum = data.roomNum
        Supervisor = data.Supervisor
        ClassroomCode = data.ClassroomCode
        theme = data.theme
        clubDescription = data.clubDescription
    }
    
    /*
     Creates a new data set
     */
    init(data: Data) {
        id = UUID()
        title = data.title
        attendees = data.attendees
        roomNum = data.roomNum
        Supervisor = data.Supervisor
        ClassroomCode = data.ClassroomCode
        theme = data.theme
        clubDescription = data.clubDescription
    }
}
