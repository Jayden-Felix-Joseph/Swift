//
//  Data.swift
//  MasterMindGameTwo
//
//  Created by Jayden Felix-Joseph on 11/11/2025.
//

import UIKit
import Foundation

class GData{
    static let shared = GData()
    private init(){}
    
    var sequence: [String] = []
    var finishTime: String = ""
    var mathTime: TimeInterval?
    var gameWins: [GameWins] = []
    
    
    struct GameWins: Codable {
        let date: Date
        let duration: String
        let position: TimeInterval
    }
    func saveWins() {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        do{
            let data = try encoder.encode(gameWins)
            try data.write(to: fileURL)
            print(1)
        }catch{
            print(0)
            
        }
        
        
    }
    
    func displayWins (){
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        guard FileManager.default.fileExists(atPath: fileURL.path) else {return}
        
        do{
            let data = try Data(contentsOf: fileURL)
            gameWins = try decoder.decode([GameWins].self, from: data)
            print(1)
            
        }catch{
            print(0)
        }
        
    }
}

    

extension GData {
    var fileURL: URL {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documents.appendingPathComponent("GameWins.json")
    }
}
