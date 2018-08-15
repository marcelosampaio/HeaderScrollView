//
//  MainController.swift
//  HeaderScrollView
//
//  Created by PlugApps on 4/26/18.
//  Copyright © 2018 PlugApps. All rights reserved.
//

import UIKit

class MainController: UITableViewController {

    // MARK: - Properties
    private var source = [String]()
    private var index : Int = -1
    private var showTimer: Timer!
    
    // MARK: - Outlets
    @IBOutlet var detailHeaderView: UIView!
    @IBOutlet weak var detailHeaderScrollView: UIScrollView!

    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // load source
        loadSource()
        
        // data setup
        prepareData()
        
        // start auto display
        startAutoShow()
        
    }
    
    // MARK: - Application Data Source
    private func loadSource() {
        source.append("landscape")
        source.append("landscape2")
        source.append("landscape3")
        source.append("landscape4")
        source.append("landscape5")
        source.append("landscape6")
        source.append("landscape7")
        source.append("landscape8")
        source.append("landscape9")
        
        //
        tableView.tableHeaderView = detailHeaderView
        
        // reload table view data
        tableView.reloadData()
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return source.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = source[indexPath.row]

        return cell
    }
    
    

    // MARK: - Horizontal Scroll Helper
    private func prepareData(){
        // set up page content

        detailHeaderScrollView.frame = self.view.frame
        
        // load images to the scrool view
        for i in 0..<source.count{
            let xPositon = self.view.frame.size.width * CGFloat(i)
            // Image View ===================== begin =============
            let imageView = UIImageView()
            imageView.contentMode=UIViewContentMode.scaleToFill
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: source[i])
            imageView.frame=CGRect(x: xPositon, y: 0, width: self.detailHeaderView.frame.size.width, height: self.detailHeaderView.bounds.size.height)
            detailHeaderScrollView.contentSize.width = detailHeaderScrollView.frame.width * CGFloat((i + 1))
            print("🥪 detailHeaderScrollView.contentSize.width: \(detailHeaderScrollView.contentSize.width)")
            // add image
            detailHeaderScrollView.addSubview(imageView)
        }
        
    }
    
    private func startAutoShow() {
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        
        
    }
    
    // MARK: - Timer Helper
    @objc private func runTimedCode() {
        print("🌳🌳🌳🌳🌳🌳🌳🌳🌳 index: \(index)  count:\(source.count)")
        print("🌳🥇 detailHeaderScrollView.contentSize.width: \(detailHeaderScrollView.contentSize.width)")
        print("🌳🥇 detailHeaderScrollView.contentOffset: \(detailHeaderScrollView.contentOffset)")
        print("🌳 👉 bounds width: \(self.detailHeaderView.frame.size.width)")
        
        var duration = 0.68
        if index >= source.count - 1 {
            index = 0
            duration = 0.38
        }else{
            index = index + 1
            duration = 0.68
        }
        
        let xPosition : CGFloat = self.detailHeaderView.frame.size.width * CGFloat(index)
        
        UIView.animate(withDuration: duration, animations: {
            // animations
            self.detailHeaderScrollView.contentOffset = CGPoint(x: xPosition, y: 0.0)
            
        }) { (result) in
            // completion
            
        }
        

        
    }
}
