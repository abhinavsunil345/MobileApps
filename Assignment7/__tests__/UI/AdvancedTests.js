/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */

import React from 'react';
import {
  render,
  screen,
  fireEvent,
  waitFor,
} from '@testing-library/react-native';

import CalendarGeneratorView from '../../src/UI/CalendarGeneratorView';

import App from '../../App';

it('Renders', async () => {
  render(<App />);
});

it('Next Button January', async () => {
  render(<CalendarGeneratorView />);
  const month = screen.getByLabelText('month');
  const expectedContent = 'January 2024';
  while (!screen.queryByText(expectedContent)) {
    fireEvent.press(screen.getByLabelText('next'));
    await waitFor(() => screen.getByLabelText('calendar'));
  }
  expect(month.children[0]).toBe(expectedContent);
  expect(screen.getByLabelText('calendar').children[0]).toMatch(
    '31  1  2  3  4  5  6\n 7  8  9 10 11 12 13\n14 15 16 17 18 19 20\n21 22 23 24 25 26 27\n28 29 30 31  1  2  3\n 4  5  6  7  8  9 10',
  );
});

it('Prev Button January', async () => {
  render(<CalendarGeneratorView />);
  const month = screen.getByLabelText('month');
  const expectedContent = 'December 2022';
  while (!screen.queryByText(expectedContent)) {
    fireEvent.press(screen.getByLabelText('previous'));
    await waitFor(() => screen.getByLabelText('calendar'));
  }
  expect(month.children[0]).toBe(expectedContent);
  expect(screen.getByLabelText('calendar').children[0]).toMatch(
    '27 28 29 30  1  2  3\n 4  5  6  7  8  9 10\n11 12 13 14 15 16 17\n18 19 20 21 22 23 24\n25 26 27 28 29 30 31\n 1  2  3  4  5  6  7',
  );
});

it('Prev Button Today', async () => {
  render(<CalendarGeneratorView />);
  const month = screen.getByLabelText('month');
  const expectedContent = 'December 2022';
  while (!screen.queryByText(expectedContent)) {
    fireEvent.press(screen.getByLabelText('previous'));
  }

  fireEvent.press(screen.getByLabelText('today'));
  expect(month.children[0]).toBe('May 2023');
  expect(screen.getByLabelText('calendar').children[0]).toMatch(
    '30  1  2  3  4  5  6\n 7  8  9 10 11 12 13\n14 15 16 17 18 19 20\n21 22 23 24 25 26 27\n28 29 30 31  1  2  3\n 4  5  6  7  8  9 10',
  );
});
