//
//  UIImageExtension.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 24.05.2022.
//

import UIKit

extension UIImage {
    
    class var placeholder: UIImage {
        R.image.placeholder()!
    }
    
    class var home: UIImage {
        UIImage(systemName: "powerplug")!
    }

    class var events: UIImage {
        UIImage(systemName: "paperplane")!
    }
    
    class var homeFilled: UIImage {
        UIImage(systemName: "powerplug.fill")!
    }

    class var eventsFilled: UIImage {
        UIImage(systemName: "paperplane.fill")!
    }

}
