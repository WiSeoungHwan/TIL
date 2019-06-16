//
//  SearchVC.swift
//  URLSessionPractice
//
//  Created by Wi on 10/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
import AVKit
import FoldingCell

class SearchVC: UITableViewController {
    
    fileprivate struct C{
        struct CellHeight {
            static let close: CGFloat = 75
            static let open: CGFloat = 456
        }
    }
    
    // MARK: - Properties
    
    var cellHeights = [CGFloat]()
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var tracks = [Track]() {
        didSet{
            cellHeights = (0..<tracks.count).map{_ in C.CellHeight.close}
        }
    }
    private var currentTrack: Track? {
        didSet {
        
        }
    }
    
    var player: AVPlayer?
    var searchWord: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "iTunes Search"
        cellHeights = Array(repeating: C.CellHeight.close, count: 10)
        tableView.estimatedRowHeight = C.CellHeight.close
        tableView.rowHeight = UITableView.automaticDimension
        // seach controller contigure
        searchControllerConfigure()
        
        // search data configure
        getSearchData(searchTerm: "장범준")
        
        // cell register
        tableView.register(UINib(nibName: "TestCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.register(CurrentPlayMusicFooterView.self, forHeaderFooterViewReuseIdentifier: "PlayingView")
        
        // tableView separatorInset
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 90, bottom: 0, right: 0)
    }
    
    // MARK: - Configuration
    
    private func searchControllerConfigure(){
        self.navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.placeholder = "Search music"
        searchController.obscuresBackgroundDuringPresentation = true
    }
    
    // MARK: - TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TestCell
        let durations: [TimeInterval] = [0.26, 0.2, 0.2]
        cell.durationsForExpandedState = durations
        cell.durationsForCollapsedState = durations
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        guard let url = URL(string: tracks[indexPath.row].previewUrl) else {return}
//        guard let footerView = tableView.footerView(forSection: 0) as? CurrentPlayMusicFooterView else {return}
//
//        currentTrack = tracks[indexPath.row]
//        footerView.track = currentTrack
//        footerView.isPlaying = true
//
//        player = AVPlayer(url: url)
//        player!.play()
        
        guard case let cell as FoldingCell = tableView.cellForRow(at: indexPath) else {return}
        
        var duration = 0.0
        let cellIsCollapsed = cellHeights[indexPath.row] == C.CellHeight.close
        
        if cellIsCollapsed {
            cellHeights[indexPath.row] = C.CellHeight.open
            cell.unfold(true, animated: true, completion: nil)
            duration = 0.5
        } else {
            cellHeights[indexPath.row] = C.CellHeight.close
            cell.unfold(false, animated: true, completion: nil)
            duration = 0.8
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)
        
        if cell.frame.maxY > tableView.frame.maxY {
            tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: true)
        }
       
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard case let cell as TestCell = cell else {return}
        
        if cellHeights[indexPath.row] == C.CellHeight.close {
            cell.unfold(false, animated: false, completion: nil)
        }else {
            cell.unfold(true, animated: false, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "PlayingView") as! CurrentPlayMusicFooterView
        footerView.delegate = self
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return cellHeights[indexPath.row]
    }
    
    // MARK: - Networking
    
    private func getSearchData(searchTerm: String){
        
        
        let defualtSession = URLSession(configuration: .default)
        
        guard var urlComponents = URLComponents(string: "https://itunes.apple.com/search") else {return}
        urlComponents.query = "media=music&entity=song&term=\(searchTerm)"
        
        guard let url = urlComponents.url else {return}
        
        let dataTask = defualtSession.dataTask(with: url) { (data, response, error) in
            
            if let error = error{
                print(error.localizedDescription)
            } else if let data = data,
                      let response = response as? HTTPURLResponse,
                response.statusCode == 200{
                
                do {
                    let result = try JSONDecoder().decode(Result.self, from: data)
                    self.tracks = result.results
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
                
            }
        }
        dataTask.resume()
    }
    
}

extension SearchVC: CurrentPlayMusicFooterViewDelegate{
    func playPauseButtonDidTap(footerView: CurrentPlayMusicFooterView) {
        guard let player = self.player else {return}
        
        if footerView.isPlaying{
            player.pause()
        } else {
            player.play()
        }
        footerView.isPlaying.toggle()
    }
}


extension SearchVC: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        if searchWord != nil{
            getSearchData(searchTerm: searchWord!)
        } else {
            getSearchData(searchTerm: searchBar.text!)
        }
        
    }
    
    
}

extension SearchVC: UISearchControllerDelegate{
    func willDismissSearchController(_ searchController: UISearchController) {
        searchWord = searchController.searchBar.text
    }
}

