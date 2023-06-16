package edu.ucsc.cse118.assignment3.ui.messages

import android.graphics.Canvas
import androidx.recyclerview.widget.RecyclerView
import edu.ucsc.cse118.assignment3.data.Message

interface MessagesListener {
    fun onClick(message: Message)

}