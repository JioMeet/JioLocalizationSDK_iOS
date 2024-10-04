# JioLocalizationSDK_iOS

JioLocalization SDK iOS Demo App

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Project Settings](#project-settings)
- [Add SDK](#add-sdk)
- [Import SDK](#import-sdk)
- [Integrate SDK](#integrate-sdk)
- [Fetch Localization Data](#fetch-localization-data)
- [Usage Examples](#usage-examples)
    - [Example 1: Simple Localized String](#example-1-simple-localized-string)
    - [Example 2: Fetch Nested String](#example-2-fetch-nested-string)
    - [Example 3: Use Dynamic Values for Localization String](#example-3-use-dynamic-values-for-localization-string)
    - [Example 4: Localized String with Missing Key](#example-4-localized-string-with-missing-key)
- [Demo App](#demo-app)
- [Troubleshooting](#troubleshooting)

## Introduction
The `JioLocalizationSDKiOS` offers a robust solution for managing localization in your iOS applications. With this SDK, you can effortlessly fetch localization data, retrieve localized strings, and handle dynamic placeholders, ensuring your app can cater to a global audience with ease.

## Features
- Fetch localization data.
- Retrieve localized strings with dynamic placeholders.
- Support for nested JSON structures.
- Handle missing localization keys with fallback values.

## Prerequisites
- Xcode 14.2 or later.
- Swift 5.0 or later.
- An iOS device or simulator running iOS 13.0 or later.

## Project Settings
Ensure your project settings are configured to support the SDK:
1. Open your project in Xcode.
2. Go to `Build Settings`.
3. Set `Swift Language Version` to `Swift 5`.

## Add SDK
To add the `JioLocalizationSDKiOS` to your project, add the following to your `Podfile`:

```ruby
pod 'JioLocalizationSDKiOS', '0.0.1-alpha'
```

## Import SDK
After adding the SDK to your project, import it in your Swift files where you need to use it:

```swift
import JioLocalizationSDKiOS
```

## Integrate SDK
To integrate the SDK into your project, initialize it with your configuration settings:

```swift
import JioLocalizationSDKiOS

let config = JioLocalizationConfig(
    environment: .sit,
    apiKey: "your_api_key",
    userId: "your_user_id"
)

JioLocalizationManager.shared.configure(with: config)
```
## Fetch Localization Data
Fetch localization data for a specific language code.

```swift
JioLocalizationManager.shared.fetchLocalization(for: "en") { result in
    switch result {
    case .success:
        print("Localization data fetched successfully.")
    case .failure(let error):
        print("Failed to fetch localization data: \(error)")
    }
}
```
## Usage Examples

### Example 1: Simple Localized String

To fetch a simple localized string, you can use the 'localizedString(forKey:)' method of the 'LocalizationManager'. This method takes a key as an argument and returns the corresponding localized string.

#### JSON Example:
```swift
{
  "welcome_message": "Welcome to the Localization SDK!"
}
```
#### Code:
```swift
let simpleString = JioLocalizationManager.shared.localizedString(for: "welcome_message", fallbackValue: "Welcome to the Localization SDK!")
print("Localization String: \(simpleString)")
```

## Example 2: Fetch Nested String
If your localization data contains nested structures, you can fetch a nested localized string using the `localizedString(forKeyPath:)` method. This method allows you to specify a key path to access nested values.

1.  Fetch a localized string from a nested JSON structure using Dot(.) notation.
2. Example: For a JSON structure like {"welcome": {"message": "Welcome to the Localization SDK!"}}
3. you can use the key path "welcome.message" to fetch the value "Welcome to the Localization SDK!".
4. If the key path is found, it returns the corresponding value.
5. If the key path is not found, it returns the provided fallback value.

#### JSON Example:
```swift
{
  "welcome": {
    "message": "Welcome to the Localization SDK!",
  }
}
```
#### Code:
```swift
let nestedString = JioLocalizationManager.shared.localizedString(for: "welcome.message", fallbackValue: "Good Morning!")
print("Nested Localization String: \(nestedString)")
```

## Example 3: Use Dynamic Values for Localization String
You can use dynamic values in your localized strings by specifying placeholders in the string. The `localizedString(forKey:withValues:)` method allows you to pass dynamic values as a dictionary to replace the placeholders in the localized string.

#### JSON Example:
```swift
{
  "welcome_message": "{name}, welcome to the Localization SDK."
}
```
#### Code:
```swift
let placeholders = ["name": "Ramakrishna"]
let dynamicString = JioLocalizationManager.shared.localizedString(for: "welcome_message", placeholders: placeholders, fallbackValue: "Ramakrishna, welcome to the Localization SDK!")
print("Dynamic Localization String: \(dynamicString)")
```

## Example 4: Localized String with Missing Key
If the key is not found in the localization data, the SDK returns the provided fallback value.

#### JSON Example:
```swift
{
  "nonexistentkey" // invalid key not present in the JSON
}
```
#### Code:
```swift
let missingKeyString = JioLocalizationManager.shared.localizedString(for: "nonexistentkey", fallbackValue: "Default message for missing key")
print("Missing Key String: \(missingKeyString)")
```

## Demo App
The `JioLocalizationSDK_iOS` demonstrates how to integrate the `JioLocalizationSDKiOS` into your iOS project. The app showcases various examples of fetching localized strings, including simple strings, nested strings, and strings with dynamic placeholders.

## Troubleshooting

Facing any issues while integrating or installing the JioLocalization iOS SDK kit, please connect with us via https://translate.jio/contact-us.html
