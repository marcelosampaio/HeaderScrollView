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
    private var newPosition : CGFloat = 0.0
    
    // MARK: - Outlets
    @IBOutlet var detailHeaderView: UIView!
    @IBOutlet weak var detailHeaderScrollView: UIScrollView!
    @IBOutlet weak var paginateButton: UIBarButtonItem!
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load source
        loadSource()
        
        // data setup
        prepareData()
        
    }
    
    // MARK: - Application Data Source
    private func loadSource() {
        source.append("landscape")
        source.append("landscape2")
        source.append("landscape")
        source.append("landscape2")
        source.append("landscape")
        source.append("landscape2")
        source.append("landscape")
        source.append("landscape2")
        source.append("landscape")
        source.append("landscape2")
        
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
            
            
            // add image
            detailHeaderScrollView.addSubview(imageView)

            
        }
        
    }
    
    
    // MARK: - UI Actions
    @IBAction func paginate(_ sender: Any) {
        print("🌳 paginate 👍  newPosition: \(newPosition)")
        
        
        
        
        
        let width: CGFloat = detailHeaderScrollView.frame.size.width
        let height: CGFloat = detailHeaderScrollView.frame.size.height
        newPosition = detailHeaderScrollView.contentOffset.x + width
        let toVisible: CGRect = CGRect(x: newPosition, y: 0, width: width,   height: height)
        
        detailHeaderScrollView.scrollRectToVisible(toVisible, animated: true)
        self.tableView.reloadData()
        
    }
    
    
}
