//
//  UIViewController+Extension.swift
//  HMBaseProj
//
//  Created by zenganiu on 2018/1/21.
//  Copyright © 2018年 Suntrans. All rights reserved.
//

import Foundation
import UIKit
//import NVActivityIndicatorView
//import Hero

/*
//侧滑
extension UIViewController{
    
    
    func setSlideNavBarItem() {
        
        self.addLeftBarButtonWithImage(UIImage(named: "bs_leftMenu")!)
        self.addRightBarButtonWithImage(UIImage(named: "bs_leftMenu")!)
        
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
        self.slideMenuController()?.addRightGestures()
        
        
    }
    
    func removeSlideNavBarItem() {
        
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        
    }
 
}
 */



// FIXME:--加载动画
//extension UIViewController: NVActivityIndicatorViewable{
//
//    func showActivity(message: String? = nil,type: NVActivityIndicatorType? = .ballRotateChase){
//
//        self.startAnimating(CGSize(width: 60, height: 60), message: message, messageFont: nil, type: type, color: nil, padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: nil, textColor: nil)
//
//    }
//
//    func hideActivity(){
//
//        if self.isAnimating {
//            self.stopAnimating()
//        }
//
//    }
//
//}










// FIXME:--跳转
public extension UIViewController{
    
    func presentVC(vc:UIViewController) {
        
        self.present(vc, animated: true, completion: nil)
    }
    func dismissVC() {
        
        self.dismiss(animated: true, completion: nil)
    }
    func pushVC(vc:UIViewController) {
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func popVC(){
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func pushBackItem(title: String = "返回"){
        self.navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .done, target: nil, action: nil)
    }

}




//// MARK:--设置navigationBar
//extension UIViewController{
//
//    /**设置导航栏背景色、标题 */
//    func setupNavBar(){
//
//        //标题
//        let titleAttr = [NSAttributedString.Key.foregroundColor:UIColor.white]
//        navigationController?.navigationBar.titleTextAttributes = titleAttr
////        self.navigationController?.navigationBar.barTintColor = kSbjColor
//        self.navigationController?.navigationBar.tintColor = .white
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//
//    }
//
//    /**设置状态栏背景色 */
//    func setStatusBarBackgroudColor(color:UIColor){
//
//        let v = UIView(frame: .init(x: 0,y: 0,width: kWidth,height: 20))
//        v.backgroundColor = color
//        self.view.addSubview(v)
//
//    }
//
//
//}




//// MARK:--present返回
//extension UIViewController{
//    
//
//    public func pull_LeftPresent(){
//        
//        self.hero.isEnabled = true
////        self.hero.modalAnimationType = .selectBy(presenting: .pull(direction: .left), dismissing: .uncover(direction: .right))
//        view.hero.modifiers = [.translate(x: view.bounds.width), .duration(0.3), .beginWith(modifiers: [.zPosition(2)])]
//        self.hero.modalAnimationType = HeroDefaultAnimationType.autoReverse(presenting: .slide(direction: .left))
//
//    }
//    
//    
//    public func dismiss_edgePan(){
//        
//        let screenEdgePanGR = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handlePan(gr:)))
//        screenEdgePanGR.edges = .left
//        view.addGestureRecognizer(screenEdgePanGR)
//        
//    }
//    
//    @objc func handlePan(gr: UIPanGestureRecognizer) {
//        
//        
//        switch gr.state {
//        case .began:
//            dismiss(animated: true, completion: nil)
//            break
//        case .changed:
//            
////            let locationInSourceView = gr.location(in: Hero.shared.container)
////            let width = Hero.shared.container.bounds.width
////            let progress = locationInSourceView.x / width
//            
//            
//            
//            let progress = abs(gr.location(in: nil).x / view.bounds.width)
//            Hero.shared.update(progress)
//            
//        default:
//            if (gr.translation(in: nil).x + gr.velocity(in: nil).x) / view.bounds.width > 0.5 {
//                Hero.shared.finish()
//            } else {
//                Hero.shared.cancel()
//            }
//        }
//        
//        
//    }
//    
//    func hm_setupNavBack() {
//        
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: kNaviBackItemImgName), style: .done, target: self, action: #selector(hm_backItem))
//        
//    }
//    @objc func hm_backItem() {
//        
//        self.dismiss(animated: true, completion: nil)
//    }
//    
//    
//}
//

