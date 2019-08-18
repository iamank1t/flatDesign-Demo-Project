//
//  pageViewController.swift
//  FlatDesignDemo
//
//  Created by Ankit Singh on 18/08/19.
//  Copyright © 2019 Ankit Singh. All rights reserved.
//



import UIKit

class pageViewController: UIPageViewController
{
    
    let crossButton = UIButton()
    
    fileprivate lazy var pages: [UIViewController] = {
        return [
            self.getViewController(withIdentifier: "signInVC"),
            self.getViewController(withIdentifier: "signUpVC")
        ]
    }()
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate   = self
        self.setupView()
        if let firstVC = pages.first
        {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        if let signInVc = pages.first as? signInVC {
            signInVc.delegate = self
        }
        if let signUpVc = pages.last as? signUpVC {
            signUpVc.delegate = self
        }
    }
    
    
    private func setupView() {
        
        //Here we set up the size and attributes of the button.
        crossButton.frame = CGRect(x: self.view.frame.width - 60, y: 40, width: 20, height: 20)
        crossButton.setImage(#imageLiteral(resourceName: "cross_black"), for: .normal)
        crossButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(crossButton)
    }
    
    @objc func buttonAction(sender: UIButton!) {
       self.dismiss(animated: true, completion: nil)
    }
}

extension pageViewController: UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0          else { return pages.last }
        
        guard pages.count > previousIndex else { return nil        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < pages.count else { return pages.first }
        
        guard pages.count > nextIndex else { return nil         }
        
        return pages[nextIndex]
    }
}


extension UIPageViewController {
    // Functions for clicking next and previous in the navbar, Updated for swift 4
    @objc func toNext(){
        guard let currentViewController = self.viewControllers?.first else { return }
        
        guard let nextViewController = dataSource?.pageViewController( self, viewControllerAfter: currentViewController ) else { return }
        
        // Has to be set like this, since else the delgates for the buttons won't work
        setViewControllers([nextViewController], direction: .forward, animated: true, completion: { completed in self.delegate?.pageViewController?(self, didFinishAnimating: true, previousViewControllers: [], transitionCompleted: completed) })
    }
    
    @objc func toPrevious(){
        guard let currentViewController = self.viewControllers?.first else { return }
        
        guard let previousViewController = dataSource?.pageViewController( self, viewControllerBefore: currentViewController ) else { return }
        
        // Has to be set like this, since else the delgates for the buttons won't work
        setViewControllers([previousViewController], direction: .reverse, animated: true, completion:{ completed in self.delegate?.pageViewController?(self, didFinishAnimating: true, previousViewControllers: [], transitionCompleted: completed) })
    }
}

extension pageViewController: UIPageViewControllerDelegate { }

extension pageViewController: signInDelegate, signUpDelegate {
    func swipeToNext() {
       self.toNext()
    }
    
    func swipeToBack() {
        self.toPrevious()
    }
}
