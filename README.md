# ShowPlaygroundKeyboard

Xcode 9.0 makes keyboard input in playground Live Views almost impossible by not resizing the software keyboard based on the size of the window. The image below is the current behaviour of keyboard input.

![](https://psobko.github.io/images/pg_keyboard_default.png)

This playground will make the keyboard fully visible and then help you move it so that you can use the software keyboard in reasonably sized live views.


Basically we're just resizing the window:

```swift
let window = UIWindow(frame: CGRect(x: 0,
                                    y: 0,
                                    width: 768,
                                    height: 1024))
let viewController = MyViewController()
window.rootViewController = viewController
window.makeKeyAndVisible()

PlaygroundPage.current.liveView = window
```
And then enabling the undocked iPad keyboard:

![](https://psobko.github.io/images/pg_keyboard_undock.png)

Scroll down until the bottom row of the keyboard is visible, then hold down the hide keyboard button until the "Undock" option is visible and tap it. It should look like this

![](https://psobko.github.io/images/pg_keyboard_undock.png)

### Details

Since the simulator is running the standard iPad vertical orientation resolution (768 x 1024), an appropriately sized keyboard will display as well (0.0, 711.0, 768.0, 313.0). This means if your Live View has a height of less than 1024 you will only be able to see and interact with a portion of the keyboard. This is a huge limiting factor since:

* playgrounds display using the iPhone 6/7/8 size (375 x 667)
* the standard 15" Macbook resolution has a height of 900 
* hardware keyboard input cannot be captured which makes the software keyboard the only option

The only solution I've have until [this radar](http://www.openradar.me/33917909) is addressed involves undocking the keyboard and resizing the window of the underlying simulator. You would still need a width of 768 for the Live View if you want the full keyboard, but this will reduce the minimum height required to 420 which is far easier to work with.

**Before and After**

![](https://psobko.github.io/images/pg_keyboard_full.png)

![](https://psobko.github.io/images/pg_keyboard_undocked.png)



