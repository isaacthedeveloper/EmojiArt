//
//  EmojiArtView.swift
//  EmojiArt
//
//  Created by Isaac Ballas on 2019-11-06.
//  Copyright © 2019 Isaacballas. All rights reserved.
//

import UIKit

class EmojiArtView: UIView {
    var backgroundImage: UIImage? { didSet { setNeedsDisplay() } }
    
    override func draw(_ rect: CGRect) {
        backgroundImage?.draw(in: bounds)
    }
}
