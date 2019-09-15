//
//  extensions.swift
//  Brand
//
//  Created by iOS on 9/15/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    var isAtTop: Bool {
        return contentOffset.y <= verticalOffsetForTop
    }
    
    var isAtBottom: Bool {
        return contentOffset.y >= verticalOffsetForBottom
    }
    
    private var verticalOffsetForTop: CGFloat {
        let topInset = contentInset.top
        return -topInset
    }
    
    private var verticalOffsetForBottom: CGFloat {
        let scrollViewHeight = bounds.height
        let scrollContentSizeHeight = contentSize.height
        let bottomInset = contentInset.bottom
        let scrollViewBottomOffset = scrollContentSizeHeight + bottomInset - scrollViewHeight
        return scrollViewBottomOffset
    }
    
}
