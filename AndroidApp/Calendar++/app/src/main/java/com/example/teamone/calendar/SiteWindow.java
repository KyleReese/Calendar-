package com.example.teamone.calendar;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;


/**
 * Created by porter on 4/17/17.
 */

public class SiteWindow extends AppCompatActivity{
    private WebView myWebView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.site_window);
        myWebView = (WebView)findViewById(R.id.webview);
        WebSettings webSettings = myWebView.getSettings();
        webSettings.setJavaScriptEnabled(true);
        myWebView.loadUrl("https://calendarplusplus.herokuapp.com/");
        myWebView.setWebViewClient(new WebViewClient());

    }

    @Override
    public void onBackPressed() {
        if(myWebView.canGoBack()){
            myWebView.goBack();
        } else {
            super.onBackPressed();
        }
    }



}
