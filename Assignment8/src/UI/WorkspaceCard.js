/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */
import Icon from 'react-native-vector-icons/Ionicons';
import Icons from 'react-native-vector-icons/FontAwesome';
import React from 'react';
import {TouchableWithoutFeedback, StyleSheet, Text, View} from 'react-native';

import WorkspacesContext from '../Context/WorkspacesContext';

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
  container2: {
    flex: 1,
    flexDirection: 'row', // Change to horizontal layout
    alignItems: 'center', // Align items vertically
    padding: 2,
  },
  item2: {
    paddingLeft: 10,
    fontSize: 18,
    fontFamily: 'caption', // Apply caption font
  },
  icon: {
    marginLeft: 5, // Add spacing between icon and text
  },
});

const WorkspaceCard = ({Workspace, navigation}) => {
  const {setWorkspace, setChannels} = React.useContext(WorkspacesContext);
  const uniqueMembers = new Set(
    Workspace.channels.flatMap(channel =>
      channel.messages.map(message => message.member.id),
    ),
  );

  const dates = Workspace.channels.flatMap(channel =>
    channel.messages
      .map(message => new Date(message.posted))
      .filter(date => !isNaN(date.getTime())),
  );
  const recent = dates.length > 0 ? new Date(Math.max(...dates)) : new Date();

  const currentTime = new Date();
  const difference = currentTime.getTime() - recent.getTime();
  const seconds = Math.floor(difference / 1000);
  const minutes = Math.floor(seconds / 60);
  const hours = Math.floor(minutes / 60);
  const days = Math.floor(hours / 24);

  const count = Workspace.channels.length;

  let final = '';
  if (days > 0) {
    final = days + ' days';
  } else if (hours > 0) {
    final = hours + ' hours';
  } else if (minutes > 0) {
    final = minutes + ' minutes';
  } else if (seconds > 0) {
    final = seconds + ' seconds';
  }

  const access1 = 'count for ' + Workspace.name;
  const access2 = 'members active in ' + Workspace.name;
  const access3 = 'latest message in ' + Workspace.name;

  const uniqueSize = uniqueMembers.size;

  return (
    <TouchableWithoutFeedback
      onPress={() => {
        setWorkspace(Workspace);
        setChannels(Workspace.channels);
        navigation.navigate('Workspace', {title: Workspace.name});
      }}>
      <View style={styles.container}>
        <Text style={styles.item}>{Workspace.name}</Text>
        <View style={styles.container2}>
          <Icon name="folder" size={20} color="#4F8EF7" style={styles.icon} />
          <Text style={styles.item2} accessibilityLabel={access1}>
            {count}
          </Text>
          <Icons name="users" size={20} color="#4F8EF7" style={styles.icon} />
          <Text style={styles.item2} accessibilityLabel={access2}>
            {uniqueSize}
          </Text>
          <Icons name="clock-o" size={20} color="#4F8EF7" style={styles.icon} />
          <Text style={styles.item2} accessibilityLabel={access3}>
            {final}
          </Text>
        </View>
      </View>
    </TouchableWithoutFeedback>
  );
};

export default WorkspaceCard;
