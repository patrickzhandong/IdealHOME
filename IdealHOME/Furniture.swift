//
//  Furniture.swift
//  IdealHOME
//
//  Created by Zhan Dong on 3/11/17.
//  Copyright © 2017 Zhan Dong. All rights reserved.
//

import UIKit
import os.log

class Furniture: NSObject, NSCoding {
    
    //MARK: Properties
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let fursize = "fursize"
        static let type = "type"
    }
    
    var name: String
    var photo: UIImage?
    var fursize: Int
    var type: String
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("furs")

    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, fursize: Int, type: String) {
        if name.isEmpty || fursize < 0  {
            return nil
        }
        self.name = name
        self.photo = photo
        self.fursize = fursize
        self.type = type
        
    }
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(fursize, forKey: PropertyKey.fursize)
        aCoder.encode(type,forKey: PropertyKey.type)
    }
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        let fursize = aDecoder.decodeInteger(forKey: PropertyKey.fursize)
        let type = aDecoder.decodeObject(forKey: PropertyKey.type) as! String
        self.init(name: name, photo: photo, fursize: fursize,type: type)
    }
    
}

