import React from 'react';

import {load as GET_WORKSPACES} from '../Repo/WorkspaceRepo';
import {load as GET_CHANNELS} from '../Repo/ChannelRepo';
import {load as GET_MESSAGES} from '../Repo/MessageRepo';
import {load as GET_MEMBERS} from '../Repo/MemberRepo';
import {add as ADD_WORKSPACE} from '../Repo/WorkspaceRepo';
import {reset as RESET} from '../Repo/WorkspaceRepo';
import {add as ADD_CHANNEL} from '../Repo/ChannelRepo';
import {add as ADD_MESSAGE} from '../Repo/MessageRepo';
import {Delete as DELETE_MESSAGE} from '../Repo/MessageRepo';
import {Delete as DELETE_CHANNEL} from '../Repo/ChannelRepo';
import {Delete as DELETE_WORKSPACE} from '../Repo/WorkspaceRepo';
//import {get as GET_WORKSPACEMEMBERS} from '../Repo/MemberRepo';
//import {addMember as ADD_WORKSPACEMEMBERS} from '../Repo/MemberRepo';
//import {deleteMember as DELETE_WORKSPACEMEMBERS} from '../Repo/MemberRepo';

export const WorkspacesContext = React.createContext();

const ViewModel = props => {
  const [Workspaces, setWorkspaces] = React.useState([]);
  const [Workspace, setWorkspace] = React.useState();
  const [Channels, setChannels] = React.useState([]);
  const [Channel, setChannel] = React.useState();
  const [Messages, setMessages] = React.useState([]);
  const [Message, setMessage] = React.useState();
  // const [loginCred, setloginCred] = React.useState();
  const [member, setMember] = React.useState(null);
  const [members, setMembers] = React.useState([]);
  const [messageName, setMessageName] = React.useState('');
  const [addWorkspace, setAddWorkspace] = React.useState();
  const [addChannel, setAddChannel] = React.useState();
  const [addMessage, setAddMessage] = React.useState();
  const [deleteMessage, setDeleteMessage] = React.useState();
  const [deleteChannel, setDeleteChannel] = React.useState();
  const [deleteWorkspace, setDeleteWorkspace] = React.useState();
  const [resetState, setResetState] = React.useState();
  const [fetching, setFetching] = React.useState(true);
  const [fetchingChannels, setFetchingChannels] = React.useState(true);
  const [WorkspaceMembers, setWorkspaceMembers] = React.useState([]);
  const [AddMembers, setAddMembers] = React.useState([]);
  // const [deleteMember, setDeleteMember] = React.useState();
  // const [AddMember, setAddMember] = React.useState();

  const createWorkspace = async name => {
    var response = await ADD_WORKSPACE(member.accessToken, name);
    setAddWorkspace(response);
    // console.log(response)
    // Perform actions with the login result
  };

  const createChannel = async name => {
    var response = await ADD_CHANNEL(member.accessToken, Workspace.id, name);
    setAddChannel(response);
    //  console.log(response)
    // Perform actions with the login result
  };

  const createMessage = async name => {
    var response = await ADD_MESSAGE(member.accessToken, Channel.id, name);
    setAddMessage(response);
    // console.log(response)
    var messages = await GET_MESSAGES(member.accessToken, Channel.id);
    setMessages(messages);
    // Perform actions with the login result
  };

  const destroyMessage = async id => {
    var response = await DELETE_MESSAGE(member.accessToken, id);
    setDeleteMessage(response);
    console.log(response);
    // Perform actions with the login result
  };

  const destroyChannel = async id => {
    var response = await DELETE_CHANNEL(member.accessToken, id);
    setDeleteChannel(response);
    console.log(response);
    // Perform actions with the login result
  };

  const destroyWorkspace = async id => {
    var response = await DELETE_WORKSPACE(member.accessToken, id);
    setDeleteWorkspace(response);
    console.log(response);
    // Perform actions with the login result
  };

  const HardReset = async () => {
    var response = await RESET(member.accessToken);
    setResetState(response);
  };

  //    const addMember = async (mid) => {
  //        console.log("Called Add Member")
  //        console.log(mid)
  //         var response = await ADD_WORKSPACEMEMBERS(member.accessToken, Workspace.id, mid);
  //         console.log(response)
  //         setAddMember(response);
  //    }

  React.useEffect(() => {
    // console.log('Called')
    const fetchData = async () => {
      if (member) {
        setWorkspaces([]);
        var workspaces = await GET_WORKSPACES(member.accessToken);
        setWorkspaces(workspaces);
      }
      setFetching(false);
    };

    fetchData();
  }, [member, addWorkspace, resetState, deleteWorkspace]);

  React.useEffect(() => {
    // console.log('Called')
    const fetchData = async () => {
      if (member) {
        var membs = await GET_MEMBERS(member.accessToken);
        setMembers(membs);
      }
      setFetching(false);
    };

    fetchData();
  }, [member]);

  React.useEffect(() => {
    //console.log('Called')
    //console.log('Effect')
    //console.log(Workspace.id)
    const fetchData = async () => {
      if (Workspace && member) {
        setChannels([]);
        var channels = await GET_CHANNELS(member.accessToken, Workspace.id);
        console.log(channels);
        setChannels(channels);
      }
    };

    fetchData();
  }, [Workspace, addChannel, addMessage, deleteMessage, deleteChannel, member]);

  //        React.useEffect(() => {
  //        //console.log('Called')
  //          //console.log('Effect')
  //          //console.log(Workspace.id)
  //          const fetchData = async () => {
  //            if (Workspace) {
  //              var wm = await GET_WORKSPACEMEMBERS(member.accessToken, Workspace.id);
  //            }
  //          };
  //
  //          fetchData();
  //        }, [Workspace]);

  //       React.useEffect(() => {
  //        //console.log('Called')
  //          //console.log('Effect')
  //          //console.log(Workspace.id)
  //          const fetchData = async () => {
  //            if (WorkspaceMembers) {
  //                if (WorkspaceMembers.length > 0) {
  //                console.log("Add Members")
  //                console.log(members)
  //                var addmembs = members.filter((member) => {
  //                  // Check if the member's id is not present in the WorkspaceMembers array
  //                  return !WorkspaceMembers.some((workspaceMember) => workspaceMember.id === member.id);
  //                });
  //                setAddMembers(addmembs)
  //                }
  //                else {
  //                    setAddMembers(members)
  //                }
  //            }
  //          };
  //
  //          fetchData();
  //        }, [WorkspaceMembers, AddMember, member]);

  //    const loadChannels = async (workspace) => {
  //          if (workspace) {
  //              var channels = await GET_CHANNELS(member.accessToken, Workspace.id);
  //              console.log(channels)
  //              setChannels(channels);
  //            }
  //          };

  React.useEffect(() => {
    //console.log('Called')
    const fetchData = async () => {
      if (Channel && member) {
        setMessages([]);
        var messages = await GET_MESSAGES(member.accessToken, Channel.id);
        setMessages(messages);
      }
    };

    fetchData();
  }, [Channel, deleteMessage, member]);

  return (
    <WorkspacesContext.Provider
      value={{
        Workspaces,
        Workspace,
        setWorkspace,
        Channels,
        setChannels,
        Channel,
        setChannel,
        Messages,
        setMessages,
        Message,
        setMessage,
        member,
        setMember,
        members,
        setMembers,
        messageName,
        setMessageName,
        addWorkspace,
        setAddWorkspace,
        createWorkspace: createWorkspace,
        createChannel: createChannel,
        createMessage: createMessage,
        deleteWorkspace,
        setDeleteWorkspace,
        deleteChannel,
        setDeleteChannel,
        deleteMessage,
        setDeleteMessage,
        destroyMessage: destroyMessage,
        resetState,
        setResetState,
        HardReset: HardReset,
        fetching,
        setFetching,
        setFetchingChannels,
        fetchingChannels,
        WorkspaceMembers,
        setWorkspaceMembers,
        AddMembers,
        setAddMembers,
        destroyChannel: destroyChannel,
        destroyWorkspace: destroyWorkspace,
      }}>
      {props.children}
    </WorkspacesContext.Provider>
  );
};

export default ViewModel;
