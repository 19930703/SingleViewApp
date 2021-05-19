//
//  UIViewController+Extension.swift
//  Single View App
//
//  Created by Vijay Bhaskar on 15/05/21.
//

import UIKit

extension UIViewController {
    
    func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView(frame: UIScreen.main.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            
            UIApplication.shared.windows.last!.addSubview(spinnerView)
            UIApplication.shared.windows.last!.bringSubviewToFront(spinnerView)
            onView.bringSubviewToFront(spinnerView)
        }
        
        return spinnerView
    }
    
    func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
    
    func showDefaultAlertWith(title: String?, message: String?) {
        let alert = UIAlertController(title: title ?? "", message: message ?? "Something went wrong!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
          
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
