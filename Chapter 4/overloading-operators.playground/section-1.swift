class Contact
{
    var name : String
    var phoneNumber : String
    var email : String
    
    init( name: String, phoneNumber: String, email: String)
    {
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
    }
}

var c1 = Contact(name: "Ben Franklin", phoneNumber: "555-1212", email: "benfranklin@continentialcongress.gov")

var c2 = Contact(name: "John Adams", phoneNumber: "555-2498", email: "jadams@xpresidents.com")

var c3 = Contact(name: "Ben Franklin", phoneNumber: "555-1212", email: "benfranklin@continentialcongress.gov")

func == (left: Contact, right: Contact) -> Bool
{
    return left.name == right.name
    && left.phoneNumber == right.phoneNumber
    && left.email == right.email
}

c1 === c2

c1 === c3

c1 === c1
