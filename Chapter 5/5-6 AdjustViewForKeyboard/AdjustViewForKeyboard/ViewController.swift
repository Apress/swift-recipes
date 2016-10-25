import UIKit

class ViewController: UIViewController {
    
    var isKeyboardUp : Bool = false
    var scrollView : UIScrollView!
    var button : UIButton!
    var textField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup user interface elements. 
      
        scrollView = UIScrollView(frame: self.view.frame)

        self.view.addSubview(scrollView!)
        
        textField = UITextField(frame: CGRect(x: 10, y: 400, width: 200, height: 30))
        textField.placeholder = "Enter your name"
        textField.borderStyle = UITextBorderStyle.Line
        scrollView.addSubview(textField)
        
        button = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.frame = CGRect(x: 10, y: 440, width: 200, height: 30)
        button.setTitle("Tap Me!", forState: UIControlState.Normal)
        button.addTarget(self, action: "tapped:", forControlEvents: UIControlEvents.TouchUpInside)
        scrollView.addSubview(button)
    }
    
    override func viewWillAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func getKeyboardHeight( notification : NSNotification ) -> CGFloat {
        return (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue().height
    }
    
    func keyboardWillShow( notification : NSNotification) {
        if !isKeyboardUp {
            scrollView( getKeyboardHeight(notification) , scrollingUp: true)
        }
    }
    
    func keyboardWillHide( notification : NSNotification ) {
        if isKeyboardUp {
            scrollView( getKeyboardHeight(notification) , scrollingUp: false )
        }
    }
    
    func scrollView ( points : CGFloat, scrollingUp: Bool ) {
        var newRect = scrollView!.frame
        
        if scrollingUp && !isKeyboardUp {
            newRect.size.height += points
            scrollView.frame = newRect
            scrollView.setContentOffset(CGPoint(x: 0.0,y: button!.frame.origin.y - points), animated: true)
            isKeyboardUp = true
        } else
        if !scrollingUp && isKeyboardUp {
            newRect.size.height -= points
            scrollView.frame = newRect
            
            scrollView.setContentOffset(CGPoint(x: 0.0,y: 0), animated: true)
            isKeyboardUp = false
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func tapped( sender : UIButton ) {
        textField.resignFirstResponder()
    }
}

