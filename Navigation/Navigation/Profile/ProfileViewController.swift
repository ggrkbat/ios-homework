//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Денис Ярошко on 29.01.2023.
//

import UIKit

class ProfileViewController: UIViewController {


    let headerId = "headerViewID"
    let postId = "postViewCellID"

    private lazy var postTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: headerId)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: postId)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(reloadTableView), for: .valueChanged)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6

        self.drawSelf()

    }

        private func drawSelf() {
            self.view.addSubview(self.postTableView)

                NSLayoutConstraint.activate([

                    self.postTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                    self.postTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
                    self.postTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
                    self.postTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),

               ])
        }

    @objc func reloadTableView() {
        self.postTableView.reloadData()
        self.postTableView.refreshControl?.endRefreshing()
    }

    }

    //MARK: - Extensions

extension ProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return postMassive.count
        default:
            assertionFailure("no registered section")
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = self.postTableView.dequeueReusableCell(withIdentifier: self.postId, for: indexPath) as! PostTableViewCell
            cell.postArray(post: postMassive[indexPath.row])
            return cell
        default:
            assertionFailure("no registered section")
            return UITableViewCell()
      }
   }
}

extension ProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: self.headerId) as! ProfileHeaderView
        return headerView
    }

   

}
