const loginRequest = async (username, password) => {
  console.log('attempt');
  const response = await fetch('https://cse118.com/api/v2/login', {
    method: 'POST',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      email: username,
      password: password,
    }),
  });
  const json = await response.json();
  return json;
};

export {loginRequest};
