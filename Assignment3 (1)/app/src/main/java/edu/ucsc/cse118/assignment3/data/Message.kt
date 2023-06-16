package edu.ucsc.cse118.assignment3.data

import kotlinx.serialization.Serializable
import java.util.Date

@Serializable
data class Message (
    val id: String,
    val poster: String,
    var date: String,
    val content: String
)