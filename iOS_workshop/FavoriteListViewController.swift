//
//  FavoriteListViewController.swift
//  iOS_workshop
//
//  Created by wicked on 08.10.24.
//

import UIKit
import CoreData
class FavoriteListViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var FavoriteCollectionView: UICollectionView!
    
    
    var favoriteItems: [NSManagedObject] = []
    
    
    func fetchFavoriteItems() {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Product")
            
            do {
                favoriteItems = try managedContext.fetch(fetchRequest)
                print("Fetched \(favoriteItems.count) items") // Check how many items are fetched
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
        
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteItems.count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellFav", for: indexPath)
           
           // Debugging output: Log the subviews
           print("Subviews in cell contentView at index \(indexPath.row): \(cell.contentView.subviews)")

           // Safely unwrap the label using optional binding
           if let label = cell.viewWithTag(9) as? UILabel {
               let favoriteItem = favoriteItems[indexPath.row]
               if let productName = favoriteItem.value(forKey: "productname") as? String {
                   label.text = productName
                   print("Setting label text to: \(productName)") // Debug output
               } else {
                   print("Product name is nil") // Debug output
                   label.text = "No name available"
               }
           } else {
               print("Label not found in cell") // Debug output
           }

           return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        FavoriteCollectionView.delegate = self
           FavoriteCollectionView.dataSource = self
           
           // Register the custom cell if necessary
           FavoriteCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell_collectionview") // Or your custom cell class
           fetchFavoriteItems()
           FavoriteCollectionView.reloadData() // Reload after fetching items
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
