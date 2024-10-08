//
//  HomePageViewController.swift
//  iOS_workshop
//
//  Created by wicked on 29.09.24.
//

import UIKit

class HomePageViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
   
    var item = ["Longsleeve Violeta","Shirt", "Pullover" , "Blouse","Shirt", "Pullover" , "Blouse"]
   
       var brandName = ["Dorothy Perkins","Mango", "H&M" , "Olivier","Shirt", "Pullover" , "Blouse"]
   
       var itemPrice = ["51$","34$", "12$" , "51$","Shirt", "Pullover" , "Blouse"]
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "m_cell")
        let contentView = cell?.contentView
        
        let cellItemTitle = contentView?.viewWithTag(1) as! UILabel
        let cellBrandName = contentView?.viewWithTag(2) as! UILabel
        let cellPriceTitle = contentView?.viewWithTag(3) as! UILabel
        let cellImage = contentView?.viewWithTag(4) as! UIImageView
        
        cellItemTitle.text = item[indexPath.row]
                cellBrandName.text = brandName[indexPath.row]
                cellPriceTitle.text = itemPrice[indexPath.row]
                
                // You can set a default image or assign an image based on the item (if you have images)
                cellImage.image = UIImage(named: "insideout2-movie-poster_1709834077") // Replace "defaultImage" with your actual image name
                
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell at index \(indexPath.row) tapped.")
        let movie = [item[indexPath.row], brandName[indexPath.row], itemPrice[indexPath.row]]
        performSegue(withIdentifier: "m_Segue", sender: movie)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
              tableView.isUserInteractionEnabled = true
          }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "m_Segue" {
            if let movie = sender as? [String],
               let destinationVC = segue.destination as? DetailsPageViewController {
                        print("Passing Item: \(movie[0])")
                        print("Passing Brand: \(movie[1])")
                        print("Passing Price: \(movie[2])")
                // Pass the text data
                destinationVC.item = movie[0]
                destinationVC.imageName = movie[0]
                destinationVC.brand = movie[1]
                destinationVC.price = movie[2]

                // Pass the image (make sure this logic is correct)
               // destinationVC.image = UIImage(named: movie[0]) // or use some other logic to pass the image
            }
        }
    }
     
    var data:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
