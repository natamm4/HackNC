  
  function submitLogin() {
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    // Handle login logic here, e.g., form submission or authentication
    alert(`Username: ${username}\nPassword: ${password}`);
  }

  function toggleLoginForm() {
    const loginForm = document.getElementById('loginForm');
    const aboutInfo = document.getElementById('aboutinfo');
    
    // Hide the about info if it's visible
    aboutInfo.style.display = 'none';
    
    // Toggle login form visibility
    loginForm.style.display = loginForm.style.display === 'flex' ? 'none' : 'flex';
  }
  
  function toggleAboutInfo() {
    const aboutInfo = document.getElementById('aboutinfo');
    const loginForm = document.getElementById('loginForm');
    
    // Hide the login form if it's visible
    loginForm.style.display = 'none';
    
    // Toggle about info visibility
    aboutInfo.style.display = aboutInfo.style.display === 'block' ? 'none' : 'block';
  }

  //chatgpt used for java script help