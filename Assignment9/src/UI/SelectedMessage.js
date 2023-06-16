/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */

import React from 'react';
import {StyleSheet, Text, View} from 'react-native';

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
});

const SelectedMessage = ({Message}) => {
  const formattedDate = new Date(Message.posted).toLocaleString('en-US', {
    month: 'short',
    day: 'numeric',
    year: 'numeric',
    hour: 'numeric',
    minute: 'numeric',
    hour12: true,
  });

  const dateComponents = formattedDate.split(', ');
  const modifiedDate =
    dateComponents.slice(0, 2).join(', ') +
    ' at ' +
    dateComponents.slice(2).join(', ');

  return (
    <View style={styles.container}>
      <Text style={styles.item}>{Message.content}</Text>
      <Text style={styles.item}>{modifiedDate}</Text>
    </View>
  );
};

export default SelectedMessage;
