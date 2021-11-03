import Foundation

extension NSObject {

    // MARK: Date Conversion Methods
    /*@Params: date -> Date, dateFormat -> String
     @Usage: convert date to string */
    func dateToString(date: Date, dateFormat: String) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = dateFormat
        let dateStr = dateFormater.string(from: date)
        return dateStr
    }

    /*@Params: date -> String , dateFormat and convertDateFormat -> String
     @Usage: Convert date string into Date using dateFomrat*/
    func convertDateToProperDateFormat(date: String, dateFormat: String, convertDateFormat: String) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = dateFormat
        guard let getDate = dateFormater.date(from: date) else { return "" }
        return dateToString(date: getDate, dateFormat: convertDateFormat)
    }

}
