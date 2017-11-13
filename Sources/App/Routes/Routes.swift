import Vapor

extension Droplet {
    func setupRoutes() throws {
        
        let store = Store()
        
        //MARK: Get
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world\n")
            return json
        }

        get("plaintext") { req in
            return "Hello, world!\n"
        }
        
        //Response to curl localhost:8080/uppercase/words
        get("uppercase", ":words") { req in
            guard let words = req.parameters["words"]?.string else {
                return "Error retriving parameter/s\n"
            }
            return "\(words.uppercased())\n"
        }

        //Response to curl -X "GET" "localhost:8080/uppercase?words=<your_word>"
        get("uppercaseGet") { req in
            guard let words = req.data["words"]?.string else {
                return "Error retriving parameter/s\n"
            }
            return "\(words.uppercased())\n"
        }
        
        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        //MARK: Post
        post("user") { req in
            guard let name = req.data["name"]?.string else {
                return "Error getting parameter/s\n"
            }
            return "Hello, \(name)\n"
        }
        
        post("store") { req in
            guard let key = req.data["key"]?.string else {
                 return "Error getting parameter/s\n"
            }
            guard let value = req.data["value"]?.string else {
                 return "Error getting parameter/s\n"
            }
            store.set(key: key, value: value)
          //  let tempV = store.value(forKey: key)
            return "You stored value:\(value) \n"
        }
        
        try resource("posts", PostController.self)
    }
}
