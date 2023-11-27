function getUserInfo() {
        var access_token = localStorage.getItem('access_token'); // Retrieve the access token from localStorage

        // Make the GET request to the userinfo endpoint
        $.ajax({
            url: 'https://api.asgardeo.io/t/autoreservehub/oauth2/userinfo',
            method: 'GET',
            headers: {
                'Authorization': 'Bearer ' + access_token
            },
            success: function (response) {
                // Handle the userinfo response here
                console.log('Userinfo:', response);

                var userName = response.name;
                var email = response.email;
                var number = response.phone_number;
                
                 // Update HTML content with user information
            $('#userName').text(userName);
            $('#email').text(email);
            $('#phoneNumber').text(phoneNumber);
                
            },
            error: function (error) {
                // Handle errors here
                console.error('Error:', error);
            }
        });
    }

    // Call the getUserInfo function when the page loads or wherever it's appropriate in your application
    getUserInfo();