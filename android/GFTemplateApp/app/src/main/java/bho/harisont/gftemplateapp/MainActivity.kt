package bho.harisont.gftemplateapp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import kotlinx.android.synthetic.main.activity_main.*
import org.grammaticalframework.pgf.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // change greeting manually
        greeting.text = "Hello Everyone!"

        // change greeting with GF
        val grammar = PGF.readPGF(assets.open("Hello.pgf"))
        greeting.text = grammar.abstractName
        // grammar.generateAll(grammar.startCat) //does not work for no apparent reason
        // 2021-08-18 19:41:17.763 10799-10799/bho.harisont.gftemplateapp A/t.gftemplateap: java_vm_ext.cc:570] JNI DETECTED ERROR IN APPLICATION: JNI NewObjectV called with pending exception java.lang.NoSuchMethodError: no non-static method "Lorg/grammaticalframework/pgf/ExprIterator;.<init>(Lorg/grammaticalframework/pgf/PGF;JJJ)V"
    }
}