//: A Playground which displays the full software keyboard and helps move it

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    let textField = UITextView()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let label = UILabel(frame: CGRect(x: 0,
                             y: window.frame.maxY-20,
                             width: 60,
                             height: 20))
        label.text = String("bottom")
        view.addSubview(label)
        
        textField.textAlignment = .center
        textField.text = "Tap here if you can see the word \"bottom\" on the left\n (scroll down and make sure this view is 768 wide)"
        textField.sizeToFit()
        textField.center = CGPoint(x: window.center.x, y: window.center.y/2)
        textField.textColor = UIColor.red
        view.addSubview(textField)
        NotificationCenter.default.addObserver(self, selector: #selector(MyViewController.keyboardDidChangeFrame(notification:)), name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)

        self.view = view
    }
    
    @objc func keyboardDidChangeFrame(notification: NSNotification) {
        if let keyboardRect = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            print("Keyboard frame is: \(keyboardRect)")
            if(keyboardRect.minY > window.frame.midY) {
                textField.text = "Press and hold the hide keyboard button (bottom right on keyboard) and select \"Undock\""
            } else {
                textField.text = "Open Step 2 playground to test in a smaller window"
                textField.textColor = UIColor.blue
            }
        }
    }
}

// Present the view controller in the Live View window
let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 768, height: 1024))
window.rootViewController = MyViewController()
window.makeKeyAndVisible()
PlaygroundPage.current.liveView = window


