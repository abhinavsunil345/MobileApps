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

const AddWorkspaceView = ({navigation}) => {
  // const navigation = useNavigation();
  const [name, setName] = useState('');
  const {createWorkspace} = React.useContext(WorkspacesContext);
  const addWorkspace = async Name => {
    console.log('INNN');
    console.log(Name);
    await createWorkspace(Name);
    navigation.navigate('Workspaces', {title: 'Workspaces'});
  };

  return (
    <View>
      <View style={styles.container}>
        <TextInput
          value={name}
          onChangeText={setName}
          placeholder="name"
          accessibilityLabel="name"
          multiline
          style={styles.input}
        />
      </View>
      <Button
        title="OK"
        accessibilityLabel="add"
        onPress={() => addWorkspace(name)}
        disabled={name.length < 4 || name.length > 32}
      />
      <Button
        title="Cancel"
        onPress={() =>
          setTimeout(() => {
            navigation.navigate('Workspaces', {title: 'Workspaces'});
          }, 20)
        }
      />
    </View>
  );
};

export default AddWorkspaceView;
