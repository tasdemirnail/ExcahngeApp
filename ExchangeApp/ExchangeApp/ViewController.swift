//
//  ViewController.swift
//  ExchangeApp
//
//  Created by Nail on 24.04.23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usdLbl: UILabel!
    
    @IBOutlet weak var gbpLbl: UILabel!
    @IBOutlet weak var chfLbl: UILabel!
    @IBOutlet weak var cadLbl: UILabel!
    @IBOutlet weak var audLbl: UILabel!
    @IBOutlet weak var eurLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func getButton(_ sender: Any) {
        let url = URL(string: "https://api.freecurrencyapi.com/v1/latest?apikey=6NXey2VpTVV4OJBx76XtJyi8YoZke4xUWpXTNzZI")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data,response,error in
            if error != nil {
                print("error")
            }else{
                if data != nil {
                    do {
                        let jsonResponse  = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
                        
                        DispatchQueue.main.async {
                            if let main = jsonResponse!["data"] as? [String:Any] {
                                if let usd = main["USD"] as? Double {
                                    self.usdLbl.text = String(usd)
                                    self.usdLbl.isHidden = false
                                    
                                }
                                if let eur = main["EUR"] as? Double {
                                    self.eurLbl.text = String(eur)
                                    self.eurLbl.isHidden = false
                                }
                                if let cad = main["CAD"] as? Double {
                                    self.cadLbl.text = String(cad)
                                    self.cadLbl.isHidden = false
                                }
                                if let chf = main["CHF"] as? Double {
                                    self.chfLbl.text = String(chf)
                                    self.chfLbl.isHidden = false
                                }
                                if let aud = main["AUD"] as? Double {
                                    self.audLbl.text = String(aud)
                                    self.audLbl.isHidden = false
                                }
                                if let gbp = main["GBP"] as? Double {
                                    self.gbpLbl.text = String(gbp)
                                    self.gbpLbl.isHidden = false
                                }
                            }
                        }
                    }catch {
                        
                    }
                }
            }
        }
        task.resume()
    }
}


