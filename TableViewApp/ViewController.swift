import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var tableView: UITableView!
    var superKahramanIsimleri = [String]()
    var superKahramanGorselIsimleri = [String]()
    var secilenIsim = ""
    var secilenGorsel = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Super Heroes"
        tableView.delegate = self
        tableView.dataSource = self
        
        superKahramanIsimleri.append("Batman")
        superKahramanIsimleri.append("Flash")
        superKahramanIsimleri.append("Superman")
        
        superKahramanGorselIsimleri.append("batman")
        superKahramanGorselIsimleri.append("flash")
        superKahramanGorselIsimleri.append("superman")
        
    }
    
    // TableView cell/row sayısı
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return superKahramanIsimleri.count
    }
    
    // TableView rowların tanımı, rowlarda ne olduğu
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell();
        cell.textLabel?.text = superKahramanIsimleri[indexPath.row]
        return cell;
    }

    // EditingStyle (burada sağa kaydırarak silme eylemi) tanımlanması
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            superKahramanIsimleri.remove(at: indexPath.row)
            superKahramanGorselIsimleri.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    // Row seçme/basma eylemi (burada seçilen isim ve görsel ismi çekilerek segue yapılacak)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        secilenIsim = superKahramanIsimleri[indexPath.row]
        secilenGorsel = superKahramanGorselIsimleri[indexPath.row]
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    // Segue methodu (burada diğer VC'ye erişilerek oradaki label/foto buradan çektiğimiz yapılıyor)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "toDetailsVC"
        {
            let destinationVC = segue.destination as! DetailsVC
            
            destinationVC.secilenKahramanIsmi = secilenIsim
            destinationVC.secilenKahramanGorselIsmi = secilenGorsel
        }
    }
}


