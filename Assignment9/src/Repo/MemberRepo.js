const load = async (auth, id) => {
  const url = 'https://cse118.com/api/v2/member';
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
  // console.log('Members')
  //console.log(json)
  return json;
};

export {load};

//const get = async (auth, id) => {
//  const url = `https://cse118.com/api/v2/workspace/${id}/member`;
//  const headers = {
//    Accept: 'application/json',
//    Authorization: `Bearer ${auth}`,
//  };
//
//  const response = await fetch(url, {
//    method: 'GET',
//    headers: headers,
//  });
//
//  const json = await response.json();
//  return json;
//};
//
//export { get };
//
//
//const deleteMember = async (auth, wid, mid) => {
//  const urlString = `https://cse118.com/api/v2/workspace/${wid}/member`;
//  const url = new URL(urlString);
//
//  const params = { mid: mid };
//  url.search = new URLSearchParams(params).toString();
//
//  const headers = {
//    Accept: 'application/json',
//    Authorization: `Bearer ${auth}`,
//  };
//
//  const request = new Request(url, {
//    method: 'DELETE',
//    headers: headers,
//  });
//
//  const response = await fetch(request);
//  const data = await response;
//  // Handle the response as needed
//};
//
//export { deleteMember };
//
//
//const addMember = async (auth, wid, mid) => {
//  console.log("Add Member")
//  console.log(mid)
//  const url = 'https://cse118.com/api/v2/workspace/${wid}/member?mid=${mid}`;
//  console.log("URL")
//  console.log(url)
//
// // const midQueryItem = new URLSearchParams({ mid: mid });
////  url.search = midQueryItem.toString();
//
//  const headers = {
//    Accept: 'application/json',
//    Authorization: `Bearer ${auth}`,
//  };
//
//  const response = await fetch(url, {
//    method: 'POST',
//    headers: headers,
//  });
//  const data = await response.text();
//  return data;
//  // Handle the response data as needed
//};
//
//export { addMember };
