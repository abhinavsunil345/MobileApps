/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */

import React from 'react';
import {StyleSheet, View} from 'react-native';

import {WorkspacesContext} from '../Model/ViewModel';
import SelectedMessage from '../UI/SelectedMessage';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 10,
  },
  tinyLogo: {
    width: 80,
    height: 80,
  },
});

const MessageView = () => {
  const {Message} = React.useContext(WorkspacesContext);
  return (
    <View style={styles.container}>
      <SelectedMessage Message={Message} />
    </View>
  );
};

export default MessageView;
