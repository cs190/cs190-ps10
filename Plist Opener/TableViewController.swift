//
//  TableViewController.swift
//  Plist Opener
//
//  Created by Brian Hill on 5/2/16.
//

import UIKit


enum TitledPlistReaderError: ErrorType {
    case FileDoesNotExist
    case BadPlist
    case UntitledPlist
}

class TableViewController: UITableViewController {
    
    let plistFilenames = ["good", "untitled", "malformed", "nonexistent"]
    
    // This function will throw unless it can extract a title from the plist.
    // For the types of throws, see TitledPlistReaderError.
    func titleForPlist(plistFilename: String) throws -> String {
        let plistPath = NSBundle.mainBundle().pathForResource(plistFilename, ofType: "plist")
        if plistPath == nil || !NSFileManager.defaultManager().fileExistsAtPath(plistPath!) {
            throw TitledPlistReaderError.FileDoesNotExist
        }
        guard let plist = NSDictionary(contentsOfFile: plistPath!) as! Dictionary<String, String>? else {
            throw TitledPlistReaderError.BadPlist
        }
        guard let plistTitle = plist["title"] else {
            throw TitledPlistReaderError.UntitledPlist
        }
        return plistTitle
    }
    
    @IBAction func back(segue: UIStoryboardSegue) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plistFilenames.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlistFilenameCell", forIndexPath: indexPath)
        cell.textLabel!.text = plistFilenames[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("ShowTitleSegue", sender: tableView)
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let tableView = sender as! UITableView
        let row = tableView.indexPathForSelectedRow!.row
        let plistFilename = plistFilenames[row]
        let plistTitle = (try? titleForPlist(plistFilename)) ?? "<No Title Found!>"
        let destinationViewController = segue.destinationViewController as! TitleViewController
        destinationViewController.plistTitle = plistTitle
    }

}
