//
//  RLSQLLiteManager.swift
//  RLCoreAnimationPractice
//
//  Created by Riven on 2021/11/26.
//

import SQLite


class RLSQLLiteManager {
    
    static func sqlLiteTest() {
        //log.verbose("test1")
        //log.debug("test2")

        do {
        //    var path = NSSearchPathForDirectoriesInDomains(
        //        .applicationSupportDirectory, .userDomainMask, true
        //    ).first! + "/" + Bundle.main.bundleIdentifier!
        //
        //    // create parent directory iff it doesn’t exist
        //    try FileManager.default.createDirectory(
        //    atPath: path, withIntermediateDirectories: true, attributes: nil
        //    )
        //
        //    log.debug(path)

        //    let db = try Connection("\(path)/testDB.sqlite3")
            let db = try Connection()
            let users = Table("users")
            let id = Expression<Int64>("id")
            let name = Expression<String?>("name")
            let email = Expression<String>("email")
            
            try db.run(users.create { t in
                t.column(id, primaryKey: true)
                t.column(name)
                t.column(email, unique: true)
            })
            
            let insert = users.insert(name <- "Alice", email <- "alice@mac.com")
            let rowid = try db.run(insert)
            
            for user in try db.prepare(users) {
                log.debug("id: \(user[id]), name: \(user[name]), email: \(user[email])")
            }
            
        } catch  {
            log.error(error)
        }

        log.debug("end")
    }
    
}
