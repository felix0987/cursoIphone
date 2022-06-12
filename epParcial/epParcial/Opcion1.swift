//
//  Opcion1.swift
//  epParcial
//
//  Created by felix 28/05/22.
//



import UIKit

class Opcion1: UIViewController {
    
    @IBAction private func button(_ sender:Any){
        navigationController?.popViewController(animated: true)
 }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
