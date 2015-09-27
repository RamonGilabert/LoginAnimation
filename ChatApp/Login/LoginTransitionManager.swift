import UIKit

class LoginTransitionManager: NSObject {

  private var presenting = true

  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    let container = transitionContext.containerView()
    let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
    let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!

    toView.transform = self.presenting ? CGAffineTransformMakeScale(2, 2) : CGAffineTransformIdentity

    container!.addSubview(toView)
    container!.addSubview(fromView)

    UIView.animateWithDuration(0.5, animations: {
      fromView.transform = self.presenting ? CGAffineTransformMakeScale(2, 2) : CGAffineTransformIdentity
      toView.transform = CGAffineTransformIdentity
      }, completion: { finished in
        transitionContext.completeTransition(true)
    })
  }
}

extension LoginTransitionManager: UIViewControllerAnimatedTransitioning {

  func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
    return 0.75
  }
}

extension LoginTransitionManager: UIViewControllerTransitioningDelegate {

  func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    self.presenting = true
    return self
  }

  func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    self.presenting = false
    return self
  }
}