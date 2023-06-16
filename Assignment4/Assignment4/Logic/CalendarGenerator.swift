import Foundation

class CalendarGenerator {
  func generate(yearAndMonth: DateComponents) -> [[Int]]  {
      var cal = [[Int]](repeating: [Int](repeating: 0, count: 7), count: 6)
      var prevmon = yearAndMonth.month! - 1
      var year = yearAndMonth.year!
      var days = 0
      var prevdays = 0
      var before = 0
      
      
      var components = DateComponents()
      components.year = yearAndMonth.year
      components.month = yearAndMonth.month
      components.day = 1
      
      
      if (prevmon == 0) {
        prevmon = 12
        year -= 1
      }
      
      
      if let date = Calendar.current.date(from: components) {
          let range = Calendar.current.range(of: .day, in: .month, for: date)
          days = range!.count
          before = Calendar.current.component(.weekday, from: date)
      }
      
      let prevdate = DateComponents(year: year, month: prevmon)
      
      if let date = Calendar.current.date(from: prevdate) {
          let range = Calendar.current.range(of: .day, in: .month, for: date)
          prevdays = range!.count
      }
      
      var counter = prevdays - before + 2
      if (before == 1) {
        counter = 1
      }
      
      for i in 0..<7 {
        cal[0][i] = counter
        counter += 1
        if (counter > prevdays) {
          counter = 1
        }
      }
      
      for i in 1..<6 {
        for j in 0..<7 {
          cal[i][j] = counter
          counter += 1
          if (counter > days) {
            counter = 1
          }
        }
      }
      
      print(cal)
      
          return cal
  }
}

/*
 /*
 #######################################################################
 #
 # Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 #
 # You may not use, distribute, publish, or modify this code without
 # the express written permission of the copyright holder.
 #
 #######################################################################
 */

 import java.time.YearMonth

 class CalendarArray {
   /**
    * See assignment specification.
    */



   fun generate(month: YearMonth): Array<IntArray> {


     val cal = Array(6) { IntArray(7) }
     var prevmon = month.month.value - 1
     var year = month.year
     if (prevmon == 0) {
       prevmon = 12
       year -= 1
     }
     val prev = YearMonth.of(year, prevmon)
     val days = month.lengthOfMonth()
     val prevdays = prev.lengthOfMonth()
     val before = month.atDay(1).dayOfWeek.value % 7



     var counter = prevdays - before + 1
     if (before == 0) {
       counter = 1
     }
     println(counter)
     // var cal = Array(6, { IntArray(7) })
     for (i in 0..6) {
       cal[0][i] = counter
       counter += 1
       if (counter > prevdays) {
         counter = 1
       }
     }
     for (i in 1..5) {
       for (j in 0..6) {
         cal[i][j] = counter
         counter += 1
         if (counter > days) {
           counter = 1
         }
       }
     }
    /* for (x in cal){
       for (y in x){
         print(y)
         print(" ")
       }
       println()
     }*/
     return cal
   }
 }
 */
