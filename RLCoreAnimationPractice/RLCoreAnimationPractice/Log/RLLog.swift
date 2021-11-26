//
//  RLLog.swift
//  RLCoreAnimationPractice
//
//  Created by Riven on 2021/11/26.
//

import SwiftyBeaver


public var log: SwiftyBeaver.Type {
    return SwiftyBeaver.self
}

func configLog() {
    let logConsole = ConsoleDestination()
    //let logFile = FileDestination()

    logConsole.format = "$DHH:mm:ss$d $L $M"

    log.addDestination(logConsole)
    
    // log.addDestination(logFile)
}
