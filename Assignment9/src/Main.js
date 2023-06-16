import React from 'react';

import {NavigationContainer} from '@react-navigation/native';
import {createStackNavigator} from '@react-navigation/stack';

import LoginView from './UI/LoginView';
import WorkspaceList from './UI/WorkspaceList';
import ChannelList from './UI/ChannelList';
import MessageList from './UI/MessageList';
import MessageView from './UI/MessageView';
import AddWorkspaceView from './UI/AddWorkspaceView';
import AddChannelView from './UI/AddChannelView';
import AddMessageView from './UI/AddMessageView';
const Stack = createStackNavigator();
import {WorkspacesContext} from './Model/ViewModel';

const Main = () => {
  const {member} = React.useContext(WorkspacesContext);
  if (member) {
    return (
      <NavigationContainer>
        <Stack.Navigator initialRouteName="Workspaces">
          <Stack.Screen
            name="Workspaces"
            component={WorkspaceList}
            options={({route}) => ({
              title: 'Workspaces',
              headerBackTitle: 'Login',
              headerBackAccessibilityLabel: 'back to login',
              transitionSpec: {
                open: {animation: 'timing', config: {duration: 0}}, // Disable transition animation when opening the screen
                close: {animation: 'timing', config: {duration: 0}}, // Disable transition animation when closing the screen
              },
            })}
          />
          <Stack.Screen
            name="Workspace"
            component={ChannelList}
            options={({route}) => ({
              title: route.params.title,
              headerBackTitle: 'Workspaces',
              headerBackAccessibilityLabel: 'back to workspaces',
              transitionSpec: {
                open: {animation: 'timing', config: {duration: 0}}, // Disable transition animation when opening the screen
                close: {animation: 'timing', config: {duration: 0}}, // Disable transition animation when closing the screen
              },
            })}
          />
          <Stack.Screen
            name="Channel"
            component={MessageList}
            options={({route}) => ({
              title: route.params.title,
              headerBackTitle: 'Channels',
              headerBackAccessibilityLabel: 'back to channels',
              transitionSpec: {
                open: {animation: 'timing', config: {duration: 0}}, // Disable transition animation when opening the screen
                close: {animation: 'timing', config: {duration: 0}}, // Disable transition animation when closing the screen
              },
            })}
          />
          <Stack.Screen
            name="Message"
            component={MessageView}
            options={({route}) => ({
              title: route.params.title,
              headerBackTitle: 'Channel',
              headerBackAccessibilityLabel: 'back to channel',
              transitionSpec: {
                open: {animation: 'timing', config: {duration: 0}}, // Disable transition animation when opening the screen
                close: {animation: 'timing', config: {duration: 0}}, // Disable transition animation when closing the screen
              },
            })}
          />
          <Stack.Screen
            name="NewWorkspace"
            component={AddWorkspaceView}
            options={({route}) => ({
              title: route.params.title,
              headerBackTitle: 'Workspaces',
              headerBackAccessibilityLabel: 'back to workspaces',
              transitionSpec: {
                open: {animation: 'timing', config: {duration: 0}}, // Disable transition animation when opening the screen
                close: {animation: 'timing', config: {duration: 0}}, // Disable transition animation when closing the screen
              },
            })}
          />
          <Stack.Screen
            name="NewChannel"
            component={AddChannelView}
            options={({route}) => ({
              title: route.params.title,
              headerBackTitle: 'Channels',
              headerBackAccessibilityLabel: 'back to channels',
              transitionSpec: {
                open: {animation: 'timing', config: {duration: 0}}, // Disable transition animation when opening the screen
                close: {animation: 'timing', config: {duration: 0}}, // Disable transition animation when closing the screen
              },
            })}
          />
          <Stack.Screen
            name="NewMessage"
            component={AddMessageView}
            options={({route}) => ({
              title: route.params.title,
              headerBackTitle: 'Messages',
              headerBackAccessibilityLabel: 'back to channel',
              transitionSpec: {
                open: {animation: 'timing', config: {duration: 0}}, // Disable transition animation when opening the screen
                close: {animation: 'timing', config: {duration: 0}}, // Disable transition animation when closing the screen
              },
            })}
          />
        </Stack.Navigator>
      </NavigationContainer>
    );
  } else {
    return (
      <NavigationContainer>
        <Stack.Navigator initialRouteName="Login">
          <Stack.Screen name="Login" component={LoginView} />
        </Stack.Navigator>
      </NavigationContainer>
    );
  }
};

export default Main;
