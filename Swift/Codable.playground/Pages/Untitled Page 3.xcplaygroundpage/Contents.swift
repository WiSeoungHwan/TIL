
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

struct Repositories: Decodable{
    let items: [Repository]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    struct Repository: Decodable {
        let fullName: String
        let description: String?
        let starCount: Int
        let forkCount: Int
        let url: String
        enum CodingKeys: String, CodingKey {//네이밍을 일치시켜주기 위해서
            case fullName = "full_name"
            case description = "description"
            case starCount = "stargazers_count"
            case forkCount = "forks_count"
            case url = "html_url"
        }
    }
}

// https://developer.github.com/v3      // github api document
let urlString = "https://api.github.com/search/repositories?q=user:wiSeoungHwan"

func fetchGitHubRepositories() {
    let url  = URL(string: urlString)!
    
    let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let response = response as? HTTPURLResponse, let data = data else { return }
        guard 200..<400 ~= response.statusCode else { return }
        do {
            let repositories = try JSONDecoder().decode(Repositories.self, from: data)
            
            for repository in repositories.items{
                print(repository.fullName)
                print(repository.description ?? "")
                print(repository.starCount)
                print("+++++++++++++++++++++")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    dataTask.resume()
}

fetchGitHubRepositories()


