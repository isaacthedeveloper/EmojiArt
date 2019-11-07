//
//  EmojiArtDocumentTableViewController.swift
//  EmojiArt
//
//  Created by Isaac Ballas on 2019-11-06.
//  Copyright © 2019 Isaacballas. All rights reserved.
//

import UIKit

class EmojiArtDocumentTableViewController: UITableViewController {
    var emojiArtDocuments = ["One", "Two", "Three"]
    
    
    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiArtDocuments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DocumentCell", for: indexPath)
        cell.textLabel?.text = emojiArtDocuments[indexPath.row]
        return cell
    }
    
    // MARK: - Actions
    @IBAction func newEmojiArt(_ sender: UIBarButtonItem) {
        emojiArtDocuments += ["Untitled".madeUnique(withRespectTo: emojiArtDocuments)] // This makes it so if two items are the same name it will add 1, 2, and so on at the end of it so they are not hte same name and it will no longer be confusing to the user.
        tableView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // Control the master part of master-detail
        // With this, you can swipe the master out of the way
        if splitViewController?.preferredDisplayMode != .primaryOverlay {
            splitViewController?.preferredDisplayMode = .primaryOverlay
        }
    }
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            emojiArtDocuments.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the class, and insert it into the array and add a new row to the table view.
        }
    }
}
