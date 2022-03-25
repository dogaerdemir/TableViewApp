import UIKit

class DetailsVC: UIViewController
{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var isimLabel: UILabel!
    var secilenKahramanIsmi = ""
    var secilenKahramanGorselIsmi = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: secilenKahramanGorselIsmi)
        isimLabel.text = secilenKahramanIsmi
    }
}
