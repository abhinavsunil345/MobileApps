/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */

import React from 'react';
import {FlatList, StyleSheet, View} from 'react-native';
import Icons from 'react-native-vector-icons/FontAwesome';

import {WorkspacesContext} from '../Model/ViewModel';
import Icon from 'react-native-vector-icons/Ionicons';
import WorkspaceCard from '../UI/WorkspaceCard';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 10,
  },

  cardContainer: {
    marginBottom: 10,
  },
});

const WorkspaceList = ({navigation}) => {
  const {Workspaces, HardReset, setMember} =
    React.useContext(WorkspacesContext);
  React.useLayoutEffect(() => {
    const renderHeaderRight = () => {
      return (
        <View>
          <Icons
            name="sign-out"
            size={24}
            color="black"
            accessibilityLabel="logout"
            onPress={() => {
              //     console.log('Pressed')
              setMember(null);
            }}
          />
          <Icon
            name="add"
            size={24}
            color="black"
            accessibilityLabel="add workspace"
            onPress={() => {
              navigation.navigate('NewWorkspace', {title: 'Add Workspace'});
            }}
          />
          <Icons
            name="refresh"
            size={24}
            color="black"
            accessibilityLabel="reset"
            onPress={() => {
              HardReset();
            }}
          />
        </View>
      );
    };

    navigation.setOptions({
      headerRight: renderHeaderRight,
    });
  }, [navigation]); // eslint-disable-line react-hooks/exhaustive-deps

  return (
    <View style={styles.container}>
      <FlatList
        data={Workspaces}
        keyExtractor={item => item.id}
        renderItem={({item}) => (
          <View style={styles.cardContainer}>
            <WorkspaceCard Workspace={item} navigation={navigation} />
          </View>
        )}
        initialNumToRender={Workspaces.length}
      />
    </View>
  );
};

export default WorkspaceList;
