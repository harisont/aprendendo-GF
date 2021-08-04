package bho.harisont.gfdemo

import kotlinx.android.synthetic.main.activity_main.*
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import org.grammaticalframework.pgf.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // change TextView content manually
        sentence.text = "Hello everyone!"

        // change TextView content with GF
        val grammar = PGF.readPGF(assets.open("Hello.pgf"))
    }
}