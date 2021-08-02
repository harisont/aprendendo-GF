package bho.harisont.gfdemo

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_main.*
import org.grammaticalframework.pgf.*


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        sentence.text = "Hello Everyone!" // manually edit text

        // edit text with GF
        val grammar = PGF.readPGF(assets.open("Hello.pgf")) // still causes trouble even if it compiles
    }
}