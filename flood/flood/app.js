<!DOCTYPE html>
<html>
<head>
    <title>Firebase Data Fetcher</title>
</head>
<body>
    <h2>Firebase Auth & Data</h2>
    <div id="status">Checking authentication...</div>
    <pre id="data-display">Data will appear here...</pre>

    <script type="module">
        import { initializeApp } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-app.js";
        import { getAuth, signInWithEmailAndPassword, onAuthStateChanged } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-auth.js";
        import { getDatabase, ref, get, child } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-database.js";

        // Your Configuration
        const firebaseConfig = {
            apiKey: "AIzaSyCwbAvPWJA9iPpJXFyb5osGHD001lT2ve0",
            authDomain: "resqtech-929a9.firebaseapp.com",
            databaseURL: "https://resqtech-929a9-default-rtdb.firebaseio.com",
            projectId: "resqtech-929a9",
            storageBucket: "resqtech-929a9.firebasestorage.app",
            messagingSenderId: "147944644317",
            appId: "1:147944644317:web:089abbe2e66e9a7644c534"
        };

        // Initialize
        const app = initializeApp(firebaseConfig);
        const auth = getAuth(app);
        const db = getDatabase(app);

        // 1. Sign In
        signInWithEmailAndPassword(auth, "giannamartinkunnassery@gmail.com", "qwerty")
            .then((userCredential) => {
                document.getElementById('status').innerText = "Logged in as: " + userCredential.user.email;
                fetchData();
            })
            .catch((error) => {
                document.getElementById('status').innerText = "Login Failed: " + error.message;
            });

        // 2. Fetch Data
        function fetchData() {
            const dbRef = ref(db);
            // Replace 'your_data_node' with the actual path in your database
            get(child(dbRef, `/`)).then((snapshot) => {
                if (snapshot.exists()) {
                    document.getElementById('data-display').textContent = JSON.stringify(snapshot.val(), null, 2);
                } else {
                    document.getElementById('data-display').textContent = "No data available at this path.";
                }
            }).catch((error) => {
                console.error(error);
                document.getElementById('data-display').textContent = "Error: Check your Security Rules.";
            });
        }
    </script>
</body>
</html>