//
//  ManagerVC.swift
//  ShopME
//
//  Created by Artis, Justin (CONT) on 3/1/17.
//  Copyright © 2017 Artis, Justin (CONT). All rights reserved.
//

import UIKit

class ManagerVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var selectImage: UIButton!
    @IBOutlet weak var categoryField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var itemNameField: UITextField!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var priceLabel: UITextField!
    
    
    //add to categories array as well
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Manage"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func imageSelected(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        img.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addNewCategory(_ sender: Any) {
        var count = 0
        if  itemNameField.text != "" && categoryField.text != "" && descriptionField.text != "" && priceLabel.text != ""{
            //uialert
        }else{
            let garbage = img.image!
            let product = ShopItem(itemString: itemNameField.text!, descript: descriptionField.text!, priceNum: Double(priceLabel.text!)!,itemImage: garbage)
        for item in Registry.categories {
            if item.getLabelName() == categoryField.text {
                Registry.allItems.wholeStore[count]?.append(product)
                }else{
                let newCategory = CategoryItem(image: String(describing: img), label: itemNameField.text!)
                Registry.categories.append(newCategory)
                Registry.allItems.addNewCategory(newItem: product)
            }
            count = count + 1
        }
        }
        
        
        
        
        
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
