package edu.ucsc.cse118.assignment3.ui.channels

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
import edu.ucsc.cse118.assignment3.data.Channel

class ChannelsAdapter(private val channels: List<Channel>, private val listener: ChannelsListener) :
    RecyclerView.Adapter<ChannelsAdapter.ChannelViewHolder>()
{
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ChannelViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.card_view_channel, parent, false)
        return ChannelViewHolder(view)
    }

    override fun onBindViewHolder(holder: ChannelViewHolder, position: Int) {
        holder.bind(channels[position])
        holder.itemView.setOnClickListener { listener.onClick(channels[position]) }
    }

    override fun getItemCount(): Int {
        return channels.size
    }


    class ChannelViewHolder(ItemView: View) : RecyclerView.ViewHolder(ItemView) {
        private val name: TextView = itemView.findViewById(R.id.name)
        private val messages : TextView = itemView.findViewById(R.id.messages)

        fun bind(channel: Channel) {
            name.text = channel.name
            messages.text = channel.messages.toString() + " Messages"
        }
    }
}