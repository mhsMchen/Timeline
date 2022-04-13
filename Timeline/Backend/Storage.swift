import Foundation
import SwiftUI

//Class to store info when app not is closed
class clubstore: ObservableObject {
    @Published var clubs: [clubFoundation] = []
    
    //Create the URL
    private static func fileURL() throws -> URL {
        //Retrieve the data file on the user's device, does not create the file if it doesn't exist
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("clubs.data")
    }
    
    //Static function to load the data
    static func load(completion: @escaping (Result<[clubFoundation], Error>)->Void) {
        //DispatchQueue to move all within it to run in the background
        DispatchQueue.global(qos: .background).async {
            //Handles errors
            do {
                //File handler to access clubs.data
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                //Decodes and returns all club data in file
                let clubFoundations = try JSONDecoder().decode([clubFoundation].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(clubFoundations))
                }
            //Catch errors
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    
    //Save function to save data to file
    static func save(clubs: [clubFoundation], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                //Encode data
                let data = try JSONEncoder().encode(clubs)
                //Create file URL
                let outfile = try fileURL()
                //Write to file
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(clubs.count))
                }
            //Catch errors
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
