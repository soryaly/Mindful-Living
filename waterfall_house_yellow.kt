// Imports 
import android.content.Context
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.annotation.LayoutRes
import androidx.appcompat.app.AppCompatActivity

// Activity
class MindfulLivingActivity : AppCompatActivity() {
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_mindful_living)
        
        //UI Setup
        initUI()
    }
    
    //Initialize UI
    private fun initUI(){
        //Setup toolbar 
        val toolbar = findViewById<Toolbar>(R.id.mindful_living_toolbar)
        setSupportActionBar(toolbar)
        supportActionBar?.title = "Mindful Living"
        supportActionBar?.setDisplayHomeAsUpEnabled(true)
    }
    
    //Inflate Layout 
    private fun inflateLayout(@LayoutRes layout:Int, parent: ViewGroup? = null, attachToRoot:Boolean = false): View {
        return LayoutInflater.from(this).inflate(layout, parent, attachToRoot)
    }
 
    //Logging 
    private fun logError(message: String){
        Log.e("MindfulLivingActivity", message)
    }
    
    private fun logInfo(message: String){
        Log.i("MindfulLivingActivity", message)
    }
    
    private fun logDebug(message: String){
        Log.d("MindfulLivingActivity", message)
    }
    
    //SharedPreferences 
    private fun saveDataToSharedPreferences(key:String, data:String){
        val sharedPreferences = getPreferences(Context.MODE_PRIVATE)
        val editor = sharedPreferences.edit()
        editor.putString(key, data)
        editor.apply()
    }
    
    private fun getDataFromSharedPreferences(key:String) : String? {
        val sharedPreferences = getPreferences(Context.MODE_PRIVATE)
        return sharedPreferences.getString(key, null)
    }
    
    //ListViews Setup
    private fun setupListViews(){
        //Setting up the ListView
        listView.adapter = ListViewAdapter(this, dataList)
    }
    
    //RecyclerView Setup
    private fun setupRecyclerView(){
        //Setting up the RecyclerView
        recyclerView.layoutManager = LinearLayoutManager(this)
        recyclerView.adapter = RecyclerViewAdapter(this, dataList)
    }
    
    //Network Calls 
    private fun fetchDataFromAPI(url:String, authorization:String){
        val client = OkHttpClient()
        
        val request = Request.Builder()
        .url(url)
        .addHeader("Authorization", authorization)
        .build()
        
        client.newCall(request).enqueue(object : Callback {

            override fun onFailure(call: Call, e: IOException) {
                //Handle Error
                logError(e.localizedMessage)
            }

            override fun onResponse(call: Call, response: Response) {
                //Handle successful Response
                logDebug("Data fetched successfully from API")
            }
        })
    }
    
    
    //Dialog setup
    private fun showDialog(){
        val dialog = Dialog(this)
        dialog.setCancelable(true)
        dialog.setContentView(R.layout.dialog_mindful_living)
        
        //All the view components inside dialog 
        val btnOk = dialog.findViewById<Button>(R.id.btn_ok)
        val tvMessage = dialog.findViewById<TextView>(R.id.tv_message)
        
        btnOk.setOnClickListener{v ->
            //Do something on button click
            dialog.dismiss()
        }
    }
    
    //Notifications 
    private fun showNotification(){
        //Notification Channel for Oreo and above devices 
        val channelId = "com.mindfulliving.notification"
        val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        val importance = NotificationManager.IMPORTANCE_HIGH
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(channelId, "Mindful Living", importance)
            notificationManager.createNotificationChannel(channel)
        }
        
        //Notification Builder 
        val notificationBuilder = NotificationCompat.Builder(this, channelId)
            .setSmallIcon(R.mipmap.ic_launcher)