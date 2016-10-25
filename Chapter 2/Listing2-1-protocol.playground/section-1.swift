import Foundation

protocol Sharing
{
    var username : String { get set }
    var error : String? { get }
    
    func shareMessage( message : String ) -> Bool
}

class EmailSharing : Sharing
{
    private var _error : String?
    
    var username : String
    
    var error : String?
        {
            return _error
    }
    
    init(username : String)
    {
        self.username = username
    }
    
    func shareMessage(message: String) -> Bool {
        // some code to compose an email
        println("Message from \(username):\n\(message)")
        return true
    }
}

class Message
{
    var sharingMethod : Sharing
    var message = "Hello World"
    
    init (sharingMethod : Sharing)
    {
        self.sharingMethod = sharingMethod
    }
    
    func share()
    {
        sharingMethod.shareMessage(self.message)
    }
}

var message = Message(sharingMethod: EmailSharing(username: "Mike"))
message.share()
