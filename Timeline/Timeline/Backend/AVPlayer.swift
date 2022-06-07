/*
This File is used for playing sound effects in the resources folder
 */

import Foundation
import AVFoundation

//Music player extension
extension AVPlayer {
    static let sharedDingPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "Sound2", withExtension: "wav") else { fatalError("Failed to find sound file.") }
        return AVPlayer(url: url)
    }()
}

/*
 this Program: associates sharedDingPlayer with AVPlayer
 AVPlayer then pulls the url for the sound2 in resource folder
 other wise, if this doesn't happen it prints error "faled to find sound file."
 */
