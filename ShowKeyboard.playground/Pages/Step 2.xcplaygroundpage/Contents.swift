//: A Playground for testing the software keyboard in a smaller view

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    let textField = UITextView()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        textField.textAlignment = .center
        textField.text = "When you tap here the entire keyboard should be visible"
        textField.sizeToFit()
        textField.center = CGPoint(x:window.frame.midX, y: 50)
        view.addSubview(textField)
        
        self.view = view
    }
}

// Present the view controller in the Live View window
let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 768, height: 420))
window.rootViewController = MyViewController()
window.makeKeyAndVisible()
PlaygroundPage.current.liveView = window
