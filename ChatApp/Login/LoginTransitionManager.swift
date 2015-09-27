import UIKit

class LoginTransitionManager: NSObject {

  private var presenting = true

  func presentAnimation(mainController: LoginMainViewController, loginController: LoginViewController, show: Bool) {
    if show {
      loginController.view.alpha = 1
      loginController.view.transform = CGAffineTransformIdentity
    } else {
      loginController.view.alpha = 0
      loginController.view.transform = CGAffineTransformMakeScale(3, 3)
    }
  }

  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    guard let container = transitionContext.containerView() else { return }

    let duration = transitionDuration(transitionContext)
    let screens : (from: UIViewController, to: UIViewController) =
    (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!,
      transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)

    let mainViewController = !presenting ? screens.to as! LoginMainViewController
      : screens.from as! LoginMainViewController
    let loginViewController = !presenting ? screens.from as! LoginViewController
      : screens.to as! LoginViewController

    let mainView = mainViewController.view
    let loginView = loginViewController.view

    if presenting { presentAnimation(mainViewController, loginController: loginViewController, show: false) }

    container.addSubview(mainView)
    container.addSubview(loginView)

    UIView.animateWithDuration(duration, animations: {
      self.presentAnimation(mainViewController, loginController: loginViewController, show: self.presenting)
      }, completion: { _ in
        transitionContext.completeTransition(true)
        UIApplication.sharedApplication().keyWindow!.addSubview(screens.to.view)
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