//
//  Extension + Animation.swift
//  WeatherPlus
//
//  Created by Anatoli Shmanai on 11.12.20.
//

import UIKit


extension ViewController {
    
    
    
    func canAnimateHeader (_ scrollView: UIScrollView) -> Bool {
        let scrollViewMaxHeight = scrollView.frame.height + self.headerViewHeight.constant - minHeaderHeight
        return scrollView.contentSize.height > scrollViewMaxHeight
    }
    func setScrollPosition() {
        self.tableView.contentOffset = CGPoint(x:0, y: 0)
    }
}
extension ViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollDiff = (scrollView.contentOffset.y - previousScrollOffset)
        let isScrollingDown = scrollDiff > 0
        let isScrollingUp = scrollDiff < 0
        if canAnimateHeader(scrollView) {
            var newHeight = headerViewHeight.constant
            if isScrollingDown {
                newHeight = max(minHeaderHeight, headerViewHeight.constant - abs(scrollDiff))
                if newHeight <= 300 {
                    DispatchQueue.main.async {
                        UIView.animate(withDuration: 0.5) {
                            self.minMaxCurrentLabel.isHidden = true
                        }
                        
                    }
                }
                
                if newHeight <= 230 {
                    DispatchQueue.main.async {
                        UIView.animate(withDuration: 0.5) {
                            self.tempLabel.isHidden = true
                        }
                        
                    }
                }
                
            } else if isScrollingUp {
                newHeight = min(maxHeaderHeight, headerViewHeight.constant + abs(scrollDiff))
                
                if newHeight >= 230 {
                    DispatchQueue.main.async {
                        UIView.animate(withDuration: 0.5) {
                            self.tempLabel.isHidden = false
                        }
                        
                    }
                }
                if newHeight >= 300 {
                    DispatchQueue.main.async {
                        UIView.animate(withDuration: 0.5) {
                            self.minMaxCurrentLabel.isHidden = false
                        }
                        
                    }
                }
               
            }
            if newHeight != headerViewHeight.constant {
                headerViewHeight.constant = newHeight
                setScrollPosition()
                previousScrollOffset = scrollView.contentOffset.y
            }
        }
    }
    
}
