/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */

import React from 'react';
import {FlatList, StyleSheet, View} from 'react-native';

import WorkspacesContext from '../Context/WorkspacesContext';
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
  const {Workspaces} = React.useContext(WorkspacesContext);
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
