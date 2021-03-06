import Foundation

// Parsing Dictionary

let json = """
{
 "results": [
   {
     "firstName": "John",
     "lastName": "Appleseed"
   },
  {
    "firstName": "Alex",
    "lastName": "Paul"
  }
 ]
}
""".data(using: .utf8)!

// Create Model(s)

// Codable: Decodable & Encodable
// Decodable: converts json data
// Encodable: converts to json data

struct ResultsWrapper: Decodable {
    let results: [Contact]
}

struct Contact: Decodable {
    let firstName: String
    let lastName: String
}

//==========================
// Decode the JSON data to our swift model
//==========================

do {
    let dictionary = try JSONDecoder().decode(ResultsWrapper.self, from: json)
    let contacts = dictionary.results // [Contact]
    dump(contacts)
} catch {
    print("decoding error \(error)")
}


/*
 ▿ 2 elements
 ▿ __lldb_expr_4.Contact
   - firstName: "John"
   - lastName: "Appleseed"
 ▿ __lldb_expr_4.Contact
   - firstName: "Alex"
   - lastName: "Paul"
 */
