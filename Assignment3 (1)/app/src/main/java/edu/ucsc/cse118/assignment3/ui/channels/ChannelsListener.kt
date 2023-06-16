package edu.ucsc.cse118.assignment3.ui.channels
import edu.ucsc.cse118.assignment3.data.Channel

interface ChannelsListener {
    fun onClick(channel: Channel)
}