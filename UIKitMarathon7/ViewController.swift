//
//  ViewController.swift
//  UIKitMarathon7
//
//  Created by alexeituszowski on 19.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 270, left: 0, bottom: 0, right: 0)
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
    
    override func viewDidLayoutSubviews() {
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2000)
        scrollView.frame = view.bounds
        imageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 270)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.contentOffset.y < 0 else { return }
        imageView.frame = CGRect(x: 0, y: scrollView.contentOffset.y, width: view.bounds.width, height: 270 + view.safeAreaInsets.top - scrollView.contentOffset.y)
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 270 - scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)
    }
}
