//
//  TheaterListController.swift
//  MyMovieChart
//
//  Created by JinsooMac on 11/19/18.
//  Copyright © 2018 jinsoo. All rights reserved.
//

import UIKit

class TheaterListController: UITableViewController {
    
    // API를 통해 불러온 데이터를 저장할 배열
    var list = [NSDictionary]( )
    
    // 읽어올 데이터의 시작 위치
    var startPoint = 0
    
    override func viewDidLoad() {
        // API를 호출
        self.callTheaterAPI()
    }
    
    // 극장 정보를 불러오는 메소드
    func callTheaterAPI() {
        
        // URL을 구성하기 위한 상수값 선언
        let requestURI = "http://swiftapi.rubypaper.co.kr:2029/theater/list"
        let sList = 100
        let type = "json"
        
        // 인자값을 모아 URL 객체로 정의
        let urlObj = URL(string: "\(requestURI)?s_page=\(self.startPoint)&s_list=\(sList)&type=\(type)")
        
        do {
            // NSString를 이용하여 API를 호출하여 인코딩
            let stringdata = try NSString(contentsOf: urlObj!, encoding: 0x80_000_422)
            
            // 받은 데이터를 UTF-8으로 인코딩한 data로 변환
            let encdata = stringdata.data(using: String.Encoding.utf8.rawValue)
            
            do {
                // Data 객체를 파싱하여 NSArray으로 변환
                let apiArray = try JSONSerialization.jsonObject(with: encdata!, options: []) as? NSArray
                
                // 읽어온 데이터를 순회하면서 self.list배열에 추가
                for obj in apiArray! {
                    self.list.append(obj as! NSDictionary)
                }
            } catch {
                let alert = UIAlertController(title: "실패", message: "데이터 분석 실패", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .cancel))
                self.present(alert, animated: false)
            }
            // 읽어와야 할 다음 페이지의 데이터 시작 위치를 구해 저장
            self.startPoint += sList
        } catch {
            // 경고창 형식으로 오류 표시
            let alert = UIAlertController(title: "실패", message: "데이터를 불러오는데 실패하였습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(alert, animated: false)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tCell") as! TheaterCell
        
        cell.name?.text = obj["상영관명"] as? String
        cell.tel?.text = obj["연락처"] as? String
        cell.addr?.text = obj["소재지도로명주소"] as? String
        
        return cell
        
    }
    
    
}

extension TheaterListController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segue_map") {
            let path = self.tableView.indexPath(for: sender as! UITableViewCell)
            let data = self.list[path!.row]
            
            (segue.destination as? TheaterViewController)?.param = data
        }
    }
}
