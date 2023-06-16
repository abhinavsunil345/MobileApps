package edu.ucsc.cse118.assignment3.ui.messages

/*
#######################################################################
#
# Copyright (C) 2022-2023 David C. Harrison. All rights reserved.
#
# You may not use, distribute, publish, or modify this code without
# the express written permission of the copyright holder.
#
#######################################################################
*/

import android.view.LayoutInflater
import edu.ucsc.cse118.assignment3.R
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import edu.ucsc.cse118.assignment3.data.Message
import java.text.SimpleDateFormat
import java.time.Instant
import java.time.LocalDateTime
import java.time.ZoneId
import java.time.format.DateTimeFormatter
import java.util.*

class MessagesAdapter(private val messages: MutableList<Message>, private val listener: MessagesListener) :
    RecyclerView.Adapter<MessagesAdapter.MessageViewHolder>()
{
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MessageViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.card_view_message, parent, false)
        return MessageViewHolder(view)
    }
    fun removeItem(position: Int) {
        messages.removeAt(position)
        notifyItemRemoved(position)
    }

    fun getItem(position: Int): Message {
        return messages[position]
    }

    override fun onBindViewHolder(holder: MessageViewHolder, position: Int) {
        holder.bind(messages[position])
        holder.itemView.setOnClickListener { listener.onClick(messages[position]) }
    }

    override fun getItemCount(): Int {
        return messages.size
    }


    class MessageViewHolder(ItemView: View) : RecyclerView.ViewHolder(ItemView) {
        private val name: TextView = itemView.findViewById(R.id.name)
        private val date : TextView = itemView.findViewById(R.id.date)
        private val content : TextView = itemView.findViewById(R.id.content)
        private val outputFormat = DateTimeFormatter.ofPattern("MMM d, yyyy, hh:mm:ss a")
        fun bind(message: Message) {
            name.text = message.poster
            val instant = Instant.parse(message.date)
            val localDateTime = LocalDateTime.ofInstant(instant, ZoneId.of("UTC"))
            date.text = outputFormat.format(localDateTime)
            content.text = message.content

        }
    }
}