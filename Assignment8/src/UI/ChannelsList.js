/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */

import React from 'react';
import {FlatList, StyleSheet, View} from 'react-native';

import WorkspacesContext from '../Context/WorkspacesContext';
import ChannelCard from '../UI/ChannelCard';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 10,
  },

  cardContainer: {
    marginBottom: 10,
  },
});

const ChannelList = ({navigation}) => {
  const {Channels} = React.useContext(WorkspacesContext);
  return (
    <View style={styles.container}>
      <FlatList
        data={Channels}
        keyExtractor={item => item.id}
        renderItem={({item}) => (
          <View style={styles.cardContainer}>
            <ChannelCard Channel={item} navigation={navigation} />
          </View>
        )}
      />
    </View>
  );
};

export default ChannelList;
