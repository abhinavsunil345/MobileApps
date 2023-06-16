/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */

import React from 'react';
import {Button, Text, StyleSheet, View} from 'react-native';

import CalendarGenerator from '../Logic/CalendarGenerator';

const CalendarGeneratorView = () => {
  const [cal, setCal] = React.useState('');
  const [date, setDate] = React.useState(new Date());

  const generate = React.useCallback(() => {
    let res = CalendarGenerator.generate(date);
    let caled = res
      .map(row => row.map(number => String(number).padStart(2, ' ')).join(' '))
      .join('\n');
    setCal(caled);
  }, [date]);

  const next = () => {
    let month = date.getMonth() + 1;
    let year = date.getFullYear();

    if (month > 11) {
      month = 0;
      year = year + 1;
    }
    let NextMonth = new Date(year, month, 2);
    setDate(NextMonth);
  };

  const prev = () => {
    let month = date.getMonth() - 1;
    let year = date.getFullYear();

    if (month < 0) {
      month = 11;
      year = year - 1;
    }
    let PrevMonth = new Date(year, month, 2);
    setDate(PrevMonth);
  };

  const today = () => {
    setDate(new Date());
  };

  React.useEffect(() => {
    generate();
  }, [date, generate]);

  return (
    <View style={styles.container}>
      <View style={styles.title}>
        <Text>Calendar Generator</Text>
      </View>
      <Text style={[styles.text]} accessibilityLabel="month">
        {date.toLocaleString('default', {month: 'long', year: 'numeric'})}
      </Text>
      <Text
        style={styles.cal}
        placeholder="Calendar"
        accessibilityLabel="calendar"
        selectTextOnFocus={false}>
        {cal}
      </Text>
      <View style={styles.buttons}>
        <Button
          accessibilityLabel="previous"
          title="Previous"
          onPress={() => prev()}
        />
        <Button
          accessibilityLabel="today"
          title="Today"
          onPress={() => today()}
        />
        <Button accessibilityLabel="next" title="Next" onPress={() => next()} />
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

  buttons: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingHorizontal: 60,
    marginVertical: 30,
  },
  button: {
    flex: 1, // Use flex to make buttons the same size
    marginHorizontal: 10,
  },

  cal: {
    fontFamily: 'monospace',
    textAlign: 'center',
  },

  text: {
    fontSize: 16,
    textAlign: 'center',
    fontFamily: 'Helvetica',
  },
});

export default CalendarGeneratorView;
