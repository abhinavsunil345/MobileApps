/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */

import CalendarGenerator from '../../src/Logic/CalendarGenerator';

const evaluate = (date, expected) => {
  const cal = CalendarGenerator.generate(date);
  console.log(cal);
  expect(cal).toStrictEqual(expected);
};

test('May 2023', () => {
  const expected = [
    [30, 1, 2, 3, 4, 5, 6],
    [7, 8, 9, 10, 11, 12, 13],
    [14, 15, 16, 17, 18, 19, 20],
    [21, 22, 23, 24, 25, 26, 27],
    [28, 29, 30, 31, 1, 2, 3],
    [4, 5, 6, 7, 8, 9, 10],
  ];
  let date = new Date('2023-05-23');
  evaluate(date, expected);
});

test('Jan 2022', () => {
  let date = new Date(2022, 0, 1);
  const expected = [
    [26, 27, 28, 29, 30, 31, 1],
    [2, 3, 4, 5, 6, 7, 8],
    [9, 10, 11, 12, 13, 14, 15],
    [16, 17, 18, 19, 20, 21, 22],
    [23, 24, 25, 26, 27, 28, 29],
    [30, 31, 1, 2, 3, 4, 5],
  ];
  evaluate(date, expected);
});

test('Start on Sunday', () => {
  let date = new Date(2023, 0, 1);
  const expected = [
    [1, 2, 3, 4, 5, 6, 7],
    [8, 9, 10, 11, 12, 13, 14],
    [15, 16, 17, 18, 19, 20, 21],
    [22, 23, 24, 25, 26, 27, 28],
    [29, 30, 31, 1, 2, 3, 4],
    [5, 6, 7, 8, 9, 10, 11],
  ];
  evaluate(date, expected);
});

test('Dec 2022', () => {
  let date = new Date(2022, 11, 31);
  const expected = [
    [27, 28, 29, 30, 1, 2, 3],
    [4, 5, 6, 7, 8, 9, 10],
    [11, 12, 13, 14, 15, 16, 17],
    [18, 19, 20, 21, 22, 23, 24],
    [25, 26, 27, 28, 29, 30, 31],
    [1, 2, 3, 4, 5, 6, 7],
  ];
  evaluate(date, expected);
});
