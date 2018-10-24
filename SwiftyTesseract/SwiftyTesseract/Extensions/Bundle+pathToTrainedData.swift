//
//  Bundle+pathToTrainedData.swift
//  SwiftyTesseract
//
//  Created by Steven Sherry on 3/24/18.
//  Copyright © 2018 Steven Sherry. All rights reserved.
//

import Foundation

extension Bundle {
  var pathToTrainedData: String {
    // Including the file:// prefix will cause TessBaseAPIInit to fail
    let intermediatePath = self.bundleURL.appendingPathComponent("tessdata").absoluteString
    let pathPrefix = "file://"
    let pathPrefixEnd = String.Index(encodedOffset: pathPrefix.count)
    let trimmedPath = intermediatePath[pathPrefixEnd...]
    guard let finalPath = trimmedPath.removingPercentEncoding else { fatalError("") }
    return String(finalPath)
  }
}
