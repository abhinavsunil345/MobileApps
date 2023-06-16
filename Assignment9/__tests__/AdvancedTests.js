/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */

/* **************************************************************************
 * Must be using Node.js Version 18 or above
 * **************************************************************************/

/* **************************************************************************
 * Use your own username and password for these tests
 * **************************************************************************/

const cruzid = 'aksunil@ucsc.edu';
const studentid = '1921683';

/* **************************************************************************
 * DO NOT MODIFY THIS FILE BELOW HERE
 * **************************************************************************/

import React from 'react';
import {
  render,
  screen,
  fireEvent,
  cleanup,
  waitFor,
  waitForElementToBeRemoved,
} from '@testing-library/react-native';

import App from '../App';

const login = (email = cruzid, password = studentid) => {
  render(<App />);
  fireEvent.changeText(screen.getByLabelText('email'), email);
  fireEvent.changeText(screen.getByLabelText('password'), password);
  fireEvent.press(screen.getByLabelText('login'));
};

const waitForTextThenClick = async text => {
  await waitFor(() => screen.getByText(text));
  fireEvent.press(screen.getByText(text));
};

const waitForLabelTextThenClick = async labelText => {
  await waitFor(() => screen.getByLabelText(labelText));
  fireEvent.press(screen.getByLabelText(labelText));
};

const waitForFirstLabelTextThenClick = async labelText => {
  await waitFor(() => screen.getAllByLabelText(labelText));
  fireEvent.press(screen.getAllByLabelText(labelText)[0]);
};

/*
 * Log in
 * Add a workspace
 * Assert workspace exists
 * Delete the workspace
 * Assert workspace does not exist
 */

it('Add Workspace', async () => {
  // add a workspace
  let workspaceName = 'Test Workspace';
  login();
  await waitForLabelTextThenClick('add workspace');
  fireEvent.changeText(screen.getByLabelText('name'), workspaceName);
  fireEvent.press(screen.getByLabelText('add'));
  await screen.findByText(workspaceName);
  // delete the workspace
  fireEvent(screen.getByText(workspaceName), 'swipeableRightOpen');
  await waitForFirstLabelTextThenClick(`delete ${workspaceName}`);
  await waitForElementToBeRemoved(() => screen.getByText(workspaceName));
  cleanup();
});

/*
 * Log in
 * Start to add a workspace
 * Cancel
 * Assert back at workspace list
 */

it('Add Workspace Cancel', async () => {
  login();
  await waitForLabelTextThenClick('add workspace');
  await waitForTextThenClick('Cancel');
  cleanup();
});

/*
 * Log in
 * Start to add a workspace
 * Navigate backwards
 * Assert back at workspace list
 */

it('Returns to Workspaces with Back Navigation', async () => {
  login();
  await waitForLabelTextThenClick('add workspace');
  await waitForLabelTextThenClick('back to workspaces');
  cleanup();
});

/*
 * Log in
 * Add a workspace
 * Select the workspace
 * Add a channel
 * Assert channel exists
 * Delete the channel
 * Assert channel does not exist
 * Delete the workspace
 */

it('Add Delete Channel', async () => {
  let name = 'rgfcerdfd';
  let cname = 'trgvetrg';
  login();
  await waitForLabelTextThenClick('add workspace');
  fireEvent.changeText(screen.getByLabelText('name'), name);
  fireEvent.press(screen.getByLabelText('add'));
  await waitFor(() => screen.getByLabelText('add workspace'));
  await waitForTextThenClick(name);
  await waitForLabelTextThenClick('add channel');
  fireEvent.changeText(screen.getByLabelText('name'), cname);
  fireEvent.press(screen.getByLabelText('add'));
  await waitFor(() => screen.getByText(cname));
  fireEvent(screen.getByText(cname), 'swipeableRightOpen');
  await waitForFirstLabelTextThenClick(`delete ${cname}`);
  await waitForElementToBeRemoved(() => screen.getByText(cname));
  await waitForLabelTextThenClick('back to workspaces');
  fireEvent(screen.getByText(name), 'swipeableRightOpen');
  await waitForFirstLabelTextThenClick(`delete ${name}`);
  await waitForElementToBeRemoved(() => screen.getByText(name));
  cleanup();
});

/*
 * Log in
 * Add a workspace
 * Start to add a channel
 * Cancel
 * Assert back at channel list
 * Delete the workspace
 */

it('Cancel ADD Channel', async () => {
  let name = 'ugnbtyr';
  login();
  await waitForLabelTextThenClick('add workspace');
  fireEvent.changeText(screen.getByLabelText('name'), name);
  fireEvent.press(screen.getByLabelText('add'));
  await waitFor(() => screen.getByLabelText('add workspace'));
  await waitForTextThenClick(name);
  await waitForLabelTextThenClick('add channel');
  await waitForTextThenClick('Cancel');
  await waitForLabelTextThenClick('back to workspaces');
  fireEvent(screen.getByText(name), 'swipeableRightOpen');
  await waitForFirstLabelTextThenClick(`delete ${name}`);
  await waitForElementToBeRemoved(() => screen.getByText(name));
  cleanup();
});

/*
 * Log in
 * Add a workspace
 * Select a workspace
 * Start to add a channel
 * Navigate nackwards
 * Assert back at channel list
 * Delete the workspace
 */

it('Go Back Add Channel', async () => {
  let name = 'tehgre';
  login();
  await waitForLabelTextThenClick('add workspace');
  fireEvent.changeText(screen.getByLabelText('name'), name);
  fireEvent.press(screen.getByLabelText('add'));
  await waitFor(() => screen.getByLabelText('add workspace'));
  await waitForTextThenClick(name);
  await waitForLabelTextThenClick('add channel');
  await waitForLabelTextThenClick('back to channels');
  await waitForLabelTextThenClick('back to workspaces');
  fireEvent(screen.getByText(name), 'swipeableRightOpen');
  await waitForFirstLabelTextThenClick(`delete ${name}`);
  await waitForElementToBeRemoved(() => screen.getByText(name));
  cleanup();
});

/*
 * Log in
 * Add a workspace
 * Select the workspace
 * Add Molly Member and Anna Admin as members
 * Assert Molly and Anna are members of the workspace
 * Delete the workspace
 */

/*
 * Log in
 * Add a workspace
 * Select the workspaca
 * Add William Shakespeare as a member
 * Assert Will is a member of the workspace
 * Remove Will as a member
 * Assert Will is no longer a member of the workspace
 * Delete the workspace
 */

/*
 * Log in
 * Add a workspace
 * Select the workspace
 * Add William Shakespeare as a member
 * Log out
 * Log in as will@cse118.com password "will"
 * Assert workspace is visiable
 * Log out
 * Log in
 * Delete the workspace
 */

/*
 * Log in
 * Add a workspace
 * Select the workspace
 * Add William Shakespeare as a member
 * Add a channel
 * Log out
 * Log in as will@cse118.com password "will"
 * Select the workspace
 * Select the channel
 * Add a new message
 * Assert message is visible
 * Log out
 * Log in
 * Delete the workspace
 */

/*
 * Log in
 * Add a workspace
 * Select the workspace
 * Add William Shakespeare as a member
 * Add a channel
 * Add a new message
 * Log out
 * Log in as will@cse118.com password "will"
 * Select the workspace
 * Select the channel
 * Assert message cannot be deleted
 * Log out
 * Log in
 * Delete the workspace
 */
