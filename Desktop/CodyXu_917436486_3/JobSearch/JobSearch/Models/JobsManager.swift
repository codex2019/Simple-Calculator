//
//  JobsManager.swift
//  JobSearch
//  https://jobs.github.com/api
//  Created by MacX on 5/8/21.
//

import Foundation

protocol JobsManagerDelegate {
    func didUpdateResult(jobResult : [JobData])
    func didFailWithError(error: Error)
}

struct JobsManager {
    
    let jobsURL = "https://jobs.github.com/positions.json?page=1"
    
    var delegate: JobsManagerDelegate?
    
    func fetchJobs(titleName: String, viewName: String) {
        let newTitle = titleName.replacingOccurrences(of: " ", with: "%20", range: nil)
        let urlString = "\(jobsURL)&description=\(newTitle)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }

                if let safeData = data {
                    if let jobResult = self.parseJSON(jobData: safeData) {
                        self.delegate?.didUpdateResult(jobResult: jobResult)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(jobData: Data) -> [JobData]? {
        let decoder = JSONDecoder()

        do {
            let decodedData = try decoder.decode([JobData].self, from: jobData)
            var jobResult = [JobData]()
            for data in decodedData {
                let job = JobData(title: data.title, company: data.company, location: data.location, how_to_apply: data.how_to_apply, created_at: data.created_at)
                jobResult.append(job)
            }
            
            return jobResult;
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
