# ExtButtonProgress
This simple extension adds progress indicator to UIButton. 

<img width=20%  src="https://cloud.githubusercontent.com/assets/25868364/24120808/e6340a78-0dc6-11e7-8920-b851f94af0f0.png" /> <img width=20%  src="https://cloud.githubusercontent.com/assets/25868364/24120807/e607dd7c-0dc6-11e7-9bb4-5037dd288c0b.png" />


## Usage
Just add file ExtButtonProgress.swift in your project.
Use method *showProgressIndicator( width:color:backgroundColor:)* to begin show progress indicator
and method *hideProgressIndicator()* to hide indicator.
 
Important! Button must be circular for using this extension.

Code example
```
class ViewController: UIViewController {
    
    // Our rounded button
    @IBOutlet weak var roundedButton: UIButton!
    
    // Push 'Start' button
    @IBAction func pushStart(_ sender: UIButton) {
        // Show progress indicator for our buttnon 
        roundedButton.showProgressIndicator(width: 5, color: UIColor.purple, backgroundColor: UIColor.lightGray)
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

## Author
Created by Alexander Smetannikov (alexsmetdev@gmail.com)
Thanks to Evgeny Safronov
