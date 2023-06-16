/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */

// ChatGPT helped with concatenating new workspaces

import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createStackNavigator} from '@react-navigation/stack';

import WorkspaceList from './UI/WorkspaceList';
import ChannelsList from './UI/ChannelsList';

import MessagesList from './UI/MessagesList';

import MessageView from './UI/MessageView';

import WorkspacesContext from './Context/WorkspacesContext';
import workspaces from './Resources/Workspaces';

const Stack = createStackNavigator();

const Main = () => {
  const [Workspaces, setWorkspaces] = React.useState([]);
  const [Workspace, setWorkspace] = React.useState();
  const [Channels, setChannels] = React.useState();
  const [Channel, setChannel] = React.useState();
  const [Messages, setMessages] = React.useState();
  const [Message, setMessage] = React.useState();

  React.useEffect(() => {
    const testMember = {
      id: '072f3f85-0417-4d5e-bb0b-3625d4c56e9d',
      name: 'Big Bill',
    };

    const dateSec = new Date();
    dateSec.setSeconds(dateSec.getSeconds() - 20);
    const dateString = dateSec.toISOString();

    const dateMin = new Date();
    dateMin.setMinutes(dateMin.getMinutes() - 20);
    const dateStringMin = dateMin.toISOString();
    const testMessage2 = {
      id: '13faacc9-59f2-4c5d-a528-562c2e65385d',
      content: 'Blah Blah',
      posted: dateStringMin,
      member: testMember,
    };
    const testChannel2 = {
      id: 'f4fdfde3-5bc6-4dd9-ac0a-76981f97ffd7',
      name: 'Test Channel2',
      messages: [testMessage2],
    };

    const dateHr = new Date();
    dateHr.setHours(dateHr.getHours() - 2);
    const dateStringHr = dateHr.toISOString();
    const testMessage3 = {
      id: '078a1f45-931c-4daa-a08b-ba0d8bfab7b1',
      content: 'Blah Blah',
      posted: dateStringHr,
      member: testMember,
    };
    const testChannel3 = {
      id: 'b5a168f3-282a-440d-846e-e4b7f7983822',
      name: 'Test Channel3',
      messages: [testMessage3],
    };

    const testMessage = {
      id: '416abd30-082c-496f-bc97-72bd66167287',
      content: 'Blah Blah',
      posted: dateString,
      member: testMember,
    };
    const testChannel = {
      id: 'a05e13ec-26ec-42a9-9e34-8eac82f9c811',
      name: 'Test Channel',
      messages: [testMessage3, testMessage2, testMessage],
    };

    const newWorkspaces = [
      ...workspaces,
      {
        id: '782ad67b-ddf2-4b1f-84d1-74611c12a7fe',
        name: 'Test Workspace',
        channels: [testChannel],
      },
      {
        id: 'dbb82786-2688-45e6-99a0-11a1669fe16b',
        name: 'Test Workspace2',
        channels: [testChannel2],
      },
      {
        id: '8c341cd7-39d5-45cc-9ab4-9f90e0d7ac2f',
        name: 'Test Workspace3',
        channels: [testChannel3],
      },
    ];

    setWorkspaces(newWorkspaces);
  }, []);

  return (
    <WorkspacesContext.Provider
      value={{
        Workspaces,
        Workspace,
        setWorkspace,
        Channels,
        setChannels,
        Channel,
        setChannel,
        Messages,
        setMessages,
        Message,
        setMessage,
      }}>
      <NavigationContainer>
        <Stack.Navigator>
          <Stack.Screen name="Workspaces" component={WorkspaceList} />
          <Stack.Screen
            name="Workspace"
            component={ChannelsList}
            options={({route}) => ({
              title: route.params.title,
              headerBackTitle: 'Workspaces',
              headerBackAccessibilityLabel: 'back to workspaces',
            })}
          />
          <Stack.Screen
            name="Channel"
            component={MessagesList}
            options={({route}) => ({
              title: route.params.title,
              headerBackTitle: 'Channels',
              headerBackAccessibilityLabel: 'back to channels',
            })}
          />
          <Stack.Screen
            name="Message"
            component={MessageView}
            options={({route}) => ({
              title: route.params.title,
              headerBackTitle: 'Channel',
              headerBackAccessibilityLabel: 'back to channel',
            })}
          />
        </Stack.Navigator>
      </NavigationContainer>
    </WorkspacesContext.Provider>
  );
};

export default Main;
