///*
// * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
// *
// * You may not use, distribute, publish, or modify this code without
// * the express written permission of the copyright holder.
// */
//
//import React from 'react';
//import {
//  TouchableWithoutFeedback,
//  StyleSheet,
//  Text,
//  View,
//  Alert,
//} from 'react-native';
//import {GestureHandlerRootView, Swipeable} from 'react-native-gesture-handler';
//import Icon from 'react-native-vector-icons/Ionicons';
//import Icons from 'react-native-vector-icons/FontAwesome';
//
//import {WorkspacesContext} from '../Model/ViewModel';
//
//const styles = StyleSheet.create({
//  container: {
//    flex: 1,
//    flexDirection: 'column',
//    padding: 2,
//  },
//  item: {
//    paddingLeft: 10,
//    fontSize: 18,
//  },
//  teenyLogo: {
//    width: 20,
//    height: 20,
//  },
//  trashIcon: {
//    right: 10,
//  },
//});
//
//const AddMemberCard = ({Member, navigation}) => {
//  const {addMember} = React.useContext(WorkspacesContext);
//
//  const swipeableRef = React.useRef(null);
//
//  const close = () => {
//    Alert.alert('Swipeable is closed');
//    swipeableRef.current.close();
//  };
//
//  const rightSwipeActions = () => {
//    return (
//      <Icon
//        name="trash"
//        size={48}
//        color="green"
//        accessibilityLabel="add Member"
//        onPress={() => addMember(Member.id)}
//        style={styles.trashIcon}
//      />
//    );
//  };
//
//  return (
//    <GestureHandlerRootView>
//      <Swipeable ref={swipeableRef} renderRightActions={rightSwipeActions}>
//        <View style={styles.container}>
//          <Text style={styles.item}>{Member.name}</Text>
//        </View>
//      </Swipeable>
//    </GestureHandlerRootView>
//  );
//};
//
//export default AddMemberCard;
