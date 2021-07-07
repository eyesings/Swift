//
//  MemoListViewController.swift
//  RxMemo
//
//  Created by RadCns_KIM_TAEWON on 2021/07/06.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class MemoListViewController: UIViewController, ViewModelBindableType {
    
    var viewModel: MemoListViewModel!
    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func bindViewModel() {
        
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        viewModel.memoList
            .bind(to: listTableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: rx.disposeBag)
        
        addButton.rx.action = viewModel.makeCreateAction()
        
         Observable.zip(listTableView.rx.modelSelected(Memo.self), listTableView.rx.itemSelected)
             .do(onNext: { [unowned self] (_, indexpath) in
                 self.listTableView.deselectRow(at: indexpath, animated: true)
             })
             .map { $0.0 }
             .bind(to: viewModel.detailAction.inputs)
             .disposed(by: rx.disposeBag)
         
         listTableView.rx.modelDeleted(Memo.self)
             .bind(to: viewModel.deleteAction.inputs)
             .disposed(by: rx.disposeBag)
         
         
    }
    
}
