/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */
import Icon from 'react-native-vector-icons/Ionicons';
import React from 'react';
import {TouchableWithoutFeedback, StyleSheet, Text, View} from 'react-native';
import {GestureHandlerRootView, Swipeable} from 'react-native-gesture-handler';

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

const ChannelCard = ({Channel, navigation}) => {
  const {setChannel, destroyChannel, Workspace, member} =
    React.useContext(WorkspacesContext);

  const count = Channel.messages;

  const access1 = 'count for ' + Channel.name;
  console.log(access1);

  const swipeableRef = React.useRef(null);

  const rightSwipeActions = () => {
    if (Workspace.owner === member.id) {
      return (
        <Icon
          name="trash"
          size={48}
          color="red"
          accessibilityLabel={`delete ${Channel.name}`}
          onPress={() =>
            setTimeout(() => {
              destroyChannel(Channel.id);
            }, 30)
          }
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
            //      setFetchingChannels(true);
            setChannel(Channel);
            //          while (fetchingChannels == true) {
            //
            //            }
            navigation.navigate('Channel', {title: Channel.name});
          }}>
          <View style={styles.container}>
            <Text style={styles.item}>{Channel.name}</Text>
            <View style={styles.container2}>
              <Icon
                name="folder"
                size={20}
                color="#4F8EF7"
                style={styles.icon}
              />
              {count > 0 ? (
                <Text style={styles.item2} accessibilityLabel={access1}>
                  {count}
                </Text>
              ) : (
                <Text style={styles.item2} accessibilityLabel={access1}>
                  {null}
                </Text>
              )}
            </View>
          </View>
        </TouchableWithoutFeedback>
      </Swipeable>
    </GestureHandlerRootView>
  );
};

export default ChannelCard;
