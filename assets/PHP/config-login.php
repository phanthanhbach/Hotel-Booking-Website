<?php
    session_start();

    $client = new Google\Client();
    $client->setClientId('814610287644-0rjtnqijppfs43g7lc8as6873790idri.apps.googleusercontent.com');
    $client->setClientSecret('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');
    $client->setRedirectUri('http://localhost:8080/aloha/home.html');
    $client->addScope('email');
    $client->addScope('profile');

    $check = 0;
        // authenticate code from Google OAuth Flow
    if (isset($_GET['code'])) {  // rồi nó check url coi có cái get đó k, có thì nó làm
        $token = $client->fetchAccessTokenWithAuthCode($_GET['code']);
        $client->setAccessToken($token['access_token']);
        
        // get profile info
        $google_oauth = new Google\Service\Oauth2($client);
        $google_account_info = $google_oauth->userinfo->get();
        $email =  $google_account_info->email;
        $name =  $google_account_info->name;
        $check = 1; 
    } else {
        $url = $client->createAuthUrl(); 
    }
?>
