//
//  Utils.swift
//  Leos_PDF_Reader
//
//  Created by Letian Xin on 15/12/2022.
//

import UIKit

class Utils {
    
    static func getDirectoriesUnder(s: String) -> [String] {
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath! + "/" + s
        let items = try! fileManager.contentsOfDirectory(atPath: path)
//        print("I am : Utils.getDirectoriesUnder(s: )", path)
        return items.sorted()
    }
}
