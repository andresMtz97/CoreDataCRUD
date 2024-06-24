//
//  ViewController.swift
//  CoreDataCRUD
//
//  Created by DISMOV on 26/04/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var myFavoriteSong: Song?
    var myHatedSong: Song?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let songManager = SongManager(context: context)
                
        let songs = ["Slime You Out", "Paint The Town Red", "Snooze", "Fast Car", "I Remember Everything", "Cruel Summer", "Vampire", "Last Night", "Fukumean", "Dance The Night"]
        
        //MARK: 1. insert songs
//        for song in songs{
//            let newSong = songManager.createSong(title: song, uuid: UUID(), rating: Int16.random(in: 0...5))
//        }
        
        //MARK: 2. Get all songs
//        for persistedSong in songManager.getAllSongs(){
//            print("ID: ", persistedSong.songId ?? "0000", "title: ", persistedSong.title ?? "No title", "rating: ", persistedSong.rating)
//        }
        
        //MARK: 3. Get song by ID
//        if let songWithUUID = songManager.getSongByID(uuid: UUID(uuidString: "335AD6ED-F122-4E09-BBE4-E935527D8C28")!){
//
//            print("ID: ", songWithUUID.songId!, "title: ", songWithUUID.title!, "rating: ",
//                  songWithUUID.rating)
//
//            myFavoriteSong = songWithUUID
//        }
//        else
//        {
//            print("Song was no located!")
//        }
        
        //MARK: 4. Update a song
//        myFavoriteSong?.rating = Int16(5)
//    
//        let updatedSong = songManager.updateSong(song: myFavoriteSong!, rating: 5)
//        print("ID: ", updatedSong.songId!, "title: ", updatedSong.title!, "rating: ", updatedSong.rating)
//        
//        //MARK: 5. Delete song
//        if let songToDelete = songManager.getSongByID(uuid: UUID(uuidString: "335AD6ED-F122-4E09-BBE4-E935527D8C28")!){
//            myHatedSong = songToDelete
//            let result = songManager.deleteSong(song: myHatedSong!)
//            if result == true {
//                print("My hated song at last was deleted...")
//            }
//        }else{
//            print("Song was not located!")
//        }

        //MARK: 6. update playlist
        for persistedSong in songManager.getAllSongs(){
            print("ID: ", persistedSong.songId ?? "0000", "title: ", persistedSong.title ?? "No title", "rating: ", persistedSong.rating)
        }
        
        //MARK: 7. update playlist
        for persistedSong in songManager.getSongsWithCP(titleContain: "Night", ratingGT: 3) {
            print("ID: ", persistedSong.songId ?? "0000", "title: ", persistedSong.title ?? "No title", "rating: ", persistedSong.rating)
        }
    }
}

