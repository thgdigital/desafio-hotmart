//
//  Extension.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 19/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    func shadowDecorate() {
        let radius: CGFloat = 10
        contentView.layer.cornerRadius = radius
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
        layer.cornerRadius = radius
    }
}

extension UIView {
    func shadow() {
        let radius: CGFloat = 10
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
        layer.cornerRadius = radius
    }
}

extension UICollectionView {

  func reloadDataTwiceIfNeeded() {
    reloadData()

    if #available(iOS 11.0, *) {
      // do nothing
    }
    else {
      // do it only if bellow iOS 11
      reloadData()
    }
  }
  
  func reloadItemsInSection(sectionIndex: Int, newCount: Int? = nil, completion: (() -> Void)?) {
    self.performBatchUpdates({
      
      self.collectionViewLayout.invalidateLayout()
      
      var sectionItemsCount: Int = 0
      let collectionView: UICollectionView = self
      
      sectionItemsCount = collectionView.numberOfItems(inSection: sectionIndex)
  
      let countArray = [sectionItemsCount, newCount ?? 0]
      let maxCount = countArray.max() ?? 0
      let minCount = countArray.min() ?? 0
      
      var changed = [IndexPath]()
      for i in minCount..<maxCount {
        let indexPath = IndexPath(row: i, section: sectionIndex)
        changed.append(indexPath)
      }
      
      if (newCount ?? 0) > sectionItemsCount {
        collectionView.insertItems(at: changed)
        
      } else if sectionItemsCount > (newCount ?? 0) {
        collectionView.deleteItems(at: changed)
      }
      
    }, completion:  { _ in
      self.collectionViewLayout.invalidateLayout()
      
//      self.reloadLoadingCells(section: section)
      completion?()
    })
  }
  
    
  func reloadItemsInSection(_ section: Int, completion: (() -> Void)?) {
      
      self.performBatchUpdates({
        
        UIView.performWithoutAnimation {
          
          self.collectionViewLayout.invalidateLayout()
          self.reloadSections( IndexSet(integer: section) )
        }
        
      }) { (finished) in
        self.collectionViewLayout.invalidateLayout()
        completion?()
    }
  }
}

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}

extension UIApplication {
  var statusBarUIView: UIView? {
      if #available(iOS 13.0, *) {
          let tag = 38482458
          if let statusBar = self.keyWindow?.viewWithTag(tag) {
              return statusBar
          } else {
              let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
              statusBarView.tag = tag

              self.keyWindow?.addSubview(statusBarView)
              return statusBarView
          }
      } else {
          if responds(to: Selector(("statusBar"))) {
              return value(forKey: "statusBar") as? UIView
          }
      }
      return nil
  }
}
