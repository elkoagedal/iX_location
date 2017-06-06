//
//  AddActivityDelegate.swift
//  iX_Location
//
//  Created by Emily Koagedal on 6/6/17.
//  Copyright © 2017 Emily Koagedal. All rights reserved.
//

import Foundation

protocol AddActivityDelegate {
    func didSaveActivity(activity: Activity)
    func didCancelActivity()
}
