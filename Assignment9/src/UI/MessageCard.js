/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */

import React from 'react';
import {TouchableWithoutFeedback, StyleSheet, Text, View} from 'react-native';
import {GestureHandlerRootView, Swipeable} from 'react-native-gesture-handler';
import Icon from 'react-native-vector-icons/Ionicons';

import {WorkspacesContext} from '../Model/ViewModel';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
    padding: 2,
  },
  item: {
    paddingLeft: 10,
    fontSize: 18,
  },
  teenyLogo: {
    width: 20,
    height: 20,
  },
  trashIcon: {
    right: 10,
  },
});

const MessageCard = ({Message, navigation}) => {
  const {
    setMessage,
    members,
    setMessageName,
    Workspace,
    member,
    destroyMessage,
  } = React.useContext(WorkspacesContext);
  const formattedDate = new Date(Message.posted).toLocaleString('en-US', {
    month: 'short',
    day: 'numeric',
    year: 'numeric',
    hour: 'numeric',
    minute: 'numeric',
    hour12: true,
  });
  // console.log(members)
  let matchingMember = members.find(
    memberItem => memberItem.id === Message.member,
  );
  const name = matchingMember.name;

  const dateComponents = formattedDate.split(', ');
  const modifiedDate =
    dateComponents.slice(0, 2).join(', ') +
    ' at ' +
    dateComponents.slice(2).join(', ');

  const swipeableRef = React.useRef(null);

  const rightSwipeActions = () => {
    if (Message.member === member.id || Workspace.owner === member.id) {
      return (
        <Icon
          name="trash"
          size={48}
          color="red"
          accessibilityLabel="delete message"
          onPress={() => destroyMessage(Message.id)}
          style={styles.trashIcon}
        />
      );
    }
    return null; // Render nothing if the condition is not met
  };

  return (
    <GestureHandlerRootView>
      <Swipeable ref={swipeableRef} renderRightActions={rightSwipeActions}>
        <TouchableWithoutFeedback
          onPress={() => {
            setMessage(Message);
            setMessageName(name);
            navigation.navigate('Message', {title: name});
          }}>
          <View style={styles.container}>
            <Text style={styles.item}>{name}</Text>
            <Text style={styles.item}>{Message.content}</Text>
            <Text style={styles.item}>{modifiedDate}</Text>
          </View>
        </TouchableWithoutFeedback>
      </Swipeable>
    </GestureHandlerRootView>
  );
};

export default MessageCard;
