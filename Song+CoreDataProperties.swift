//
//  Song+CoreDataProperties.swift
//  CoreDataCRUD
//
//  Created by DISMOV on 26/04/24.
//
//

import Foundation
import CoreData


extension Song {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Song> {
        return NSFetchRequest<Song>(entityName: "Song")
    }

    @NSManaged public var title: String?
    @NSManaged public var rating: Int16
    @NSManaged public var songId: UUID?

}

extension Song : Identifiable {

}
