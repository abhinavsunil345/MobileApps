import React, {useState} from 'react';
import {View, TextInput, Button, StyleSheet} from 'react-native';
// import { useNavigation } from '@react-navigation/native';
import {WorkspacesContext} from '../Model/ViewModel';

const styles = StyleSheet.create({
  container: {
    borderWidth: 1,
    borderColor: 'gray',
    borderRadius: 10,
    marginBottom: 10,
  },
  input: {
    height: 200,
    padding: 10,
  },
});

const AddMessageView = ({navigation}) => {
  // const navigation = useNavigation();
  const [content, setContent] = useState('');
  const {createMessage, Channel} = React.useContext(WorkspacesContext);
  const addMessage = async Content => {
    console.log('INNN');
    console.log(Content);
    await createMessage(Content);
    navigation.navigate('Channel', {title: Channel.name});
  };

  return (
    <View>
      <View style={styles.container}>
        <TextInput
          value={content}
          onChangeText={setContent}
          placeholder="Content"
          accessibilityLabel="content"
          multiline
          style={styles.input}
        />
      </View>
      <Button
        title="OK"
        accessibilityLabel="add"
        onPress={() => addMessage(content)}
        disabled={content.length < 4}
      />
      <Button
        title="Cancel"
        onPress={() => navigation.navigate('Channel', {title: Channel.name})}
      />
    </View>
  );
};

export default AddMessageView;
