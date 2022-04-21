import Foundation
import CoreFoundation

struct UserModel: Codable {
    var userId: Int64
    var firstName: String
    var middleName: String?
    var lastName: String
    var isActive: Bool
}

////START GET BY ID METHOD
//let url = URL(string : "https://localhost:5001/users/getuser/1")
//guard let requestURL = url else { fatalError() }
//var request = URLRequest(url: requestURL)
//request.httpMethod = "GET"
//let task = URLSession.shared.dataTask(with: request) {
//    (data, response, error) in
//    if let error = error {
//        print("error: \(error)")
//    }
//    if let response = response as? HTTPURLResponse {
//        print("respone: \(response.statusCode)")
//    }
//    if let data = data, let dataString = String(data: data, encoding: .utf8){
//        print("data: \(dataString)")
//        var user: UserModel?
//        do{
//            user = try JSONDecoder().decode(UserModel.self, from: data)
//            print(user!.firstName)
//        } catch {
//            print("error: \(error.localizedDescription)")
//        }
//    }
//}
//task.resume()
////END GET METHOD

////START GET ACTIVE USERS METHOD
//let url = URL(string : "https://localhost:5001/users/getactiveusers")
//guard let requestURL = url else { fatalError() }
//var request = URLRequest(url: requestURL)
//request.httpMethod = "GET"
//let task = URLSession.shared.dataTask(with: request) {
//    (data, response, error) in
//    if let error = error {
//        print("error: \(error)")
//    }
//    if let response = response as? HTTPURLResponse {
//        print("respone: \(response.statusCode)")
//    }
//    if let data = data, let dataString = String(data: data, encoding: .utf8){
//        do{
//            var users:[UserModel] = []
//            users = try JSONDecoder().decode([UserModel].self, from: data)
//            for user in users {
//                print("\(user.firstName) \(user.lastName)")
//            }
//        } catch {
//            print("error: \(error.localizedDescription)")
//        }
//    }
//}
//task.resume()
////END GET METHOD

////START PUT METHOD
//let url = URL(string: "https://localhost:5001/users/putUser")
//guard let requestUrl = url else { fatalError() }
//
//var request = URLRequest(url: requestUrl)
//request.httpMethod = "PUT"
//
//request.setValue("application/json", forHTTPHeaderField: "Accept")
//request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//let userToUpdate = UserModel(userId: 2, firstName: "Yesi", middleName: "no name", lastName: "Rodriguez", isActive: true)
//
//let json = try JSONEncoder().encode(userToUpdate)
//request.httpBody = json
//
//let task = URLSession.shared.dataTask(with: request) {
//    (data, response, error) in
//    if let error = error {
//        print("error: \(error)")
//    }
//    guard let data = data else {
//        print("successful post")
//        return
//    }
//    do {
//        let updatedUser = try JSONDecoder().decode(UserModel.self, from: data)
//        print("update user: \(updatedUser)")
//    } catch let err{
//        print("err: \(err)")
//    }
//}
//task.resume()
////END PUT METHOD

////START POST METHOD
//let url = URL(string: "https://localhost:5001/users/POSTUser")
//guard let requestUrl = url else { fatalError() }
//
//var request = URLRequest(url: requestUrl)
//request.httpMethod = "POST"
//
//request.setValue("application/json", forHTTPHeaderField: "Accept")
//request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//let userToUpdate = UserModel(userId: 0, firstName: "NEW", middleName: "no name", lastName: "USER", isActive: true)
//
//let json = try JSONEncoder().encode(userToUpdate)
//request.httpBody = json
//
//let task = URLSession.shared.dataTask(with: request) {
//    (data, response, error) in
//    if let error = error {
//        print("error: \(error)")
//    }
//    guard let data = data else {
//        print("successful post")
//        return
//    }
//    do {
//        let updatedUser = try JSONDecoder().decode(UserModel.self, from: data)
//        print("update user: \(updatedUser)")
//    } catch let err{
//        print("err: \(err)")
//    }
//}
//task.resume()
////END PUT METHOD


//START GET ACTIVE USERS METHOD
func getAllUsers() -> [UserModel] {
    let url = URL(string : "https://localhost:5001/users/getactiveusers")
    guard let requestURL = url else { fatalError() }
    var request = URLRequest(url: requestURL)
    request.httpMethod = "GET"
    var users:[UserModel] = []
    let task = URLSession.shared.dataTask(with: request) {
        (data, response, error) in
        if let error = error {
            print("error: \(error)")
        }
        if let response = response as? HTTPURLResponse {
            print("respone: \(response.statusCode)")
        }
        if let data = data, let dataString = String(data: data, encoding: .utf8){
            do{
                users = try JSONDecoder().decode([UserModel].self, from: data)
                for user in userList{
                    print(user.firstName)
                }
                
            } catch {
                print("error: \(error.localizedDescription)")
            }
        }
        
    }
    task.resume()
}
//END GET METHOD

var userList = getAllUsers();

for user in userList{
    print(user.firstName)
}
