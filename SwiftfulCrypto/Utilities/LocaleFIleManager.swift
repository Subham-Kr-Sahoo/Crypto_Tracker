//
//  LocaleFIleManager.swift
//  SwiftfulCrypto
//
//  Created by Rahul Dev Nayak on 09/09/25.
//

import Foundation
import SwiftUI

class LocaleFIleManager {
    static let instance = LocaleFIleManager()
    private init () {
        
        
    }
    
    func saveImage(image: UIImage, imageName: String, folderName: String){
        //create folder
        createFolderIfNeeded(folderName: folderName)
        //get image path
        guard
            let data = image.pngData(),
            let url = getUrlForImage(imageName: imageName, folderName: folderName)
        else {return}
        // save image to path 
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image: \(imageName)---\(error.localizedDescription)")
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage?{
        guard
            let url = getUrlForImage(imageName: imageName, folderName: folderName),
            FileManager.default.fileExists(atPath: url.path)
        else { return nil}
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(folderName: String){
        guard let url = getUrlForFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path){
            do{
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            }catch let error{
                print("Error creating directory. folder name: \(folderName). \(error)")
            }
        }
    }
    
    private func getUrlForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        return url.appendingPathComponent(folderName)
    }
    
    private func getUrlForImage(imageName: String, folderName: String) -> URL? {
        guard let folderUrl = getUrlForFolder(folderName: folderName) else {
            return nil
        }
        return folderUrl.appendingPathComponent(imageName + ".png")
    }
}
