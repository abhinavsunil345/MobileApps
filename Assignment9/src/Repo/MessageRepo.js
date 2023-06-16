const load = async (auth, id) => {
  const url = `https://cse118.com/api/v2/channel/${id}/message`;
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
  //  console.log(json)
  return json;
};

export {load};

const add = async (auth, id, content) => {
  console.log('adding message');
  const url = `https://cse118.com/api/v2/channel/${id}/message`;
  const headers = {
    Accept: 'application/json',
    'Content-Type': 'application/json',
    Authorization: `Bearer ${auth}`,
  };

  const data = {content};
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

const Delete = async (auth, id) => {
  console.log('deleting message');
  const url = `https://cse118.com/api/v2/message/${id}`;
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
