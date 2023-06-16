import React from 'react';
import {View, Text, Image, TextInput, Button, StyleSheet} from 'react-native';
import {loginRequest as loginR} from '../Repo/LoginRepo';
import {WorkspacesContext} from '../Model/ViewModel';

const LoginView = () => {
  const [username, setUsername] = React.useState('');
  const [password, setPassword] = React.useState('');

  const {member, setMember} = React.useContext(WorkspacesContext);

  const handleLogin = async () => {
    try {
      var response = await loginR(username, password);
      setMember(response);
      console.log(member);

      // Perform actions with the login result
    } catch (error) {
      console.error(error);
      // Handle login error
    }
  };

  return (
    <View style={styles.container}>
      <View style={styles.title}>
        <Text>Assignment 9</Text>
      </View>
      <View style={styles.logoContainer}>
        <Image
          source={require('../../assets/UCSCSlugLogo.png')}
          style={styles.logo}
          resizeMode="cover"
        />
      </View>
      <TextInput
        style={styles.input}
        onChangeText={setUsername}
        placeholder="Username"
        accessibilityLabel="email"
        value={username}
      />
      <TextInput
        style={styles.input}
        onChangeText={setPassword}
        placeholder="Password"
        accessibilityLabel="password"
        value={password}
      />
      <View style={styles.buttons}>
        <Button
          accessibilityLabel="login"
          title="Login"
          onPress={() => handleLogin()}
        />
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
  },
  title: {
    alignItems: 'center',
    paddingTop: 30,
    paddingBottom: 30,
  },
  input: {
    borderRadius: 10,
    height: 40,
    margin: 12,
    marginLeft: 32,
    marginRight: 32,
    borderWidth: 1,
    borderColor: '#d3d3d3',
    padding: 10,
  },
  logoContainer: {
    alignItems: 'center',
    paddingBottom: 30,
  },
  logo: {
    width: 150,
    height: 150,
  },
  buttons: {
    alignItems: 'center',
    marginTop: 20,
  },
});

export default LoginView;
