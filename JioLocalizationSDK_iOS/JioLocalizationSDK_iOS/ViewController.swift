//
//  ViewController.swift
//  JioLocalizationSDK_iOS
//
//  Created by Ramakrishna1 M on 04/10/24.
//

import UIKit
import JioLocalizationSDKiOS

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the JioLocalizationManager with the necessary environment, API key, and user ID
        let config = JioLocalizationConfig(
            environment: .sit,
            apiKey: "your_api_key",
            userId: "your_user_id"
        )
        JioLocalizationManager.shared.configure(with: config)
        
        // Fetch localization data
        fetchLocalizationResponse()
    }
    
    // Fetch localization data for the specified language code
    // Example language codes: en, hi-IN, te-IN, kn-IN, tm-IN, ja
    func fetchLocalizationResponse() {
        JioLocalizationManager.shared.fetchLocalization(for: "en") { result in
            switch result {
            case .success:
                self.handleSuccess()
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    // Handle successful localization data fetch
    func handleSuccess() {
        print("Localization data fetched successfully.")
        
        // Example 1: Simple localized string
        // JSON Example:
        // {
        //   "welcome_message": "Welcome to the Localization SDK!"
        // }
        // Fetch a simple localized string for the key "welcome_message".
        // If the key is found, return the corresponding value.
        // If the key is not found, return the fallback value.
        let simpleString = JioLocalizationManager.shared.localizedString(for: "welcome_message", fallbackValue: "Welcome to the Localization SDK!")
        print("Localization String: \(simpleString)")
        
        // Example 2: Fetch Nested string
        // JSON Example:
        // {
        //   "welcome": {
        //     "message": "Welcome to the Localization SDK!"
        //   }
        // }
        // Fetch a localized string from a nested JSON structure using dot notation.
        // If the key is found, return the corresponding value.
        // If the key is not found, return the fallback value.
        let nestedString = JioLocalizationManager.shared.localizedString(for: "welcome.message", fallbackValue: "Welcome to the Localization SDK!")
        print("Nested Localization String: \(nestedString)")

        // Example 3: Use Dynamic values for localization string
        // JSON Example:
        // {
        //   "welcome_message": "{name}, welcome to the Localization SDK!"
        // }
        // Replace placeholders in a localized string with dynamic values.
        // The key "welcome_message" contains a placeholder "{name}".
        // The `placeholders` dictionary provides the value for this placeholder.
        // If the key is found, replace the placeholder with the provided value.
        // If the key is not found, return the fallback value.
        let placeholders = ["name": "Ramakrishna"]
        let dynamicString = JioLocalizationManager.shared.localizedString(for: "welcome_message", placeholders: placeholders, fallbackValue: "Ramakrishna, welcome to the Localization SDK!")
        print("Dynamic Localization String: \(dynamicString)")
        
        // Example 4: Localized string with missing key
        // JSON Example:
        // {
        //   // "nonexistentkey" is not present in the JSON
        // }
        // Handle the scenario where the localization key is missing.
        // If the key "nonexistentkey" does not exist, return the fallback value.
        let missingKeyString = JioLocalizationManager.shared.localizedString(for: "nonexistentkey", fallbackValue: "Default message for missing key")
        print("Missing Key String: \(missingKeyString)")
    }
    
    // Handle errors during localization data fetch
    func handleError(_ error: JioLocalizationApiError) {
        switch error {
        case .unAuthorised(let message):
            print("Unauthorized: \(message)")
        case .serverError(let message):
            print("Server Error: \(message)")
        case .genericError(let message):
            print("Error: \(message)")
        default: break
        }
    }
}
