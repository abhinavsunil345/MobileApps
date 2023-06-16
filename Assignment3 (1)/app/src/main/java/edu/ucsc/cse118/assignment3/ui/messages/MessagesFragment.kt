package edu.ucsc.cse118.assignment3.ui.messages
// alot of the itemtouchhelper code was based on examples provided by chatgpt
import android.app.AlertDialog
import android.graphics.Canvas
import edu.ucsc.cse118.assignment3.ui.messages.MessagesAdapter
import edu.ucsc.cse118.assignment3.ui.messages.MessagesListener


import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import edu.ucsc.cse118.assignment3.R
import edu.ucsc.cse118.assignment3.model.SharedViewModel
import edu.ucsc.cse118.assignment3.model.ViewModelEvent
import edu.ucsc.cse118.assignment3.databinding.FragmentMessagesBinding
import androidx.navigation.fragment.findNavController
import androidx.recyclerview.widget.ItemTouchHelper
import com.google.android.material.floatingactionbutton.FloatingActionButton
import com.google.android.material.snackbar.Snackbar
import edu.ucsc.cse118.assignment3.data.Message
import java.text.SimpleDateFormat
import java.util.*
import kotlin.collections.ArrayList

class MessagesFragment : Fragment(), MessagesListener {
    private val sharedViewModel: SharedViewModel by activityViewModels()
    private lateinit var recyclerView: RecyclerView

    private val errorObserver = Observer<ViewModelEvent<String>> { event ->
        val error = event.getUnhandledContent()
        if (error != null) {
            Toast.makeText(context, "Error: $error", Toast.LENGTH_LONG).show()
        }
    }
    private val messagesObserver = Observer<ArrayList<Message>> { messages ->
        recyclerView.adapter = MessagesAdapter(messages, this)
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        sharedViewModel.error.observe(this, errorObserver)
        sharedViewModel.messages.observe(this, messagesObserver)
    }
    override fun onDestroy() {
        super.onDestroy()
        sharedViewModel.error.removeObserver(errorObserver)
        sharedViewModel.messages.removeObserver(messagesObserver)
    }
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        val fragmentBinding = FragmentMessagesBinding.inflate(inflater, container, false)
        return fragmentBinding.root
    }
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        recyclerView = view.findViewById(R.id.recyclerview)
        itemTouchHelper.attachToRecyclerView(recyclerView)
        recyclerView.layoutManager = LinearLayoutManager(activity)
        recyclerView.adapter = MessagesAdapter(arrayListOf(), this)
        sharedViewModel.getMessages()
      //  sharedViewModel.convertDates()
        (activity as AppCompatActivity?)!!.supportActionBar!!.title = sharedViewModel.channel.value?.getRawContent()?.name
        val fab: FloatingActionButton = view.findViewById(R.id.fab)
        fab.setOnClickListener {
            findNavController().navigate(R.id.action_messagesFragment_to_createFragment)
        }
    }
    override fun onClick(message: Message) {
        sharedViewModel.setMessage(message)
        findNavController().navigate(R.id.action_messagesFragment_to_emailFragment)
    }
    val itemTouchHelper = ItemTouchHelper(
        object : ItemTouchHelper.SimpleCallback(
            0,
            ItemTouchHelper.RIGHT
        ) {
            override fun onMove(
                recyclerView: RecyclerView,
                viewHolder: RecyclerView.ViewHolder,
                target: RecyclerView.ViewHolder
            ): Boolean {
                // Not implemented here
                return false
            }
    //chatgpt generated this function, just made some marginal changes
            override fun getMovementFlags(
                recyclerView: RecyclerView,
                viewHolder: RecyclerView.ViewHolder
            ): Int {
                val position = viewHolder.adapterPosition
                val adapter = recyclerView.adapter as MessagesAdapter
                sharedViewModel.setMessage(adapter.getItem(position))
                return if (sharedViewModel.message.value?.getRawContent()?.poster == sharedViewModel.member.value?.name) {
                    makeMovementFlags(0, ItemTouchHelper.RIGHT)
                } else {
                    makeMovementFlags(0, 0)
                }
            }

            override fun onSwiped(viewHolder: RecyclerView.ViewHolder, direction: Int) {
                // Remove the swiped item from the adapter and notify the adapter of the change
                val position = viewHolder.adapterPosition
                val adapter = recyclerView.adapter as MessagesAdapter
                sharedViewModel.setMessage(adapter.getItem(position))
                if (sharedViewModel.message.value?.getRawContent()?.poster == sharedViewModel.member.value?.name) {

                    //adapter.removeItem(position)
                    val builder = AlertDialog.Builder(context)
                    builder.setTitle("Confirmation")
                    builder.setMessage("Delete Message\n From ${(activity as AppCompatActivity?)!!.supportActionBar!!.title}?")
                    builder.setPositiveButton("Yes") { dialog, which ->
                        sharedViewModel.deleteMessage()
                        adapter.removeItem(position)
                        val snack = Snackbar.make(
                            viewHolder.itemView,
                            "Message Deleted",
                            Snackbar.LENGTH_SHORT
                        )
                        snack.show()
                    }
                    builder.setNegativeButton("No") { dialog, which ->
                        adapter.notifyItemChanged(position)
                        dialog.dismiss()
                    }
                    val dialog = builder.create()
                    dialog.show()
                }
                else {
                    adapter.notifyItemChanged(position)
                }
            }
        })
}
