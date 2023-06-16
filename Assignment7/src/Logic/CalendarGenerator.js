/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */

export default class {
  /**
   * @param {object} date
   * @return {[[Number]]} 6x7 array of integers
   */

  static generate(date) {
    console.log('Date');
    let cal = [];
    let month = date.getMonth();
    console.log('Month');
    console.log(month);
    let monGen = month + 1;
    let year = date.getFullYear();
    console.log('Year');
    console.log(year);
    let GetFirst = new Date(year, month, 1);

    let before = GetFirst.getDay();

    console.log('Day of the week');
    console.log(before);

    let prevyear = year;
    let prevmonth = date.getMonth() - 1;

    if (monGen > 11) {
      monGen = 0;
      year = year + 1;
    }
    let curr = new Date(year, monGen, 0);
    let days = curr.getDate();
    if (prevmonth <= 0) {
      prevmonth = 11;
      prevyear = year - 1;
      console.log('Jan');
    }

    let PrevGen = prevmonth + 1;

    if (PrevGen > 11) {
      PrevGen = 0;
      prevyear = prevyear + 1;
    }

    let prevdate = new Date(prevyear, PrevGen, 0);
    let prevdays = prevdate.getDate();
    console.log('Prevdays');
    console.log(prevdays);

    let counter = prevdays - before + 1;
    if (before === 0) {
      counter = 1;
    }

    console.log('counter');
    console.log(counter);
    for (let i = 0; i < 6; i++) {
      cal[i] = [];
    }

    for (let i = 0; i < 7; i++) {
      cal[0][i] = counter;
      counter += 1;
      if (counter > prevdays) {
        counter = 1;
      }
    }

    for (let i = 1; i < 6; i++) {
      for (let j = 0; j < 7; j++) {
        cal[i][j] = counter;
        counter += 1;
        if (counter > days) {
          counter = 1;
        }
      }
    }

    return cal;
  }
}
