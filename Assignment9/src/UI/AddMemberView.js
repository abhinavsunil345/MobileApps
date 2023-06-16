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
//import MemberCard from '../UI/AddMemberCard';
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
//  const {AddMembers} = React.useContext(WorkspacesContext);
//
//  return (
//    <View style={styles.container}>
//      <FlatList
//        data={AddMembers}
//        keyExtractor={item => item.id}
//        renderItem={({item}) => (
//          <View style={styles.cardContainer}>
//            <MemberCard Member={item} navigation={navigation} />
//          </View>
//        )}
//        initialNumToRender={AddMembers.length}
//      />
//    </View>
//  );
//};
//
//export default ActiveMemberView;
