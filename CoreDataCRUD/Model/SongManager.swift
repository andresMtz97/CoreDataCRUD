//
//  SongManager.swift
//  CoreDataCRUD
//
//  Created by DISMOV on 26/04/24.
//

import Foundation
import CoreData

class SongManager {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    //Create a song
    func createSong(title : String, uuid : UUID, rating : Int16 ) -> Song?{
        
        let newSong = Song(context: context)
        newSong.title = title
        newSong.songId = UUID()
        newSong.rating = rating
        
        do{
            try context.save()
            return newSong
        }
        catch let error {
            print("Error: ", error)
            return nil
        }
    }
    
    //Read all Songs
    func getAllSongs() -> [Song]{
            if let songs = try? self.context.fetch(Song.fetchRequest()){
                return songs
            }
            else{
                return []
            }
    }
    
    // GetSongById
    //Return a song with the specified UUID
    func getSongByID(uuid : UUID) -> Song?{
        //let fetchRequest = NSFetchRequest<Song>(entityName: "Song")
        let fetchRequest = Song.fetchRequest()
        var predicate : NSPredicate?
        
        predicate = NSPredicate(format: "songID = %@", uuid as CVarArg)
        //Using Variable susbtitution
        predicate = NSPredicate(format: "%K == %@", "songID", uuid as CVarArg)
        //Using #KeyPath
        predicate = NSPredicate(format: "%K == %@", #keyPath(Song.songId), uuid as CVarArg)
        
        fetchRequest.predicate = predicate
        
        do{
            let song = try context.fetch(fetchRequest)
            return song.first
        }
        catch let error {
            print("Error: ", error)
            return nil
        }
    }
    
    
    //Update a song
    func updateSong(song : Song, rating : Int16) -> Song {
        song.rating = rating
        
        do{
            try context.save()
        }
        catch let error{
            print("Error: ", error)
        }
        return song
    }
    
    //Delete a song
    func deleteSong(song : Song) -> Bool{
        
        self.context.delete(song)
        
        do {
            try context.save()
            return true
        }
        catch let error {
            print("Error: ", error)
            return false
        }
    }
    
    //Get songs with a specific search criteria
    func getSongsWithCP(titleContain searchString : String, ratingGT rating : Int16 ) -> [Song]{
        let fetchRequest = NSFetchRequest<Song>(entityName: "Song")
        //[c] case insensitive search   [d] accented characters insensitive
        let filterTitlePredicate = NSPredicate(format: "%K CONTAINS [cd]%@", "title" ,searchString as CVarArg)
        let filterRatingPredicate = NSPredicate(format: "%K >= %d", "rating", rating as CVarArg)
        let predicates = [filterTitlePredicate,filterRatingPredicate]
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
        fetchRequest.predicate = compoundPredicate
        
        do {
            let songs = try self.context.fetch(fetchRequest)
            return songs
        }
        catch let error{
            print("Error:", error)
            return []
        }
    }
}
