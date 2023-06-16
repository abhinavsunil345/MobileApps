package edu.ucsc.cse118.assignment3.ui.workspace


import edu.ucsc.cse118.assignment3.data.Workspace

interface WorkspacesListener {
    fun onClick(workspace: Workspace)
}
