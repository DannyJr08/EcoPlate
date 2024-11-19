//
//  ProductClassifier.swift
//  EcoPlate
//
//  Created by kebato OS on 17/11/24.
//

import Foundation
import CoreML
import Vision
import UIKit

public class ProductClassifier {
     public var model: VNCoreMLModel?
    
    init() {
        do {
            model = try VNCoreMLModel(for: EcoPlateFruitClassifier(configuration: MLModelConfiguration()).model)
        } catch {
            print("Failed to initialize the classification model: \(error.localizedDescription)")
        }
    }
    
    public func classify(image: UIImage, completion: @escaping (Result<ProductEnums, Error>) -> Void) {
        guard let model = model else {
            completion(.failure(NSError(domain: "ProductClassifier", code: -1, userInfo: [NSLocalizedDescriptionKey: "Model is not available"])))
            return
        }
        
        guard let cgImage = image.cgImage else {
            completion(.failure(NSError(domain: "ProductClassifier", code: -2, userInfo: [NSLocalizedDescriptionKey: "Invalid image"])))
            return
        }
        
        let request = VNCoreMLRequest(model: model) { request, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let results = request.results as? [VNClassificationObservation], let topResult = results.first {
                let identifier = topResult.identifier.lowercased()
                
                // Map classification to ProductEnums
                if let product = ProductEnums(rawValue: identifier) {
                    completion(.success(product))
                } else {
                    completion(.failure(NSError(domain: "ProductClassifier", code: -3, userInfo: [NSLocalizedDescriptionKey: "Unknown classification: \(identifier)"])))
                }
            } else {
                completion(.failure(NSError(domain: "ProductClassifier", code: -4, userInfo: [NSLocalizedDescriptionKey: "No classification found"])))
            }
        }
        
        // Perform the request
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try handler.perform([request])
            } catch {
                completion(.failure(error))
            }
        }
    }
}
