import Foundation
open class DateHelper {
    
    static let shared = DateHelper()
    private init() {}
    
    // MARK: - ------------------------------- Date ---------------------------------
    
    /// Cases of the date formate
    ///
    /// - MMMMddYYYYWithTime: OCT 10, 2019 at 12:32 am
    /// - ddmmyyyyWithTime: 23/10/2019 at 12:32 am
    /// - Author: Abdullah Alhaider
    enum DateFormat: String {
        
        case MMMMddYYYYWithTime = "MMMM dd, yyyy 'at' h:mm a"
        case ddmmyyyyWithTime = "dd/MM/yyyy 'at' h:mm a"
        case YYYYMMDD = "yyyyMMdd"
        case yyyyMMddHHmmss = "yyyyMMddHHmmss"
        case expiryDateWithTimeZone = "yyyyMMdd'T'HH-mm-ssZ"
        case ddMMyyyy = "dd-MM-yyyy"
        
        /*
         we can add as many format as we want
         and if you not familiar with other date format you can use this website
         to pick your best format http://nsdateformatter.com
         */
    }
    
    /// Getting the current date in selected format
    ///
    /// - Parameter format: date format
    /// - Returns: the current date in the selected format
    /// - Author: Abdullah Alhaider
    func getCurrentDate(format: DateFormat = .ddmmyyyyWithTime) -> String {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = format.rawValue // from enum dateFormat
        let formatedDate = formatter.string(from: date)
        
        return formatedDate
    }
    
    /// Getting the current date by passing your custom date format
    ///
    /// - Parameter formatToUse: your custom date format
    /// - Returns: current date
    /// - Author: Abdullah Alhaider
    func getCurrentDateUsingThisFormat(_ formatToUse: String = "dd/MM/yyyy 'at' h:mm a") -> String {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = formatToUse
        let formatedDate = formatter.string(from: date)
        
        return formatedDate
    }
    
    func getDateFromString(_ dateStr: String, format: DateFormat = .YYYYMMDD) -> Date {
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = format.rawValue // from enum dateFormat
        return formatter.date(from: dateStr) ?? Date()
    }

    func getRemainingDays(_ dateStr: String, format: DateFormat = .yyyyMMddHHmmss) -> Int? {
        
        let toDate = getDateFromString(dateStr, format: format)
        let fromDate = Date()
        
        guard let remainingDays = Calendar.current.dateComponents([.day], from: fromDate, to: toDate).day else { return nil }
        
        return remainingDays
        
    }
}

