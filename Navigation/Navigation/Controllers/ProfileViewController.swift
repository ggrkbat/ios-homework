//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Денис Ярошко on 29.01.2023.
//

import UIKit

final class ProfileViewController: UIViewController {


    let headerIdent = "header"
    let photoIdent = "photo"
    let postIdent = "post"

    private lazy var postTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: headerIdent)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: photoIdent)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: postIdent)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.view.addSubview(self.postTableView)
        self.drawSelf()
        postTableView.dataSource = self
        postTableView.delegate = self
        postTableView.refreshControl = UIRefreshControl()
        postTableView.refreshControl?.addTarget(self, action: #selector(reloadTableView), for: .valueChanged)

    }

        private func drawSelf() {
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
        case 0: return 1
        case 1: return postMassive.count
        default:
            assertionFailure("Незарег")
            return 1
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

extension ProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = self.postTableView.dequeueReusableCell(withIdentifier: self.photoIdent, for: indexPath) as! PhotosTableViewCell
            return cell
        case 1:
            let cell = self.postTableView.dequeueReusableCell(withIdentifier: self.postIdent, for: indexPath) as! PostTableViewCell
            cell.postArray(post: postMassive[indexPath.row])
            return cell
        default:
            assertionFailure("незарег")
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: self.headerIdent) as! ProfileHeaderView
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 220 : 0
    }

    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            tableView.deselectRow(at: indexPath, animated: false)
            navigationController?.pushViewController(PhotosViewController(), animated: true)
        case 1:
            guard let cell = tableView.cellForRow(at: indexPath) else { return }
            if let post = cell as? PostTableViewCell {
                post.incrementPostViewsCounter()
            }
        default:
            assertionFailure("незарег")
        }
    }
}
