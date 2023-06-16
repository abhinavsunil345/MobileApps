package edu.ucsc.cse118.assignment3.model

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import edu.ucsc.cse118.assignment3.data.Member
import edu.ucsc.cse118.assignment3.repo.MemberRepository
import edu.ucsc.cse118.assignment3.repo.WorkspaceRepository
import edu.ucsc.cse118.assignment3.repo.ChannelsRepository
import edu.ucsc.cse118.assignment3.data.Workspace
import edu.ucsc.cse118.assignment3.data.Channel
import edu.ucsc.cse118.assignment3.data.Message
import edu.ucsc.cse118.assignment3.repo.CreateRepository
import java.text.SimpleDateFormat
import java.time.Instant
import java.time.LocalDateTime
import java.time.ZoneId
import java.time.format.DateTimeFormatter
import java.time.format.DateTimeParseException
import java.util.*
import kotlin.collections.ArrayList


class SharedViewModel : ViewModel() {
    private val _member = MutableLiveData<Member>()
    val member : LiveData<Member> = _member

    private val _error = MutableLiveData<ViewModelEvent<String>>()
    val error : LiveData<ViewModelEvent<String>> = _error

    private val _workspaces = MutableLiveData<ArrayList<Workspace>>()
    val workspaces: LiveData<ArrayList<Workspace>> = _workspaces

   private val _workspace = MutableLiveData<ViewModelEvent<Workspace>>()
   val workspace : LiveData<ViewModelEvent<Workspace>> = _workspace

    private val _channels = MutableLiveData<ArrayList<Channel>>()
    val channels : LiveData<ArrayList<Channel>> = _channels

    private val _channel = MutableLiveData<ViewModelEvent<Channel>>()
    val channel : LiveData<ViewModelEvent<Channel>> = _channel

    private val _messages = MutableLiveData<ArrayList<Message>>()
    val messages : LiveData<ArrayList<Message>> = _messages

    private val _message = MutableLiveData<ViewModelEvent<Message>>()
    val message : LiveData<ViewModelEvent<Message>> = _message

    fun getWorkspaces() {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                _workspaces.postValue(WorkspaceRepository().getAll(member.value))
            } catch (e: Exception) {
                _error.postValue(ViewModelEvent(e.message.toString()))
            }
        }
    }

    fun getWorkspace() {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                _channels.postValue(WorkspaceRepository().getOne(member.value, _workspace.value?.getRawContent()))
            } catch (e: Exception) {
                _error.postValue(ViewModelEvent(e.message.toString()))
            }
        }
    }

    fun getMessages() {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                val messages = ChannelsRepository().getOne(member.value, _channel.value?.getRawContent())
                messages.sortByDescending { SimpleDateFormat("yyyy-MM-dd", Locale.US).parse(it.date) }
                _messages.postValue(messages)
            } catch (e: Exception) {
                _error.postValue(ViewModelEvent(e.message.toString()))
            }
        }
    }

   /* fun addMessage(message: Message) {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                MessageRepository().addOne(member.value, club)
                _club.postValue(ViewModelEvent(club))
            } catch (e: Exception) {
                _error.postValue(ViewModelEvent(e.message.toString()))
            }
        }
    }*/

    fun setWorkspace(value: Workspace) {
        _workspace.value = ViewModelEvent(value)
    }
    fun setChannel(value: Channel) {
        _channel.value = ViewModelEvent(value)
    }
    fun setMessage(value: Message) {
        _message.value = ViewModelEvent(value)
    }

    fun login(email: String, password: String) {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                _member.postValue(MemberRepository().login(email, password))
            } catch (e: Exception) {
                _error.postValue(ViewModelEvent(e.message.toString()))
            }
        }
    }

    fun createMessage(content: String) {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                CreateRepository().create(member.value, channel.value?.getRawContent(), content)
            } catch (e: Exception) {
                _error.postValue(ViewModelEvent(e.message.toString()))
            }
        }
    }

    fun deleteMessage() {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                CreateRepository().delete(member.value, message.value?.getRawContent())
            } catch (e: Exception) {
                _error.postValue(ViewModelEvent(e.message.toString()))
            }
        }
    }


}