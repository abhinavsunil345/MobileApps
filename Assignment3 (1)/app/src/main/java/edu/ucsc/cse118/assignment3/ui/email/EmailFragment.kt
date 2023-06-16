package edu.ucsc.cse118.assignment3.ui.email

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import androidx.lifecycle.Observer
import edu.ucsc.cse118.assignment3.data.Message
import edu.ucsc.cse118.assignment3.databinding.FragmentEmailBinding
import edu.ucsc.cse118.assignment3.model.SharedViewModel
import edu.ucsc.cse118.assignment3.model.ViewModelEvent
import java.time.Instant
import java.time.LocalDateTime
import java.time.ZoneId
import java.time.format.DateTimeFormatter

class EmailFragment: Fragment() {

    private lateinit var binding: FragmentEmailBinding
    private val sharedViewModel: SharedViewModel by activityViewModels()

    private val errorObserver = Observer<ViewModelEvent<String>> { event ->
        var error = event.getUnhandledContent()
        if (error != null) {
            Toast.makeText(context, "Error: $error", Toast.LENGTH_LONG).show()
        }
    }
    private val emailObserver = Observer<ViewModelEvent<Message>> { event ->
        val email = event.getUnhandledContent()
        val outputFormat = DateTimeFormatter.ofPattern("MMM d, yyyy, hh:mm:ss a")
        if (email != null) {
            (activity as AppCompatActivity?)!!.supportActionBar!!.title = email.poster
            val instant = Instant.parse(email.date)
            val localDateTime = LocalDateTime.ofInstant(instant, ZoneId.of("UTC"))
            binding.date.text = outputFormat.format(localDateTime)
            binding.content.text = email.content
        }
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        sharedViewModel.error.observe(this, errorObserver)
        sharedViewModel.message.observe(this, emailObserver)
    }
    override fun onDestroy() {
        super.onDestroy()
        sharedViewModel.error.removeObserver(errorObserver)
        sharedViewModel.message.removeObserver(emailObserver)
    }
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        binding = FragmentEmailBinding.inflate(inflater, container, false)
        return binding.root
    }
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        (activity as AppCompatActivity?)!!.supportActionBar!!.title = sharedViewModel.message.value?.getRawContent()?.poster
    }
}