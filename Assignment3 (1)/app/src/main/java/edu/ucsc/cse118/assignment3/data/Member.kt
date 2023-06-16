package edu.ucsc.cse118.assignment3.data

import kotlinx.serialization.Serializable

@Serializable
data class Member (
  val name: String,
  val role: String,
  val email: String,
  val id: String,
  val accessToken: String,
)

