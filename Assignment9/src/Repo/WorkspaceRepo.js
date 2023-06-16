const load = async auth => {
  const url = 'https://cse118.com/api/v2/workspace';
  const headers = {
    Accept: 'application/json',
    'Content-Type': 'application/json',
    Authorization: `Bearer ${auth}`,
  };

  const response = await fetch(url, {
    method: 'GET',
    headers: headers,
  });

  const json = await response.json();
  return json;
};

export {load};

const add = async (auth, name) => {
  console.log('adding workspace');
  const url = 'https://cse118.com/api/v2/workspace';
  const headers = {
    Accept: 'application/json',
    'Content-Type': 'application/json',
    Authorization: `Bearer ${auth}`,
  };

  const data = {name};
  const jsonData = JSON.stringify(data);

  const response = await fetch(url, {
    method: 'POST',
    headers: headers,
    body: jsonData,
  });

  const responseData = await response.json();
  return responseData;
};

export {add};

const reset = async auth => {
  const url = 'https://cse118.com/api/v2/reset';
  const headers = {
    Accept: 'application/json',
    'Content-Type': 'application/json',
    Authorization: `Bearer ${auth}`,
  };

  const response = await fetch(url, {
    method: 'PUT',
    headers: headers,
  });

  const responseData = await response;
  console.log('Response');
  console.log(response);
  return responseData;
};

export {reset};

const Delete = async (auth, id) => {
  console.log('deleting workspace');
  console.log('id');
  const url = `https://cse118.com/api/v2/workspace/${id}`;
  const headers = {
    Accept: 'application/json',
    'Content-Type': 'application/json',
    Authorization: `Bearer ${auth}`,
  };

  const response = await fetch(url, {
    method: 'DELETE',
    headers: headers,
  });

  // The Swift code does not use the response data, so we can omit the next two lines in JavaScript
  console.log('Here');
  const responseData = await response;
  console.log(responseData);
  return responseData;
};

export {Delete};
