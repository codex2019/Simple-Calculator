//
//  ResultsViewController.swift
//  JobSearch
//
//  Created by MacX on 5/4/21.
//

import UIKit
import Firebase

class ResultsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var jobsManager = JobsManager()
    var jobTitle = ""
    var location = ""
    var applyUrl = ""
    var jobs = [JobData]()
    var fromView = ""
    
    override func viewDidLoad() {
        jobsManager.delegate = self
        jobsManager.fetchJobs(titleName: jobTitle, viewName: fromView)
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "JobCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToApply" {
            let destinationVC = segue.destination as! ApplyViewController
            destinationVC.applyUrl = applyUrl
        }
    }
    
}

extension ResultsViewController: JobsManagerDelegate {
    func didUpdateResult(jobResult: [JobData]) {
        for job in jobResult {
            jobs.append(JobData(title: job.title, company: job.company, location: job.location, how_to_apply: job.how_to_apply, created_at: job.created_at))
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

extension ResultsViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! JobCell
        cell.title.text = jobs[indexPath.row].title
        cell.company.text = jobs[indexPath.row].company
        cell.location.text = jobs[indexPath.row].location
        cell.created_at.text = jobs[indexPath.row].created_at
        cell.buttonAction = {(cell) in
            let url = self.jobs[indexPath.row].how_to_apply
            let newUrl = url.components(separatedBy: "\"")
            self.applyUrl = newUrl[1]
            self.performSegue(withIdentifier: "goToApply", sender: self)
        }
        return cell
    }
}



