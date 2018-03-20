//
//  ViewController.swift
//  Corosul Effect
//
//  Created by Abhishek K on 07/03/18.
//  Copyright © 2018 Abhishek K. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var imageArray = ["bodyline","darkvarder","dudu","hello","run","hhhhh","run","wave"]
    var message = ["Hello there, i miss you","🙉🙊🐒","Taking like this #bodyline", "I'm hungry indded", "Eeverybody is busy", "Hell out of here","All is fine", "I'm dead"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func AddAction(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .savedPhotosAlbum
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
}
extension ViewController:UIImagePickerControllerDelegate, UIPickerViewDataSource,UINavigationControllerDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        // Whatever you want here
       // self.pickedImage = image
        picker.dismiss(animated: true, completion: nil)
    }
}
extension ViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
       
        return imageArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageViewCell
        cell.image.image = UIImage.init(named: imageArray[indexPath.row])
        cell.footerLabel.text = message[indexPath.row]
        return cell
        
       
        
        
    }
    
}

