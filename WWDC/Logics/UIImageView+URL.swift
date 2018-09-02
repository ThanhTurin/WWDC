import UIKit
import AlamofireImage

extension UIImageView {

  func setImage(with url: URL?) {
    if let url = url {
      af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "video_placeholder"))
    }
    else {
      image = #imageLiteral(resourceName: "video_placeholder")
    }
  }

}
