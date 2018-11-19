//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by JinsooMac on 11/17/18.
//  Copyright © 2018 jinsoo. All rights reserved.
//

import UIKit
class ListViewController: UITableViewController {
    
    @IBOutlet var moreBtn: UIButton!
    
    var page = 1
    
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
        
        return datalist
    }()
   
    @IBAction func more(_ sender: Any) {
        self.page += 1
        self.callMovieAPI()
        self.tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        
        cell.thumbnail.image = row.thumbnailImage
        
        NSLog("제목 : \(row.title!), 호출된 행번호: \(indexPath.row)")
        
        // MARK:- 비동기 방식으로 섬네일 이미지 읽어옴
        DispatchQueue.main.async(execute: {
            cell.thumbnail.image = self.getThumbnailImage(indexPath.row)
        })
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row)번째 행입니다.")
    }
    
    override func viewDidLoad() {
        self.callMovieAPI()
        
    }
    
    func callMovieAPI() {
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=30&genreId=&order=releasedateasc"
        let apiURI: URL! = URL(string: url)
        
        let apidata = try! Data(contentsOf: apiURI)
        
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? ""
        NSLog("API result = \(log)")
        
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            // iterator 처리를 하면서 api 데이터를 movieVo에 저장
            for row in movie {
                // 순회 상수를 NSDictionary 타입으로 캐스팅
                let r = row as! NSDictionary
                
                // 테이블 뷰 리스트를 구성할 데이터 형식
                let mvo = MovieVO( )
                
                // movie 배열의 각 데이터를 mvo 상수의 속성에 대입
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                
                let url: URL! = URL(string: mvo.thumbnail!)
                let imageData = try! Data(contentsOf: url)
                
                mvo.thumbnailImage = UIImage(data: imageData)
                
                
                self.list.append(mvo)
            }
            
            let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
            if (self.list.count >= totalCount) {
                self.moreBtn.isHidden = true
            }
        } catch {
            NSLog("Parse Error")
        }
        
    }
    
    func getThumbnailImage(_ index: Int) -> UIImage {
        let mvo = self.list[index]
        
        if let savedImage = mvo.thumbnailImage {
            return savedImage
        } else {
            let url: URL! = URL(string: mvo.thumbnail!)
            let imageData = try! Data(contentsOf: url)
            mvo.thumbnailImage = UIImage(data: imageData)
            
            return mvo.thumbnailImage!
        }
        
    }
    
}

extension ListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_detail" {
            let path = self.tableView.indexPath(for: sender as! MovieCell)
            let detailVC = segue.destination as? DetailViewController
            
            detailVC?.mvo = self.list[path!.row]
        }
    }
}
