//
//  WindowAction.swift
//  Rectangle
//
//  Created by Ryan Hanson on 6/12/19.
//  Copyright © 2019 Ryan Hanson. All rights reserved.
//

import Foundation
import Carbon
import Cocoa

fileprivate let alt = NSEvent.ModifierFlags.option.rawValue
fileprivate let ctrl = NSEvent.ModifierFlags.control.rawValue
fileprivate let shift = NSEvent.ModifierFlags.shift.rawValue
fileprivate let cmd = NSEvent.ModifierFlags.command.rawValue

enum WindowAction: Int {
    case leftHalf = 0, rightHalf = 1, maximize = 2, maximizeHeight = 3, previousDisplay = 4, nextDisplay = 5, undo = 6, redo = 7, larger = 8, smaller = 9, bottomHalf = 10, topHalf = 11, center = 12, lowerLeft = 13, lowerRight = 14, upperLeft = 15, upperRight = 16, nextThird = 17, previousThird = 18, restore = 19, leftThird = 20, leftTwoThirds = 21, horizCenterThird = 22, rightTwoThirds = 23, rightThird = 24, topThird = 25, topTwoThirds = 26, vertCenterThird = 27, bottomTwoThirds = 28, bottomThird = 29, moveLeft = 30, moveRight = 31, moveUp = 32, moveDown = 33, almostMaximize = 34
    
    static let active = [leftHalf, rightHalf, maximize, maximizeHeight, previousDisplay, nextDisplay, undo, redo, larger, smaller, bottomHalf, topHalf, center, lowerLeft, lowerRight, upperLeft, upperRight, restore, leftThird, leftTwoThirds, horizCenterThird, rightTwoThirds, rightThird, topThird, topTwoThirds, vertCenterThird, bottomTwoThirds, bottomThird, moveLeft, moveRight, moveUp, moveDown, almostMaximize]
    
    func post() {
        NotificationCenter.default.post(name: notificationName, object: self)
    }
    
    var name: String {
        switch self {
        case .leftHalf: return "leftHalf"
        case .rightHalf: return "rightHalf"
        case .maximize: return "maximize"
        case .maximizeHeight: return "maximizeHeight"
        case .previousDisplay: return "previousDisplay"
        case .nextDisplay: return "nextDisplay"
        case .undo: return "undo"
        case .redo: return "redo"
        case .larger: return "larger"
        case .smaller: return "smaller"
        case .bottomHalf: return "bottomHalf"
        case .topHalf: return "topHalf"
        case .center: return "center"
        case .lowerLeft: return "lowerLeft"
        case .lowerRight: return "lowerRight"
        case .upperLeft: return "upperLeft"
        case .upperRight: return "upperRight"
        case .nextThird: return "nextThird"
        case .previousThird: return "previousThird"
        case .restore: return "restore"
        case .leftThird: return "leftThird"
        case .leftTwoThirds: return "leftTwoThirds"
        case .horizCenterThird: return "horizCenterThird"
        case .rightTwoThirds: return "rightTwoThirds"
        case .rightThird: return "rightThird"
        case .topThird: return "topThird"
        case .topTwoThirds: return "topTwoThirds"
        case .vertCenterThird: return "vertCenterThird"
        case .bottomTwoThirds: return "bottomTwoThirds"
        case .bottomThird: return "bottomThird"
        case .moveLeft: return "moveLeft"
        case .moveRight: return "moveRight"
        case .moveUp: return "moveUp"
        case .moveDown: return "moveDown"
        case .almostMaximize: return "almostMaximize"
        }
    }
    
    var notificationName: Notification.Name {
        return Notification.Name(name)
    }
    
    var isMoveToDisplay: Bool {
        switch self {
        case .previousDisplay, .nextDisplay: return true
        default: return false
        }
    }
    
    var spectacleDefault: Shortcut? {
        switch self {
        case .leftHalf: return Shortcut( cmd|alt, kVK_LeftArrow )
        case .rightHalf: return Shortcut( cmd|alt, kVK_RightArrow )
        case .maximize: return Shortcut( cmd|alt, kVK_ANSI_F )
        case .maximizeHeight: return Shortcut( ctrl|alt|shift, kVK_UpArrow )
        case .previousDisplay: return Shortcut( ctrl|alt|cmd, kVK_LeftArrow )
        case .nextDisplay:  return Shortcut( ctrl|alt|cmd, kVK_RightArrow )
        case .undo: return Shortcut( cmd|alt, kVK_ANSI_Z )
        case .redo: return Shortcut( cmd|alt|shift, kVK_ANSI_Z )
        case .larger: return Shortcut( ctrl|alt|shift, kVK_RightArrow )
        case .smaller: return Shortcut( ctrl|alt|shift, kVK_LeftArrow )
        case .bottomHalf: return Shortcut( cmd|alt, kVK_DownArrow )
        case .topHalf: return Shortcut( cmd|alt, kVK_UpArrow )
        case .center: return Shortcut( alt|cmd, kVK_ANSI_C )
        case .lowerLeft: return Shortcut( cmd|ctrl|shift, kVK_LeftArrow )
        case .lowerRight: return Shortcut( cmd|ctrl|shift, kVK_RightArrow )
        case .upperLeft: return Shortcut( ctrl|cmd, kVK_LeftArrow )
        case .upperRight: return Shortcut( ctrl|cmd, kVK_RightArrow )
        case .nextThird: return Shortcut( ctrl|alt, kVK_RightArrow )
        case .previousThird: return Shortcut( ctrl|alt, kVK_LeftArrow )
        case .restore: return Shortcut( ctrl|alt, kVK_Delete)
        default: return nil
        }
    }
    
    var alternateDefault: Shortcut? {
        switch self {
        case .leftHalf: return Shortcut( ctrl|alt, kVK_LeftArrow )
        case .rightHalf: return Shortcut( ctrl|alt, kVK_RightArrow )
        case .bottomHalf: return Shortcut( ctrl|alt, kVK_DownArrow )
        case .topHalf: return Shortcut( ctrl|alt, kVK_UpArrow )
        case .lowerLeft: return Shortcut( ctrl|alt, kVK_ANSI_J )
        case .lowerRight: return Shortcut( ctrl|alt, kVK_ANSI_K )
        case .upperLeft: return Shortcut( ctrl|alt, kVK_ANSI_U )
        case .upperRight: return Shortcut( ctrl|alt, kVK_ANSI_I )
        case .maximize: return Shortcut( ctrl|alt, kVK_Return )
        case .maximizeHeight: return Shortcut( ctrl|alt|shift, kVK_UpArrow )
        case .previousDisplay: return Shortcut( ctrl|alt|cmd, kVK_LeftArrow )
        case .nextDisplay: return Shortcut( ctrl|alt|cmd, kVK_RightArrow )
        case .undo: return Shortcut( cmd|alt, kVK_Delete )
        case .redo: return Shortcut( cmd|alt|shift, kVK_Delete )
        case .larger: return Shortcut( ctrl|alt, kVK_ANSI_Equal )
        case .smaller: return Shortcut( ctrl|alt, kVK_ANSI_Minus )
        case .center: return Shortcut( ctrl|alt, kVK_ANSI_C )
        case .nextThird: return Shortcut( ctrl|alt, kVK_ANSI_F )
        case .previousThird: return Shortcut( ctrl|alt, kVK_ANSI_D )
        case .restore: return Shortcut( ctrl|alt, kVK_Delete)
        case .leftThird: return Shortcut( ctrl|alt, kVK_ANSI_D )
        case .leftTwoThirds: return Shortcut( ctrl|alt, kVK_ANSI_E )
        case .horizCenterThird: return Shortcut( ctrl|alt, kVK_ANSI_F )
        case .rightTwoThirds: return Shortcut( ctrl|alt, kVK_ANSI_T )
        case .rightThird: return Shortcut( ctrl|alt, kVK_ANSI_G )
        default: return nil
        }
    }
}

struct Shortcut {
    let keyCode: Int
    let modifierFlags: UInt
    
    init(_ modifierFlags: UInt, _ keyCode: Int) {
        self.keyCode = keyCode
        self.modifierFlags = modifierFlags
    }
    
    var dict: [String: UInt] {
        return ["keyCode": UInt(keyCode), "modifierFlags": modifierFlags]
    }
}
