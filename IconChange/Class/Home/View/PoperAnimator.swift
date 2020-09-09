//
//  PoperAnimator.swift
//  IconChange
//
//  Created by 2020 on 2020/9/4.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit

class PoperAnimator: NSObject {
     var presentedFrame : CGRect = CGRect.zero
     var isPresented : Bool = false
}
//MARK: ------- 设置转场动画
extension PoperAnimator : UIViewControllerTransitioningDelegate {
    //改变弹出试图尺寸
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentation = PresentationController(presentedViewController: presented, presenting: presenting)
        presentation.presetedFrame = presentedFrame
        return presentation
        
    }
//   //自定义弹出动画
//   func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        isPresented = true
//       return self
//   }
//   //自定义消失动画
//   func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        isPresented = true
//       return self
//   }
}
//MARK: ------- 弹出和消失的代理方法
//extension PoperAnimator : UIViewControllerAnimatedTransitioning {
////    动画执行时间
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return 0.5
//    }
////    获取转场上下文:transitionContext 可以通过转场上下文获取弹出view和消失的view
////    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
////        isPresented ? animationForPresented(transitionContext: transitionContext) : animationDismissView(transitionContext: transitionContext)
////    }
////
////    //自定义弹出
////    fileprivate func animationForPresented(transitionContext: UIViewControllerContextTransitioning) {
//////          1.获取弹出view
//////        UITransitionContextFromViewKey,  获取消失的view
//////        UITransitionContextToViewKey : 获取弹出view
////        guard let presentView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
//////        将弹出view添加到containerView中
////        transitionContext.containerView.addSubview(presentView)
//////        直接执行动画
////        presentView.transform = CGAffineTransform(scaleX: 1.0, y: 0.0)
////        presentView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
////        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
////            presentView.transform = CGAffineTransform.identity
////        }) { (isFinshed) in
////            //告诉转场上下文完成动画
////            transitionContext.completeTransition(true)
////        }
////    }
//////    自定义消失
////    fileprivate func animationDismissView(transitionContext: UIViewControllerContextTransitioning){
//////          1.获取消失view
//////        UITransitionContextFromViewKey,  获取消失的view
//////        UITransitionContextToViewKey : 获取弹出view
////        guard let dismissView = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }
//////        直接执行动画
////        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
////            dismissView.transform = CGAffineTransform(scaleX: 1.0, y: 0.00001)  //临界值处理不好,直接写0.0会直接消失
////        }) { (isFinshed) in
////            dismissView.removeFromSuperview()
////            //告诉转场上下文完成动画
////            transitionContext.completeTransition(true)
////        }
////    }
//}

