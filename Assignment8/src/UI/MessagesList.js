/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */

//ChatGPT helped with sorting messages

import React from 'react';
import {FlatList, StyleSheet, View} from 'react-native';

import WorkspacesContext from '../Context/WorkspacesContext';
import MessageCard from '../UI/MessageCard';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 10,
  },
  cardContainer: {
    marginBottom: 10,
  },
});

const MessagesList = ({navigation}) => {
  const {Messages} = React.useContext(WorkspacesContext);
  const tempMes = Messages;
  const sortedMessages = tempMes.sort((a, b) => {
    return new Date(b.posted) - new Date(a.posted);
  });
  return (
    <View style={styles.container}>
      <FlatList
        data={sortedMessages}
        keyExtractor={item => item.id}
        renderItem={({item}) => (
          <View style={styles.cardContainer}>
            <MessageCard Message={item} navigation={navigation} />
          </View>
        )}
      />
    </View>
  );
};

export default MessagesList;
