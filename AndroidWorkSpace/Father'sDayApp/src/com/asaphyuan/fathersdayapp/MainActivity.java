package com.asaphyuan.fathersdayapp;

import java.util.Random;

import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

public class MainActivity extends ActionBarActivity {

	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        // Declare our View variables
        final TextView messageLabel = (TextView) findViewById(R.id.textView1);
        Button getMessageButton = (Button) findViewById(R.id.button1);
        final ImageView backgroundImg = (ImageView) findViewById(R.id.imageView1);

        //getMessageButton.setOnLongClickListener(new View.OnLongClickListener() {
		getMessageButton.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				String[] messages = {
						"Thanks for cooking yummy food all the time-Joyce",
						"You love us unconditionally-Faith",
						"You show us what it looks like to follow God no matter the cost-Joyce",
						"You help us reach our full potential-Faith",
						"You stand by us in whatever we choose-Faith",
						"You care for our needs-Faith",
						"You are the best father ever, yeah-Faith",
						"Thanks for being encouraging and supportive-Joyce",
						"I appreciate how you add salt to the food-Asaph",
						"Thanks challenging and pushing me out of my box-Asaph",
						"You're a great father because you are able to do what needs to be done so that the rest of the family can be betteh-Paul"};
				String[] pics = {
						"joyce",
						"faith",
						"joyce",
						"faith",
						"faith",
						"faith",
						"faith",
						"joyce",
						"asaph",
						"asaph",
						"paul"};
				// Button was clicked, so update label with message
				String message = "";
				//Randomly select a message
				Random randomGenerator = new Random();
				int randomNumber = randomGenerator.nextInt(messages.length);
				message = messages[randomNumber];
				//update the label with a dynamic message
				messageLabel.setText(message);
				//update background img
				
				int[] images = new int[11];
				images[0] = R.drawable.joyce;
				images[1] = R.drawable.faith;
				images[2] = R.drawable.joyce;
				images[3] = R.drawable.faith;
				images[4] = R.drawable.faith;
				images[5] = R.drawable.faith;
				images[6] = R.drawable.faith;
				images[7] = R.drawable.joyce;
				images[8] = R.drawable.asaph;
				images[9] = R.drawable.asaph;
				images[10] = R.drawable.paul;
				backgroundImg.setImageResource(images[randomNumber]);
				
				//backgroundImg.setImageDrawable(getResources().getDrawable(R.drawable.pics[randomNumber]));
				
			    AlphaAnimation fadeInAnimation = new AlphaAnimation(0,1);
			    fadeInAnimation.setDuration(1500);
			    fadeInAnimation.setFillAfter(true);
			    messageLabel.setAnimation(fadeInAnimation);
			}
		});

    }

    
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
