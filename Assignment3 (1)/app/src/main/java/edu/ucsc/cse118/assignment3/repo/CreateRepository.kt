package edu.ucsc.cse118.assignment3.repo

import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import edu.ucsc.cse118.assignment3.data.Workspace
import edu.ucsc.cse118.assignment3.data.Channel
import edu.ucsc.cse118.assignment3.data.Message
import edu.ucsc.cse118.assignment3.data.Member
import edu.ucsc.cse118.assignment3.model.ViewModelEvent
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import org.json.JSONObject
import java.io.BufferedReader
import java.io.InputStreamReader
import java.net.URL
import javax.net.ssl.HttpsURLConnection
class CreateRepository {
    fun create(member: Member?, channel: Channel?, content: String?): Message {
        val path = "${url}/${channel?.id}"
        with(URL(path).openConnection() as HttpsURLConnection) {
            requestMethod = "POST"
            setRequestProperty("Content-Type", "application/json")
            setRequestProperty("Accept", "application/json")
            setRequestProperty("Authorization", "Bearer ${member?.accessToken}")
            val jsonObject = JSONObject()
            jsonObject.put("content", content)
            val jsonData = jsonObject.toString()
            //println(concat)
            outputStream.write(jsonData.toByteArray())
            if (responseCode == HttpsURLConnection.HTTP_CREATED) {
                return Json.decodeFromString(inputStream.bufferedReader().use { it.readText() })
            }
            if (responseCode == HttpsURLConnection.HTTP_NOT_FOUND) {
                println("Channel with name ${channel?.name} and id ${channel?.id} NOT FOUND")
                throw Exception("Channel with name ${channel?.name} and id ${channel?.id} NOT FOUND")
            }
            throw Exception("Failed to PUT HTTP $responseCode")
        }
    }

    fun delete(member: Member?, message: Message?) {
        val path = "${url}/${message?.id}"
        with(URL(path).openConnection() as HttpsURLConnection) {
            requestMethod = "DELETE"
            setRequestProperty("Content-Type", "application/json")
            setRequestProperty("Accept", "application/json")
            setRequestProperty("Authorization", "Bearer ${member?.accessToken}")
            if (responseCode == HttpsURLConnection.HTTP_OK) {
                println("Successfully Deleted")
                println("Message with poster ${message?.poster} and id ${message?.id} SUCCESSFULLY DELETED")
                return
            }
            if (responseCode == HttpsURLConnection.HTTP_NOT_FOUND) {
                println("Message with poster ${message?.poster} and id ${message?.id} NOT FOUND")
                throw Exception("Message with poster ${message?.poster} and id ${message?.id} NOT FOUND")
            }
            throw Exception("Failed to PUT HTTP $responseCode")
        }
    }

    companion object {
        private const val url = "https://cse118.com/api/v0/message"
    }

}