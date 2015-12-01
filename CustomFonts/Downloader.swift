//
//  Downloader.swift
//  CustomFonts
//
//  Created by Trum Gyorgy on 12/1/15.
//  Copyright (c) 2015 General Electric. All rights reserved.
//

import Foundation
import CoreGraphics
import CoreText
import UIKit

class Downloader {
    class func load(URL: NSURL) -> UIFont? {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        let request = NSMutableURLRequest(URL: URL)
        request.HTTPMethod = "GET"
        let task = session.dataTaskWithRequest(request, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! NSHTTPURLResponse).statusCode
                println("Success: \(statusCode)")
                
                // This is your file-variable:
                // data
                
                var uiFont : UIFont?
                let fontData = data

                let dataProvider = CGDataProviderCreateWithCFData(fontData)
                let cgFont = CGFontCreateWithDataProvider(dataProvider)
                
                var error: Unmanaged<CFError>?
                if !CTFontManagerRegisterGraphicsFont(cgFont, &error)
                {
                    print("Error loading Font!")
                } else {
                    let fontName = CGFontCopyPostScriptName(cgFont)
                    uiFont = UIFont(name: String(fontName) , size: 30)
                    for x in UIFont.familyNames()
                    {
                        print(x)
                        
                        for z in UIFont.fontNamesForFamilyName(x as! String)
                        {
                            print("== \(z)")
                        }
                    }
                }
                
            }
            else {
                // Failure
                println("Faulure: %@", error.localizedDescription);
            }
        })
        task.resume()
        
        return nil;
    }
}