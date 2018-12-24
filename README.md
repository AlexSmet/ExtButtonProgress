# ExtButtonProgress
[![Version](https://img.shields.io/badge/version-0.1.1-orange.svg?style=flat)](https://img.shields.io/badge/version-0.1.1-orange.svg)
[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg?style=flat)](https://img.shields.io/badge/platform-ios-lightgrey.svg?style=flat)
[![Language](https://img.shields.io/badge/language-swift-orange.svg?style=flat-square)](https://swift.org/about/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://opensource.org/licenses/MIT)

This simple extension adds progress indicator to rounded UIButton. 

<img src="https://user-images.githubusercontent.com/25868364/50404135-78487400-07b5-11e9-9831-31ed74f1ef9b.gif" />


## Usage
Just add file ExtButtonProgress.swift in your project.
Use method *showProgressIndicator( width:color:backgroundColor:)* to begin show progress indicator
and method *hideProgressIndicator()* to hide indicator.
 
Important! Button must be circular for using this extension.

Code example
```swift
class ViewController: UIViewController {
    
    // Our rounded button
    @IBOutlet weak var roundedButton: UIButton!
    
    // Push 'Start' button
    @IBAction func pushStart(_ sender: UIButton) {
        // Show progress indicator for our buttnon 
        roundedButton.showProgressIndicator(width: 5, color: UIColor.purple, backgroundColor: UIColor.lightGray, cycleDuration: 7.0)
    }
    
    // Push 'Stop' button
    @IBAction func pushStop(_ sender: UIButton) {
        // Hide progress indicator
        roundedButton.hideProgressIndicator()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Make rounded button
        roundedButton.layer.cornerRadius = 0.5 * buttonWithProgressbar.bounds.size.width
        roundedButton.clipsToBounds = true
    }
}
```
## Installation
ExtButtonProgress is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ExtButtonProgress", :git => 'https://github.com/AlexSmet/ExtButtonProgress.git'
```

## Author
Created by Alexander Smetannikov (alexsmetdev@gmail.com)
Thanks to Evgeny Safronov

## License
ExtButtonProgress is available under the MIT license. See the LICENSE file for more info.
