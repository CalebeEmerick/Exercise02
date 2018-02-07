//
//  NibCreatable.swift
//  Reusable
//
//  Created by Calebe Emerick on 24/09/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

/// `NibCreatable` provides an easy way to create Nibs.
public protocol NibCreatable {

    func makeNib<T: Reusable>(for type: T.Type) -> UINib
}

public extension NibCreatable {
    
    /// Allows create a `UINib` just passing the `class` type.
    ///
    /// - Parameter type: The type to create the `UINib`.
    /// - Returns: Returns a `UINib`.
    func makeNib<T: Reusable>(for type: T.Type) -> UINib {
        
        let bundle = Bundle(for: type.self)
        let nib = UINib(nibName: T.identifier, bundle: bundle)
        
        return nib
    }
}
