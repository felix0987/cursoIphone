//
//  ViewController.swift
//  epParcial
//
//  Created by felix  28/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var buttonLabel: UIButton!
    
    @IBOutlet private weak var anchorBottmScroll: NSLayoutConstraint!
       @IBAction private func button(_ sender:Any){
        label.text = ""
           label2.text = ""
          
    }
    
    @IBAction private func tapTopCloseKeyboard(_ sender:UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unRegisterKeyboardNotication()
    }
    
    private func registerKeyboardNotification(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(Self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(Self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
    }
    
    @objc private func keyboardWillShow(_ notification: Notification){
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double ?? 0
        let keybordFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        
        UIView.animate(withDuration: animationDuration){
            self.anchorBottmScroll.constant = keybordFrame.height
            self.view.layoutIfNeeded()
        }
        
            
    }
    
    @objc private func keyboardWillHide(_ notification: Notification){
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        UIView.animate(withDuration: animationDuration){
            self.anchorBottmScroll.constant = 0
            self.view.layoutIfNeeded()
        }
        
    }
    private func unRegisterKeyboardNotication(){
        NotificationCenter.default.removeObserver(self)
       
    }

}

