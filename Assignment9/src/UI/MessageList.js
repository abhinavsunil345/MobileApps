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
import MessageCard from '../UI/MessageCard';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 10,
  },

  cardContainer: {
    marginBottom: 10,
  },
  teenyLogo: {
    width: 20,
    height: 20,
  },
  trashIcon: {
    right: 10,
  },
});

const MessageList = ({navigation}) => {
  const {Messages} = React.useContext(WorkspacesContext);
  React.useLayoutEffect(() => {
    const renderHeaderRight = () => {
      return (
        <View>
          <Icon
            name="add"
            size={24}
            color="black"
            style={styles.trashIcon}
            accessibilityLabel="add message"
            onPress={() => {
              navigation.navigate('NewMessage', {title: 'Add Message'});
            }}
          />
        </View>
      );
    };

    navigation.setOptions({
      headerRight: renderHeaderRight,
    });
  }, [navigation]);

  return (
    <View style={styles.container}>
      <FlatList
        data={Messages}
        keyExtractor={item => item.id}
        renderItem={({item}) => (
          <View style={styles.cardContainer}>
            <MessageCard Message={item} navigation={navigation} />
          </View>
        )}
        initialNumToRender={Messages.length}
      />
    </View>
  );
};

export default MessageList;
