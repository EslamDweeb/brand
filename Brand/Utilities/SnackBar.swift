//
//  SnackBar.swift
//  Brand
//
//  Created by iOS on 9/2/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import TTGSnackbar

class SnackBar {
    
    static let instance  = SnackBar()
    let snack = TTGSnackbar()
    
    func setMessage (_ message : String ) {
        snack.message = message
        snack.duration = TTGSnackbarDuration.middle
        snack.show()
    }
    
    func doNothing () {
        print("smvnkef")
    }
    
}
