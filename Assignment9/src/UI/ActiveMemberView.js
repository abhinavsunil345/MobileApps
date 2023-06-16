///*
// * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
// *
// * You may not use, distribute, publish, or modify this code without
// * the express written permission of the copyright holder.
// */
//
//import React from 'react';
//import {FlatList, StyleSheet, View} from 'react-native';
//import Icon from 'react-native-vector-icons/Ionicons';
//import {WorkspacesContext} from '../Model/ViewModel';
//import MemberCard from '../UI/MemberCard';
//
//const styles = StyleSheet.create({
//  container: {
//    flex: 1,
//    padding: 10,
//  },
//
//  cardContainer: {
//    marginBottom: 10,
//  },
//});
//
//const ActiveMemberView = ({navigation}) => {
//  const {WorkspaceMembers} = React.useContext(WorkspacesContext);
//
//  React.useLayoutEffect(() => {
//    navigation.setOptions({
//      headerRight: () => (
//        <Icon
//          name="add"
//          size={24}
//          color="black"
//          style={{marginRight: 10}}
//          accessibilityLabel="add member"
//          onPress={() => {
//            navigation.navigate('AddWorkspaceMembers', {
//              title: 'Add Workspace Member',
//            });
//          }}
//        />
//      ),
//    });
//  }, [navigation]);
//
//  return (
//    <View style={styles.container}>
//      <FlatList
//        data={WorkspaceMembers}
//        keyExtractor={item => item.id}
//        renderItem={({item}) => (
//          <View style={styles.cardContainer}>
//            <MemberCard Member={item} navigation={navigation} />
//          </View>
//        )}
//        initialNumToRender={WorkspaceMembers.length}
//      />
//    </View>
//  );
//};
//
//export default ActiveMemberView;
