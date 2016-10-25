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

var c2 = Contact(name: "Ben Franklin", phoneNumber: "555-1212", email: "benfranklin@continentialcongress.gov")

var c3 = c1

c1 === c2
c1 === c3
