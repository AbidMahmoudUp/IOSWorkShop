//
//  DetailsPageViewController.swift
//  iOS_workshop
//
//  Created by wicked on 29.09.24.
//

import UIKit
import CoreData


class DetailsPageViewController: UIViewController {

    @IBOutlet weak var PriceLabel: UILabel!
    
    
    @IBOutlet weak var BrandLabel: UILabel!
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var imageViewDetails: UIImageView!
    
    var item:String?
    var brand:String?
    var price:String?
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
          
        print("Received Item: \(item ?? "No Title")")
           print("Received Brand: \(brand ?? "No Brand")")
           print("Received Price: \(price ?? "No Price")")
           print("Received Image Name: \(imageName ?? "No Image Name")")

        TitleLabel.text=item ?? "no title"
              BrandLabel.text = brand
              PriceLabel.text = price
        if let imageName = imageName {
                 imageViewDetails.image = UIImage(named: imageName)
             }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func AddToFavoriteButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
            let persistantContainer = appDelegate.persistentContainer
        
        
               let managedContext = persistantContainer.viewContext
        
               let entityDescreption = NSEntityDescription.entity(forEntityName: "Product", in: managedContext)
        
               let object  = NSManagedObject(entity: entityDescreption!, insertInto: managedContext)
        
        
               object.setValue(item!, forKey: "productname")
        
               do {
        
                   try managedContext.save()
        
        
                   print("INSERT good")
                   
                   performSegue(withIdentifier: "goToFavorites", sender: self)
        
               } catch  {
        
                   print("INSERT failed")
        
        
               }

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
