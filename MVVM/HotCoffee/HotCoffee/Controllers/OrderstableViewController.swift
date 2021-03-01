//
//  OrderstableViewController.swift
//  HotCoffee
//
//  Created by Kim Tae won on 2021/02/27.
//

import Foundation
import UIKit

class OrderstableViewController: UITableViewController, AddCoffeeOrderDelegate {
    
    
    var orderListViewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    //delegate functions of AddCoffeeOrderDelegate
    func addCoffeeOrderBViewControllerDidSave(order: Order, controller: UIViewController) {
        
        controller.dismiss(animated: true, completion: nil)
        
        let orderVM = OrderViewModel(order: order)
        self.orderListViewModel.orderViewModel.append(orderVM)
        self.tableView.insertRows(at: [IndexPath.init(row: self.orderListViewModel.orderViewModel.count - 1, section: 0)], with: .automatic)
    }
    
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    private func populateOrders() {
        
        Webservice().load(resource: Order.all ) { ( result) in
            
            switch result {
            case .success(let orders):
                print("orders::\(orders)")
                print("orders.map::\(orders.map(OrderViewModel.init))")
                self.orderListViewModel.orderViewModel = orders.map(OrderViewModel.init)
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let navC = segue.destination as? UINavigationController,
              let addCoffeeOrderVC = navC.viewControllers.first as? AddOrderViewController else {
            fatalError("Error performing segue")
        }
        
        addCoffeeOrderVC.delegate = self
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.orderViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        
        cell.textLabel?.text = vm.type
        cell.detailTextLabel?.text = vm.size
    
        return cell
        
    }
}
 
