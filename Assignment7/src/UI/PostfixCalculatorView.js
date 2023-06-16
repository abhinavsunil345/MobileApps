/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */

import React from 'react';
import {Button, Text, TextInput, StyleSheet, View} from 'react-native';

import PostfixCalculator from '../Logic/PostfixCalculator';

const PostfixCalculatorView = () => {
  const [expression, setExpression] = React.useState('');
  const [result, setResult] = React.useState('');

  const evaluate = () => {
    try {
      setResult(PostfixCalculator.evaluate(expression) + '');
    } catch (e) {
      setResult(e);
    }
  };

  const clear = () => {
    setExpression('');
    setResult('');
  };

  return (
    <View style={styles.container}>
      <View style={styles.title}>
        <Text>Postfix Calculator</Text>
      </View>
      <TextInput
        style={styles.input}
        onChangeText={setExpression}
        placeholder="Expression"
        accessibilityLabel="expression"
        value={expression}
      />
      <Text
        style={styles.input}
        placeholder="Result"
        accessibilityLabel="result"
        selectTextOnFocus={false}>
        {result}
      </Text>
      <View style={styles.buttons}>
        <Button
          accessibilityLabel="evaluate"
          title="Evaluate"
          onPress={() => evaluate()}
        />
        <Button
          accessibilityLabel="clear"
          title="Clear"
          onPress={() => clear()}
        />
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flexDirection: 'column',
  },
  title: {
    flexDirection: 'row',
    alignContent: 'center',
    paddingTop: 30,
    paddingBottom: 0,
    paddingLeft: 120,
    paddingRight: 120,
    justifyContent: 'space-around',
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
  buttons: {
    flexDirection: 'row',
    alignContent: 'center',
    paddingLeft: 100,
    paddingRight: 100,
    justifyContent: 'space-around',
  },
});

export default PostfixCalculatorView;
