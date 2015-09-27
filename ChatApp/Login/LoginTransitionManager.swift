import UIKit

class LoginTransitionManager: NSObject {

  private var presenting = true

  func presentAnimation(toViewController: UIViewController, show: Bool) {
    toViewController.view.alpha = show ? 1 : 0
    toViewController.view.transform = show ? CGAffineTransformIdentity : CGAffineTransformMakeScale(2, 2)
  }

  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    guard let container = transitionContext.containerView() else { return }

    let duration = transitionDuration(transitionContext)
    let screens : (from: UIViewController, to: UIViewController) =
    (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!,
      transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)

    let mainViewController = !presenting ? screens.to : screens.from
    let toViewController = !presenting ? screens.from : screens.to

    let mainView = mainViewController.view
    let loginView = toViewController.view

    if presenting { presentAnimation(toViewController, show: false) }

    container.addSubview(mainView)
    container.addSubview(loginView)

    UIView.animateWithDuration(duration, animations: {
      self.presentAnimation(toViewController, show: self.presenting)
      }, completion: { _ in
        transitionContext.completeTransition(true)
        UIApplication.sharedApplication().keyWindow!.addSubview(screens.to.view)
    })
  }
}

extension LoginTransitionManager: UIViewControllerAnimatedTransitioning {

  func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
    return 0.475
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