package edu.ucsc.cse118.assignment3

import android.widget.Button
import androidx.recyclerview.widget.RecyclerView
import androidx.test.espresso.Espresso.onView
import androidx.test.espresso.Espresso.pressBack
import androidx.test.espresso.action.ViewActions.click
import androidx.test.espresso.assertion.ViewAssertions.matches
import androidx.test.espresso.contrib.RecyclerViewActions.actionOnItemAtPosition
import androidx.test.espresso.contrib.RecyclerViewActions.scrollToPosition
import androidx.test.espresso.matcher.ViewMatchers.*
import androidx.test.ext.junit.rules.ActivityScenarioRule
import androidx.test.ext.junit.runners.AndroidJUnit4
import androidx.test.filters.LargeTest
import com.adevinta.android.barista.assertion.BaristaEnabledAssertions.assertDisabled
import com.adevinta.android.barista.assertion.BaristaVisibilityAssertions.assertDisplayed
import com.adevinta.android.barista.interaction.BaristaClickInteractions.clickOn
import com.adevinta.android.barista.interaction.BaristaEditTextInteractions.typeTo
import com.adevinta.android.barista.internal.viewaction.SwipeActions.swipeRight
import edu.ucsc.cse118.assignment3.TestHelper.waitForText
import org.hamcrest.Matchers.equalToIgnoringCase
import org.hamcrest.Matchers.not

import org.junit.Test
import org.junit.Rule
import org.junit.runner.RunWith

@RunWith(AndroidJUnit4::class)
@LargeTest
class AdvancedandStrechTest {
    /**
     * Create and launch the activity under test before each test,
     * and close it after each test.
     */
    @get:Rule
    var activityScenarioRule = ActivityScenarioRule(MainActivity::class.java)

    // Change these three lines ONLY
    private val cruzid = "molly@cse118.com"
    private val name = "Molly Member"
    private val password = "molly"

    private fun login() {
        typeTo(R.id.email, cruzid)
        typeTo(R.id.password, password)
        clickOn("LOGIN")
    }
    private fun construction() {
        login()
        waitForText("Construction")
        clickOn("Construction")
    }
    private fun roofing() {
        construction()
        waitForText("Roofing (Metal)")
        clickOn("Roofing (Metal)")
    }
    private fun documentary() {
        movies()
        waitForText("Documentary")
        clickOn("Documentary")
    }
    private fun romance() {
        movies()
        waitForText("Romance")
        clickOn("Romance")
    }
    private fun drama() {
        movies()
        waitForText("Drama")
        clickOn("Drama")
    }
    private fun paving() {
        construction()
        waitForText("Asphalt Paving")
        clickOn("Asphalt Paving")
    }
    private fun movies() {
        login()
        waitForText("Movies")
        clickOn("Movies")
    }

    @Test
    fun paving_add() {
        paving()
        assertDisplayed(R.id.fab)
        clickOn(R.id.fab)
        typeTo(R.id.content, "This is a sample email, so that I can test this hhhhh")
        //chat gpt gave me this line on how to click on a button just with text
        onView(withText("Add")).perform(click())
        waitForText(name)
    }
    @Test
    fun add_button_disabled() {
        paving()
        assertDisplayed(R.id.fab)
        clickOn(R.id.fab)
        typeTo(R.id.content, "aaaaaaaaaaaaaaa")
       // assertDisabled(R.id.add)

        //chat gpt helped me with this and gave me the imports
        onView(withText(equalToIgnoringCase("add"))).check(matches(not(isEnabled())))
    }

    @Test
    fun back_button() {
        paving()
        assertDisplayed(R.id.fab)
        clickOn(R.id.fab)
        pressBack()
        waitForText("Chastity Caseborne")
    }

    @Test
    fun paving_add_snackbar() {
        paving()
        assertDisplayed(R.id.fab)
        clickOn(R.id.fab)
        typeTo(R.id.content, "This is a sample email, so that I can test this hhhhh")
        //chat gpt gave me this line on how to click on a button just with text
        onView(withText("Add")).perform(click())
        waitForText("Message Created")
    }
    @Test
    fun roofing_add_count_check() {
        roofing()
        assertDisplayed(R.id.fab)
        clickOn(R.id.fab)
        typeTo(R.id.content, "This is a sample email, so that I can test this hhhhh")
        //chat gpt gave me this line on how to click on a button just with text
        onView(withText("Add")).perform(click())
        waitForText("Message Created")
        pressBack()
        waitForText("11 Messages")

    }
    @Test
    fun documentary_delete_count_check() {
        documentary()
        assertDisplayed(R.id.fab)
        clickOn(R.id.fab)
        typeTo(R.id.content, "This is a sample email, so that I can test this hhhhh")
        //chat gpt gave me this line on how to click on a button just with text
        onView(withText("Add")).perform(click())
        waitForText("Message Created")
        pressBack()
        waitForText("33 Messages")
        waitForText("Documentary")
        clickOn("Documentary")
        val recyclerView = onView(withId(R.id.recyclerview))
        recyclerView.perform(scrollToPosition<RecyclerView.ViewHolder>(0))
        recyclerView.perform(actionOnItemAtPosition<RecyclerView.ViewHolder>(0, swipeRight()))
        clickOn("Yes")
        waitForText("Message Deleted")
        pressBack()
        waitForText("32 Messages")
    }
    @Test
    fun paving_delete_snackbar() {
        paving()
        assertDisplayed(R.id.fab)
        clickOn(R.id.fab)
        typeTo(R.id.content, "This is a sample email, so that I can test this hhhhh")
        //chat gpt gave me this line on how to click on a button just with text
        onView(withText("Add")).perform(click())
        waitForText("Message Created")
        val recyclerView = onView(withId(R.id.recyclerview))
        recyclerView.perform(scrollToPosition<RecyclerView.ViewHolder>(0))
        recyclerView.perform(actionOnItemAtPosition<RecyclerView.ViewHolder>(0, swipeRight()))
        clickOn("Yes")
        waitForText("Message Deleted")
    }
    @Test
    fun romance_delete_not_yours() {
        romance()
        val recyclerView = onView(withId(R.id.recyclerview))
        recyclerView.perform(scrollToPosition<RecyclerView.ViewHolder>(0))
        recyclerView.perform(actionOnItemAtPosition<RecyclerView.ViewHolder>(0, swipeRight()))
        waitForText("Dacy Grinsted")
    }
    @Test
    fun drama_not_delete_count_check() {
        drama()
        assertDisplayed(R.id.fab)
        clickOn(R.id.fab)
        typeTo(R.id.content, "This is a sample email, so that I can test this hhhhh")
        //chat gpt gave me this line on how to click on a button just with text
        onView(withText("Add")).perform(click())
        waitForText("Message Created")
        pressBack()
        waitForText("49 Messages")
        waitForText("Drama")
        clickOn("Drama")
        val recyclerView = onView(withId(R.id.recyclerview))
        recyclerView.perform(scrollToPosition<RecyclerView.ViewHolder>(0))
        recyclerView.perform(actionOnItemAtPosition<RecyclerView.ViewHolder>(0, swipeRight()))
        clickOn("No")
        waitForText(name)
        pressBack()
        waitForText("49 Messages")
    }

}