//
//  DetailsPageViewController.swift
//  iOS_workshop
//
//  Created by wicked on 29.09.24.
//

import UIKit

class DetailsPageViewController: UIViewController {

    @IBOutlet weak var PriceLabel: UILabel!
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var BrandLabel: UILabel!
    
    @IBOutlet weak var imageViewDetails: UIImageView!
    
    var item:String?
    var brand:String?
    var price:String?
    var image:UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let itemRecived = item
        let brandRecived = brand
        let priceRecived = price
        let imageRecived = image
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
