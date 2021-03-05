//
//  ViewController.swift
//  CodableDecodable
//
//  Created by mamidisetty Vikash on 05/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    var actorBtn:UIButton!
    var jsonBtn:UIButton!
    var moviesBtn:UIButton!
    var githubBtn:UIButton!
    var URLReq : URLRequest!
    //connection to server
    var dataTask : URLSessionDataTask!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SetUp()
        actorBtn.addTarget(self, action: #selector(ActorDetails), for: UIControl.Event.touchUpInside)
        jsonBtn.addTarget(self, action: #selector(JsonDetails), for: UIControl.Event.touchUpInside)
        moviesBtn.addTarget(self, action: #selector(MovieDetails), for: UIControl.Event.touchUpInside)
        githubBtn.addTarget(self, action: #selector(GithubDetails), for: UIControl.Event.touchUpInside)
    }

    func SetUp(){
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "1146081.jpeg")!)

        
        actorBtn = UIButton()
        actorBtn.frame = CGRect(x: 82, y: 130, width: 245, height: 88)
        actorBtn.backgroundColor = UIColor.systemRed
        actorBtn.layer.cornerRadius = 15
        actorBtn.layer.shadowOpacity = 1
        actorBtn.layer.shadowOffset = .zero
        actorBtn.layer.shadowRadius = 10
        actorBtn.setTitle("Actors", for: UIControl.State.normal)
        actorBtn.setTitleColor(.black, for: .normal)
        view.addSubview(actorBtn)
        
        
        jsonBtn = UIButton()
        jsonBtn.frame = CGRect(x: 82, y: 291, width: 245, height: 88)
        jsonBtn.backgroundColor = UIColor.systemBlue
        jsonBtn.layer.cornerRadius = 15
        jsonBtn.layer.shadowOpacity = 1
        jsonBtn.layer.shadowOffset = .zero
        jsonBtn.layer.shadowRadius = 10
        jsonBtn.setTitle("Json", for: UIControl.State.normal)
        jsonBtn.setTitleColor(.black, for: .normal)
        view.addSubview(jsonBtn)

        
        moviesBtn = UIButton()
        moviesBtn.frame = CGRect(x: 82, y: 474, width: 245, height: 88)
        moviesBtn.backgroundColor = UIColor.systemPink
        moviesBtn.layer.cornerRadius = 15
        moviesBtn.layer.shadowOpacity = 1
        moviesBtn.layer.shadowOffset = .zero
        moviesBtn.layer.shadowRadius = 10
        moviesBtn.setTitle("Movies", for: UIControl.State.normal)
        moviesBtn.setTitleColor(.black, for: .normal)
        view.addSubview(moviesBtn)

        
        githubBtn = UIButton()
        githubBtn.frame = CGRect(x: 82, y: 656, width: 245, height: 88)
        githubBtn.backgroundColor = UIColor.systemGray2
        githubBtn.layer.cornerRadius = 15
        githubBtn.layer.shadowOpacity = 1
        githubBtn.layer.shadowOffset = .zero
        githubBtn.layer.shadowRadius = 10
        githubBtn.setTitle("GitHub", for: UIControl.State.normal)
        githubBtn.setTitleColor(.black, for: .normal)
        view.addSubview(githubBtn)

    }
    @objc func ActorDetails()
    {
        //Assigning URL
        URLReq = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
        //declaring a method
        URLReq.httpMethod = "GET"
        //geting data response time and error
        dataTask = URLSession.shared.dataTask(with: URLReq, completionHandler: { (data, response, err) in
            print(data!)
            
            do{
                //converting json data to swift using json decoder
                var convertedData = try JSONDecoder().decode([Actors].self, from: data!)
                //displaying in labels
                DispatchQueue.main.async {
//                    self.moviesLbl.text! = convertedData[0].actors![0]
                }
                //printing data
                print(convertedData)
            }
            catch{
                print("Something Went Wrong")
            }
       
         })
        //building a connection to server
        dataTask.resume()

    }
    @objc func JsonDetails()
    {
        //Assigning URL
        URLReq = URLRequest(url: URL(string: "https://services.brninfotech.com/tws/MovieDetails2.php?mediaType=movie")!)
        //declaring a method
        URLReq.httpMethod = "GET"
        //geting data response time and error
        dataTask = URLSession.shared.dataTask(with: URLReq, completionHandler: { (data, response, err) in
            print(data!)
            
            do{
                //converting json data to swift using json decoder
                var convertedData = try JSONDecoder().decode([Json].self, from: data!)
                //displaying in labels
                DispatchQueue.main.async {
//                    self.moviesLbl.text! = convertedData[0].actors![0]
                }
                //printing data
                print(convertedData[0].id!)
            }
            catch{
                print("Something Went Wrong")
            }
       
         })
        //building a connection to server
        dataTask.resume()
    }
    @objc func MovieDetails()
    {
        //Assigning URL
        URLReq = URLRequest(url: URL(string: "https://services.brninfotech.com/tws/MovieDetails2.php?mediaType=movie")!)
        //declaring a method
        URLReq.httpMethod = "GET"
        //geting data response time and error
        dataTask = URLSession.shared.dataTask(with: URLReq, completionHandler: { (data, response, err) in
            print(data!)
            
            do{
                //converting json data to swift using json decoder
                var convertedData = try JSONDecoder().decode([Movies].self, from: data!)
                //displaying in labels
                DispatchQueue.main.async {
//                    self.moviesLbl.text! = convertedData[0].actors![0]
                }
                //printing data
                print(convertedData[0].actors![0])
            }
            catch{
                print("Something Went Wrong")
            }
       
         })
        //building a connection to server
        dataTask.resume()
        
    }
    @objc func GithubDetails()
    {
        URLReq = URLRequest(url: URL(string: "https://api.github.com/users")!)
        //declaring a method
        URLReq.httpMethod = "GET"
        //geting data response time and error
        dataTask = URLSession.shared.dataTask(with: URLReq, completionHandler: { (data, response, err) in
            print(data!)
            
            do{
                //converting json data to swift using json decoder
                var convertedData = try JSONDecoder().decode([Github].self, from: data!)
                //displaying in labels
                DispatchQueue.main.async {
//                    self.githubLbl.text! = convertedData[0].followersUrl!
                }
                //printing data
               
                print(convertedData[0].login!)
            }
            catch{
                print("Something Went Wrong")
            }
        })
        //building a connection to server
        dataTask.resume()
    }
}

