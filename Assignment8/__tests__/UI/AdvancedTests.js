// Your Advanced tests go here

import React from 'react';
import {
  render,
  screen,
  fireEvent,
  cleanup,
} from '@testing-library/react-native';

import App from '../../App';
it('This whole file needs replacing with some real tests!', async () => {
  expect(true).toBe(true);
});

it('Workspace Seconds', async () => {
  render(<App />);
  await screen.findByText('Test Workspace');
  await screen.queryByText(/seconds/i);
});

it('Workspace Minutes', async () => {
  render(<App />);
  await screen.findByText('Test Workspace2');
  await screen.queryByText(/minutes/i);
});

it('Workspace Hours', async () => {
  render(<App />);
  await screen.findByText('Test Workspace3');
  await screen.queryByText(/hours/i);
});

it('Channel Seconds', async () => {
  render(<App />);
  fireEvent.press(await screen.findByText('Test Workspace'));
  await screen.findByText('Test Channel');
  await screen.queryByText(/seconds/i);
  cleanup();
});

it('Channel Minutes', async () => {
  render(<App />);
  fireEvent.press(await screen.findByText('Test Workspace2'));
  await screen.findByText('Test Channel2');
  await screen.queryByText(/minutes/i);
  cleanup();
});

it('Channel Hours', async () => {
  render(<App />);
  fireEvent.press(await screen.findByText('Test Workspace3'));
  await screen.findByText('Test Channel3');
  await screen.queryByText(/hours/i);
  cleanup();
});

it('No Messages', async () => {
  render(<App />);
  fireEvent.press(await screen.findByText('Electrical'));
  await screen.findByText('HVAC');
  cleanup();
});
