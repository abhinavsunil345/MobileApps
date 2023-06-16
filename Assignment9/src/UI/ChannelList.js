/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */

import React from 'react';
import {FlatList, StyleSheet, View} from 'react-native';
import Icon from 'react-native-vector-icons/Ionicons';

import {WorkspacesContext} from '../Model/ViewModel';
import ChannelCard from '../UI/ChannelCard';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 10,
  },

  cardContainer: {
    marginBottom: 10,
  },
  headerRightContainer: {
    flexDirection: 'row',
  },
  addIcon: {
    marginRight: 10,
  },
});

const ChannelList = ({navigation}) => {
  const {Channels, Workspace, member} = React.useContext(WorkspacesContext);
  React.useLayoutEffect(() => {
    const renderHeaderRight = () => {
      if (Workspace.owner === member.id) {
        return (
          <View style={styles.headerRightContainer}>
            <Icon
              name="add"
              size={24}
              color="black"
              style={styles.addIcon}
              accessibilityLabel="add channel"
              onPress={() => {
                navigation.navigate('NewChannel', {title: 'Add Channel'});
              }}
            />
          </View>
        );
      }
      return null; // Return null if the buttons should not be rendered
    };

    navigation.setOptions({
      headerRight: renderHeaderRight,
    });
  }, [navigation]); // eslint-disable-line react-hooks/exhaustive-deps

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
        initialNumToRender={Channels.length}
      />
    </View>
  );
};

export default ChannelList;
